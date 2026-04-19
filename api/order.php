<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "upshop");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed"]));
}

$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !isset($data["customer_name"]) || !isset($data["items"])) {
    die(json_encode(["error" => "Invalid input"]));
}

$customer_name = $conn->real_escape_string($data["customer_name"]);
$items = $data["items"];

$total = 0;
foreach ($items as $item) {
    $total += $item["price"] * $item["quantity"];
}

$sql = "INSERT INTO orders (customer_name, total) VALUES ('$customer_name', $total)";
if (!$conn->query($sql)) {
    die(json_encode(["error" => "Failed to create order"]));
}

$order_id = $conn->insert_id;

foreach ($items as $item) {
    $product_id = intval($item["product_id"]);
    $quantity = intval($item["quantity"]);
    $price = floatval($item["price"]);

    $sql = "INSERT INTO order_items (order_id, product_id, quantity, price)
            VALUES ($order_id, $product_id, $quantity, $price)";
    $conn->query($sql);

    $sql = "UPDATE inventory
            SET quantity = quantity - $quantity
            WHERE product_id = $product_id";
    $conn->query($sql);
}

echo json_encode([
    "message" => "Order created successfully",
    "order_id" => $order_id
]);

$conn->close();
?>