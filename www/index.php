<!DOCTYPE html>
<html lang="en">

<head>
    <title>Web Database</title>
</head>

<body>
    <!-- Get user login credentials -->
    <form action="process_login.php" method="post">
        Name:<input type="text" name="username" required><br>
        Password:<input types="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>

    <?php
    // Check if error message in the URL query parameter
    if (isset($_GET['error']) && $_GET['error'] === 'connection') {
        echo '<p style="color: red;">Error: Invalid Credentials. Please try again.</p>';
    }
    ?>
</body>

</html>