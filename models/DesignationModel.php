<?php
require_once "../config/Dbh.php";

class DesignationModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_designation($data){
        $sql = "INSERT INTO `designation`(`designation_id`, `designation_title`, `deloading`) VALUES (?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["designation_id"], $data["designation_title"], $data["deloading"]]);
        return true;
    }

    public function create_faculty_designation($faculty_id, $designation_id){
        $sql = "INSERT INTO `faculty_designation`(`fac_id`, `designation_id`) VALUES (?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id, $designation_id]);
        return true;
    }

    public function read_designations(){
        $sql = "SELECT * FROM `designation`";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_faculty_designations($fac_id){
        $sql = "SELECT * FROM `faculty_designation` fd
                LEFT JOIN `designation` d ON d.designation_id = fd.designation_id
                WHERE `fac_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$fac_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_designation($title){
        $sql = "SELECT * FROM `designation` WHERE `designation_title`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$title]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_designation_by_term($search_term){
        $sql = "SELECT * FROM `designation` WHERE `designation_title` LIKE ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["%$search_term%"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function update_designation($designation_data){
        $sql = "UPDATE `designation` SET `designation_title`=?, `deloading`=? WHERE `designation_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$designation_data->designation_title, $designation_data->deloading, $designation_data->designation_id]);
        return true;
    }

    public function delete($designation_id){
        $sql = "DELETE FROM `designation` WHERE `designation_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$designation_id]);
    }
}