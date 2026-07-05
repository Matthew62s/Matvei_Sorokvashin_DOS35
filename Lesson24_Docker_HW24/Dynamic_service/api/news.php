<?php

header("Content-Type: application/json");

try {
    $pdo = new PDO(
        "pgsql:host=postgres;port=5432;dbname=postgres",
        "pguser",
        "hello_world@3"
    );

    $stmt = $pdo->query("
        SELECT title, text
        FROM news
        ORDER BY id DESC
        LIMIT 20
    ");

    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));

} catch (Exception $e) {
    echo json_encode([
        "error" => $e->getMessage()
    ]);
}
