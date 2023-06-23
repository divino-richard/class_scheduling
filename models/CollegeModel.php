<?php
require_once "../config/Dbh.php";

class CollegeModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_college($data){
        $sql = "INSERT INTO `college`(`coll_id`, `coll_code`, `coll_desc`) 
                VALUES (?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["coll_id"], $data["coll_code"], $data["coll_desc"]]);
        return true;
    }

    public function create_dean($data){
        $sql = "INSERT INTO `dean`(`coll_id`, `name`, `degree`) 
                VALUES (?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["coll_id"], $data["name"], $data["degree"]]);
        return true;
    }

    public function read_colleges(){
        $sql = "SELECT * FROM `college` AS cl
                INNER JOIN `dean` AS dn WHERE dn.coll_id = cl.coll_id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function update_college($data){
        $sql = "UPDATE `college` SET `coll_code`=?,`coll_desc`=? WHERE `coll_id`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data->coll_code,
            $data->coll_desc,
            $data->coll_id
        ]);
        return true;
    }

    public function update_dean($data){
        $sql = "UPDATE `dean` SET `name`=?,`degree`=? WHERE `coll_id`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data->name,
            $data->degree,
            $data->coll_id
        ]);
        return true;
    }

    public function delete($college_id){
        $sql = "DELETE FROM `college` WHERE `coll_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$college_id]);
        return true;
    }
}