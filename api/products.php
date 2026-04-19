<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "upshop");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed"]));
}

$search = isset($_GET["search"]) ? $conn->real_escape_string($_GET["search"]) : "";
$category = isset($_GET["category"]) ? intval($_GET["category"]) : 0;

$sql = "
    SELECT p.*, c.name AS category_name
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    WHERE 1=1
";

if ($search !== "") {
    $sql .= " AND p.name LIKE '%$search%'";
}

if ($category > 0) {
    $sql .= " AND p.category_id = $category";
}

$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);

$conn->close();
?>