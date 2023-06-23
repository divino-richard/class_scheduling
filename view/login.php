<?php
    require_once '../controllers/UserContr.php';
    $user_contr = new UserContr();

    if(isset($_POST["login"])){
        $user_contr->login($_POST["username"], $_POST["password"]);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/login.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Login credentials</title>
</head>
<body>
    <div class="container">
        <div class="form_container">
            <div class="form_header">
                <img src="../public/img/NEMSU.png" alt="">
                <h1>Class Scheduling System</h1>
            </div>

            <form action="" method="POST">
                <h3>Login credentials</h3>
                <!-- ERROR POPUP MESSAGE -->
                <?php
                    if(!empty($user_contr->login_error)){
                        echo '
                            <div style="color:red; margin-bottom: 5px">
                            '. $user_contr->login_error .'
                            </div>
                        ';
                    }
                ?>

                <div class="input_wrapper">
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="username" placeholder="username" required>
                </div>
                <div class="input_wrapper">
                    <i class="fa-solid fa-key"></i>
                    <input type="password" name="password" placeholder="password" required>
                </div>

                <input type="submit" name="login" value="Login">
            </form>
        </div>
    </div>
</body>
</html>