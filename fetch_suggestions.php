<?php
session_start();
include 'db.php';

if (isset($_POST['query']) && isset($_POST['type'])) {
    $query = $_POST['query'];
    $type = $_POST['type'];

    // Prepare the SQL query based on the type
    if ($type === 'email') {
        $stmt = $pdo->prepare("SELECT email AS value FROM users WHERE email LIKE ? LIMIT 5");
    } else {
        $stmt = $pdo->prepare("SELECT phone AS value FROM users WHERE phone LIKE ? LIMIT 5");
    }

    $like_query = '%' . $query . '%';
    $stmt->execute([$like_query]);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $suggestions = '';
    foreach ($results as $result) {
        $suggestions .= '<div class="suggestion-item">' . htmlspecialchars($result['value']) . '</div>';
    }

    echo $suggestions ? $suggestions : '<div>No suggestions found</div>';
}
?>