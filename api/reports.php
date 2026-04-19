<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "upshop");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed"]));
}

$days = isset($_GET["days"]) ? intval($_GET["days"]) : 90;
if ($days <= 0) {
    $days = 90;
}

/*
    1. Top products by revenue
*/
$top_sql = "
    SELECT 
        p.product_id,
        p.name,
        SUM(oi.quantity * oi.price) AS revenue,
        SUM(oi.quantity) AS units_sold
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.created_at >= DATE_SUB(NOW(), INTERVAL $days DAY)
    GROUP BY p.product_id, p.name
    ORDER BY revenue DESC
";
$top_result = $conn->query($top_sql);

$top_products = [];
while ($row = $top_result->fetch_assoc()) {
    $top_products[] = $row;
}

/*
    2. Daily sales totals
*/
$sales_sql = "
    SELECT 
        DATE(created_at) AS sale_date,
        SUM(total) AS daily_total,
        COUNT(*) AS orders_count
    FROM orders
    WHERE created_at >= DATE_SUB(NOW(), INTERVAL $days DAY)
    GROUP BY DATE(created_at)
    ORDER BY sale_date ASC
";
$sales_result = $conn->query($sales_sql);

$daily_sales = [];
while ($row = $sales_result->fetch_assoc()) {
    $daily_sales[] = $row;
}

/*
    3. Low stock warning
*/
$low_stock_sql = "
    SELECT 
        p.product_id,
        p.name,
        i.quantity,
        i.reorder_level
    FROM inventory i
    JOIN products p ON i.product_id = p.product_id
    WHERE i.quantity <= i.reorder_level
    ORDER BY i.quantity ASC
";
$low_stock_result = $conn->query($low_stock_sql);

$low_stock = [];
while ($row = $low_stock_result->fetch_assoc()) {
    $low_stock[] = $row;
}

/*
    Return everything as one JSON object
*/
echo json_encode([
    "days" => $days,
    "top_products" => $top_products,
    "daily_sales" => $daily_sales,
    "low_stock" => $low_stock
]);

$conn->close();
?>