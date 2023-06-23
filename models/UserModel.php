<?php

require_once "../config/Dbh.php";

class UserModel extends Dbh {
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }
    public function create_user($data){
        $sql = "INSERT INTO `users`(`user_id`, `fac_id`, `fname`, `mname`, `lname`, `username`, `password`, `user_type`) VALUES (?,?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data["user_id"],
            $data["fac_id"],
            $data["fname"],
            $data["mname"],
            $data["lname"],
            $data["username"],
            $data["password"],
            $data["user_type"]
        ]);
        return true;
    }
    public function creat_staff($data){
        $sql = "INSERT INTO `users`(`user_id`, `fname`, `mname`, `lname`, `ext`, `username`, `password`, `user_type`) VALUES (?,?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data["user_id"],
            $data["fname"],
            $data["mname"],
            $data["lname"],
            $data["ext"],
            $data["username"],
            $data["password"],
            $data["user_type"]
        ]);
        return true;
    }

    public function update_staff($data){
        $sql = "UPDATE `users` SET `fname`=?, `mname`=?, `lname`=?, `ext`=? WHERE `user_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data->fname,
            $data->mname,
            $data->lname,
            $data->ext,
            $data->user_id
        ]);
        return true;
    }

    public function delete_staff($staff_id){
        $sql = "DELETE FROM `users` WHERE `user_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$staff_id]);
    }

    public function read_users(){
        $sql = "SELECT `user_id`, `fac_id`, `fname`, `mname`, `lname`, `username`, `user_type` FROM users WHERE `user_type` != ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["admin"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function read_user_by_uname($uname){
        $sql = "SELECT * FROM users WHERE username=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$uname]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function read_user_by_fac_id($fac_id){
        $sql = "SELECT * FROM users WHERE fac_id=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$fac_id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function read_staff(){
        $sql = "SELECT * FROM users WHERE user_type=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["staff"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function update_password($uname, $pass){
        $sql = "UPDATE `users` SET `password`=? WHERE `username`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$pass, $uname]);
        return true;
    }

    
}


