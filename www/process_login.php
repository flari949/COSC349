<?php

$user = $_POST['username'];
$pass = $_POST['password'];

// Connect to mysql database server with provided login info
$conn = new mysqli("192.168.56.12", $user, $pass);

if ($conn->connect_error) {
    header("Location: login.php?error=connection");
    exit;
}

echo "Connection Successful!";

$conn->close();

?>