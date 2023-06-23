<?php
    header("Location: ./view/");

    // $session_expire_time = 30; // session timeout in minutes
    // if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity']) > ($session_expire_time * 60)) {
    //     // session has expired, log out the user
    //     session_unset();
    //     session_destroy();
    //     header('Location: login.php');
    //     exit;
    // } else {
    //     // session is still active, update last activity time
    //     $_SESSION['last_activity'] = time();
    // }