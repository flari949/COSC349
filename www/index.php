<!DOCTYPE html>
<html lang="en">

    <head>
        <style>
        </style>
        <title>Web Database</title>
    </head>

    <body>

        <?php
            session_start();
            // Check if success message in the URL query parameter
            if (isset($_GET['success']) && $_GET['success'] === 'connected') {
                $hideForm = true;
                if (isset($_SESSION['dbdata'])) {
                    $result = $_SESSION['dbdata'];
                    // Create table to display database information
                    echo '<table style="border: 1px solid; width: 100%; border-collapse: collapse;">';
                    echo '<tr><th style="border: 1px solid; padding: 8px;">-- Name --</th>
                        <th style="border: 1px solid; padding: 8px;">-- Description --</th>
                        <th style="border: 1px solid; padding: 8px;">-- Address --</th></tr>';
                    foreach ($result as $row) {
                        echo '<tr><td style="border: 1px solid; padding: 8px; text-align: center;">'.$row["name"].
                        '</td><td style="border: 1px solid; padding: 8px;">'.$row["description"].
                        '</td><td style="border: 1px solid; padding: 8px; text-align: center;"><a href="'.$row["address"].
                        '">'.$row["address"].'</td></tr>';
                    }
                    echo '</table>';
                } else {
                    echo "No query results available!";
                }
            }
        ?>

        <?php if (!$hideForm): ?>
            <!-- Get user login credentials - display form only if $hideForm is false -->
            <form action="process_login.php" method="post">
                Username:<input type="text" name="username" required><br>
                Password: <input types="password" name="password" required><br>
                <input type="submit" value="Login">
            </form>
        <?php endif; ?>

        <?php
        // Check if error message in the URL query parameter
        if (isset($_GET['error']) && $_GET['error'] === 'connection') {
            echo '<p style="color: red;">Error: Invalid Credentials. Please try again.</p>';
        };
        ?>
    </body>

</html>