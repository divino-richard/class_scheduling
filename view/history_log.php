<?php 
    require_once "../models/HistoryLogModel.php";
    $hl_model = new HistoryLogModel();
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
    <link rel="stylesheet" href="../public/css/history_log.css">
    <title>History Log</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>
            <div class="history_container">
                <section class="acces_logs">
                    <h3>Access Logs</h3>

                    <?php 
                    foreach($hl_model->read_access_log() as $log){
                        ?>
                        <div class="log_wrapper">
                            <b><span><?php echo date("F j, Y, g:i a", strtotime($log["date"]));?></span></b>
                            <div class="info">
                                <span><b>Name:</b> <?php echo $log["fname"].' ' .$log["mname"]. ' '. $log["lname"];?></span>
                                <span><b>Username:</b> <?php echo $log["username"];?></span>
                                <span><b>Type:</b> <?php echo $log["user_type"];?></span>
                                <span><b>IP address:</b> <?php echo $log["ip"];?></span>
                                <span><b>User agent:</b> <?php echo $log["user_agent"];?></span>
                                <span><b>Url:</b> <?php echo $log["url"];?></span>
                            </div>
                            <div class="circle"></div>
                        </div>
                        <?php
                    }
                    ?>
                </section>

                <section class="login_history">
                    <h3>Login History</h3>

                    <?php 
                    foreach($hl_model->read_login_history() as $login_history){
                        ?>
                        <div class="login_history_wrapper">
                            <b><span><?php echo date("F j, Y, g:i a", strtotime($login_history["date"]));?></span></b>
                            <div class="info">
                                <span><b>Status:</b> <?php echo strtoupper($login_history["status"]);?></span>
                                <span><b>IP address:</b> <?php echo $login_history["ip"];?></span>
                                <span><b>User agent:</b> <?php echo $login_history["user_agent"];?></span>
                            </div>
                            <div class="circle"></div>
                        </div>
                        <?php
                    }
                    ?>
                </section>
            </div>
        </div>
    </div>

    <script src="../public/js/general.js"></script>
</body>
</html>


