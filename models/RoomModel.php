<?php
require_once "../config/Dbh.php";

class RoomModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_room($rm_data){
        $sql = "INSERT INTO `rooms` (`rm_id`, `building`, `type`, `status`) VALUES (?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$rm_data["room_id"], $rm_data["building"], $rm_data["type"], $rm_data["status"]]);
        return true;
    }

    public function read_room_by_ID($id){
        $sql = "SELECT * FROM `rooms` WHERE `rm_id` = ? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_rooms(){
        $sql = "SELECT * FROM `rooms`";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_usable_rooms(){
        $sql = "SELECT * FROM `rooms` WHERE `status` = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["usable"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_room_by_term($search_term){
        $sql = "SELECT * FROM `rooms` WHERE `rm_id` LIKE ? OR `building` LIKE ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["%$search_term%", "%$search_term%"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } 

    public function update_room($rm_data){
        $sql = "UPDATE `rooms` SET `building`=?, `type`=?, `status`=? WHERE `rm_id` = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$rm_data->building, $rm_data->type, $rm_data->status, $rm_data->room_id]);
        return true;
    }

    public function delete($room_id){
        $sql = "DELETE FROM `rooms` WHERE `rm_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$room_id]);
    }
}