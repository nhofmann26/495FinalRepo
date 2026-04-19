<?php
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "upshop");

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed"]));
}

$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !isset($data["action"])) {
    die(json_encode(["error" => "Missing action"]));
}

$action = $data["action"];

if ($action === "recompute_totals") {
    $sql = "
        UPDATE orders o
        SET total = (
            SELECT COALESCE(SUM(oi.quantity * oi.price), 0)
            FROM order_items oi
            WHERE oi.order_id = o.order_id
        )
    ";

    if ($conn->query($sql)) {
        echo json_encode(["message" => "Order totals recomputed successfully"]);
    } else {
        echo json_encode(["error" => "Failed to recompute totals"]);
    }

} elseif ($action === "refresh_summary") {

    $summary_sql = "
        SELECT 
            COUNT(*) AS orders_last_90_days,
            COALESCE(SUM(total), 0) AS revenue_last_90_days
        FROM orders
        WHERE created_at >= DATE_SUB(NOW(), INTERVAL 90 DAY)
    ";

    $result = $conn->query($summary_sql);

    if ($result) {
        $summary = $result->fetch_assoc();
        echo json_encode([
            "message" => "90-day sales summary refreshed",
            "summary" => $summary
        ]);
    } else {
        echo json_encode(["error" => "Failed to refresh summary"]);
    }

} else {
    echo json_encode(["error" => "Invalid action"]);
}

$conn->close();
?>