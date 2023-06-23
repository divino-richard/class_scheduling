<?php
    require_once "../controllers/UserContr.php";
    $user_contr = new UserContr(); // CONTROLLER INSTANCE
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/general.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <style>
        td{
            padding: .5rem 0;
        }
    </style>
    <title>Faculties</title>
</head>
<body>
    <div class="container">
        <?php 
            include '../includes/sidebar.php'; 
        ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <div class="table_container">
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>User name</th>
                            <th>Default Password</th>
                            <th>User type</th>
                        </tr>

                        <?php
                            foreach($user_contr->get_users() as $user){
                                $default_pass = $user["user_type"] == "staff" ? $user["user_id"] : $user["fac_id"];
                                echo'
                                    <tr>
                                        <td>'.$user["fname"].' ' .$user["mname"]. ' '. $user["lname"].'</td>
                                        <td>'.$user["username"].'</td>
                                        <td>'.$default_pass.'</td>
                                        <td>'.$user["user_type"].'</td>
                                    </tr>
                                ';
                            }
                        ?>
                    </table>
                </div>
            </div>
        </div>
    </div>  
    
    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/general.js"></script>
    <script>
        window.addEventListener('load', function() {
            this.setTimeout(() => {document.querySelector(".loader_container").style.display = "none"}, [1000])
        });
    </script>
</body>
</html>