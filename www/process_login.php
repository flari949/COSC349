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
$sql = "SELECT * FROM rocks ORDER BY rating";
$result = $conn->query($sql);

// Create table to display database information
echo '<table border="1">';
echo '<tr><th>-- Rating --</th><th>-- Name --</th><th>-- Location --</th></tr>';
while ($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["rating"]."</td><td>".$row["name"]."</td><td>".$row["found"]."</td></tr>\n";
}
echo '</table>';
?>