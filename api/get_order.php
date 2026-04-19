<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "upshop");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed"]));
}

if (!isset($_GET["id"])) {
    die(json_encode(["error" => "Missing order id"]));
}

$order_id = intval($_GET["id"]);

$order_sql = "SELECT * FROM orders WHERE order_id = $order_id";
$order_result = $conn->query($order_sql);

if ($order_result->num_rows == 0) {
    die(json_encode(["error" => "Order not found"]));
}

$order = $order_result->fetch_assoc();

$items_sql = "
    SELECT oi.quantity, oi.price, p.name
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE oi.order_id = $order_id
";
$items_result = $conn->query($items_sql);

$items = [];
while ($row = $items_result->fetch_assoc()) {
    $items[] = $row;
}

echo json_encode([
    "order" => $order,
    "items" => $items
]);

$conn->close();
?>