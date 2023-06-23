<?php
require_once "../config/Dbh.php";

class HistoryLogModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_acces_log($log){
        $sql = "INSERT INTO `access_log`(`id`, `user_id`, `ip`, `user_agent`, `url`) 
                VALUES (?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([uniqid(), $log["user_id"], $log["ip"], $log["user_agent"], $log["url"]]);
        return true;
    }

    public function create_login_attempt($login_data){
        $sql = "INSERT INTO `login_history`(`id`, `ip`, `user_agent`, `status`) 
                VALUES (?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([uniqid(), $login_data["ip"], $login_data["user_agent"], $login_data["status"]]);
        return true;
    }

    public function read_access_log(){
        $sql = "SELECT * FROM `access_log` AS al
                INNER JOIN `users` AS u WHERE u.user_id = al.user_id ORDER BY al.date DESC";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_login_history(){
        $sql = "SELECT * FROM `login_history` ORDER BY date DESC";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}