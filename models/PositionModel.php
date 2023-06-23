<?php
require_once "../config/Dbh.php";

class PositionModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_position($data){
        $sql = "INSERT INTO `position`(`position_id`, `position_title`, `min_load`, `max_load`, `status`) VALUES (?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["position_id"], $data["position_title"], $data["min_load"], $data["max_load"], $data["status"]]);
        return true;
    }

    public function read_positions(){
        $sql = "SELECT * FROM `position`";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_position_by_term($search_term){
        $sql = "SELECT * FROM `position` WHERE `position_title` LIKE ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["%$search_term%"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function update_position($position_data){
        $sql = "UPDATE `position` SET `position_title`=?,`min_load`=?,`max_load`=?,`status`=? WHERE position_id=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $position_data->position_title,
            $position_data->min_load, 
            $position_data->max_load,
            $position_data->status,
            $position_data->position_id
        ]);
        return true;
    }

    public function delete($position_id){
        $sql = "DELETE FROM `position` WHERE `position_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$position_id]);
    }
}