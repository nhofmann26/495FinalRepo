<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "upshop");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed"]));
}

if (!isset($_GET['id'])) {
    die(json_encode(["error" => "Missing product id"]));
}

$id = intval($_GET['id']);

$sql = "
    SELECT p.*, i.quantity, i.reorder_level
    FROM products p
    JOIN inventory i ON p.product_id = i.product_id
    WHERE p.product_id = $id
";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $product = $result->fetch_assoc();
    echo json_encode($product);
} else {
    echo json_encode(["error" => "Product not found"]);
}

$conn->close();
?>