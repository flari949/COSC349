<?php

$user = $_POST['username'];
$pass = $_POST['password'];

// Connect to mysql database server with provided login info
$conn = new mysqli("192.168.56.11", $user, $pass, "mydatabase");

// If connection failed, send login page error value
if ($conn->connect_error) {
    header("Location: index.php?error=connection");
    exit;
}

// Create SQL query and get result
$sql = "SELECT * FROM websites";
$result = $conn->query($sql);

// Create session for global variable and save SQL query results
session_start();

if ($result->num_rows > 0) {
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    $_SESSION['dbdata'] = $data;
} else {
    $_SESSION['dbdata'] = array();
}

header("Location: index.php?success=connected");

// Close database connection
$conn->close();
?>