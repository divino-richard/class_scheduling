<?php 
session_start();

$session_expire_time = 15; // session timeout in 15 seconds
if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity']) > ($session_expire_time)) {
    // session has expired, log out the user
    session_unset();
    session_destroy();
    echo json_encode(["session_expired" => true]);
    exit;
} else {
    // session is still active, update last activity time
    $_SESSION['last_activity'] = time();
    echo json_encode(["session_expired" => false]);
}