<?php
require_once "../config/Dbh.php";

class FacultiesModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_faculty($data){
        $sql = "INSERT INTO `faculty`(`fac_id`, `fname`, `mname`, `lname`, `address`, `sex`, `marital_stat`, `contact`, `vaccinated`, `educ_qualification`, `qual_major`, `eligibility_prc`, `position`)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data['fac_id'], $data['fname'], $data["mname"], $data["lname"], $data["address"], $data["sex"], 
            $data["marital_stat"], $data["contact"], $data["vaccinated"], $data["educ_qualification"], $data["qual_major"],
            $data["eligibility_prc"], $data["position"]
        ]);
        return true;
    }

    public function create_course_faculty($data){
        $sql = "INSERT INTO `course_faculty`(`course_id`, `fac_id`) VALUES (?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["course_id"], $data["fac_id"]]);
        return true;
    }

    public function create_faculty_designation($faculty_id, $designation){
        $sql = "INSERT INTO `faculty_designation`(`fac_id`, `designation_id`) VALUES (?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id, $designation]);
        return true;
    }

    public function read_faculties(){
        $sql = "SELECT * FROM `course_faculty` cf
                LEFT JOIN `faculty` f ON cf.fac_id = f.fac_id
                LEFT JOIN `course` c ON c.course_id = cf.course_id 
                LEFT JOIN `college` cl ON cl.coll_id = c.coll_id ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_faculty_by_ID($id){
        $sql = "SELECT * FROM `faculty` f
                LEFT JOIN `course_faculty` cf ON cf.fac_id = f.fac_id
                LEFT JOIN `course` c ON c.course_id = cf.course_id
                LEFT JOIN `college` cl ON cl.coll_id = c.coll_id
                LEFT JOIN `dean` dn ON dn.coll_id = cl.coll_id 
                WHERE f.fac_id = ? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_program_coordinator($course_id){
        $sql = "SELECT * FROM `course_faculty` as cf LEFT JOIN `faculty` as f ON cf.fac_id = f.fac_id WHERE `course_id`=? and `designation`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, "Program coordinator"]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_fac_by_crsID($crsID){
        $sql = "SELECT * FROM `course_faculty` cf
                LEFT JOIN `faculty` f ON cf.fac_id = f.fac_id 
                LEFT JOIN `course` c ON c.course_id = cf.course_id
                LEFT JOIN `college` cl ON cl.coll_id = c.coll_id
                WHERE cf.course_id=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$crsID]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_fac_by_collID($coll_id){
        $sql = "SELECT * FROM `course_faculty` cf
                LEFT JOIN `course` c ON c.course_id = cf.course_id
                LEFT JOIN `college` cl ON cl.coll_id = c.coll_id
                LEFT JOIN `faculty` f ON cf.fac_id = f.fac_id 
                WHERE cl.coll_id=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$coll_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_faculty_by_term($search_term){
        $sql = "SELECT * FROM `course_faculty` cf
                LEFT JOIN `course` c ON c.course_id = cf.course_id
                LEFT JOIN `college` cl ON cl.coll_id = c.coll_id
                LEFT JOIN `faculty` f ON cf.fac_id = f.fac_id 
                WHERE f.fname LIKE ? or f.mname LIKE ? or f.lname LIKE ? or f.fac_id LIKE ? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["%$search_term%", "%$search_term%", "%$search_term%", "%$search_term%"]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function update_faculty($data){
        $sql = "UPDATE `faculty` SET `fname`=?,`mname`=?,`lname`=?,`address`=?,`sex`=?,`marital_stat`=?,`contact`=?,`vaccinated`=?,`educ_qualification`=?,`qual_major`=?,`eligibility_prc`=?,`position`=? WHERE `fac_id`= ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data["fname"],
            $data["mname"], 
            $data["lname"],
            $data["address"],
            $data["sex"],
            $data["marital_stat"],
            $data["contact"],
            $data["vaccinated"],
            $data["educ_qualification"],
            $data["qual_major"],
            $data["eligibility_prc"],
            $data["position"],
            $data["fac_id"]
        ]);
        return true;
    }

    public function delete_faculty_designations($faculty_id){
        $sql = "DELETE FROM `faculty_designation` WHERE `fac_id`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id]);
        return true;
    }

    public function delete_course_faculty($faculty_id, $course_id){
        $sql = "DELETE FROM `course_faculty` WHERE `fac_id`=? AND `course_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id, $course_id]);
        return true;
    }

    public function delete($faculty_id){
        $sql = "DELETE FROM `faculty` WHERE `fac_id`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id]);
    }
}



