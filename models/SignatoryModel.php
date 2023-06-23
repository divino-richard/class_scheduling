
<?php
require_once "../config/Dbh.php";

class SignatoryModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_signatory($data){
        $sql = "INSERT INTO `signatory` (`name`, `degree`, `designation`) VALUES (?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["name"], $data["degree"], $data["designation"]]);
        return true;
    }

    public function read_signatories(){
        $sql = "SELECT * FROM `signatory`";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function update_signatory($data){
        $sql = "UPDATE `signatory` SET `name`=?, `degree`=?, `designation`=? WHERE `id` = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data->name, $data->degree, $data->designation, $data->id]);
        return true;
    }

    public function delete($id){
        $sql = "DELETE FROM `signatory` WHERE `id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id]);
    }
}


