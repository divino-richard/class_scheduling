<?php
require_once "../config/Dbh.php";

class CourseModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_course($data){
        $sql = "INSERT INTO `course`(`course_id`, `coll_id`, `crs_code`, `crs_desc`, `major`) VALUES (?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["course_id"], $data["coll_id"], $data["crs_code"], $data["crs_desc"], $data["major"] ]);
        return true;
    }

    public function read_courses(){
        $sql = "SELECT * FROM `course` C INNER JOIN college CL ON CL.coll_id = C.coll_id ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_course_by_ID($id){
        $sql = "SELECT * FROM `course` INNER JOIN college ON college.coll_id = course.coll_id WHERE course_id = ? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    public function read_courses_by_coll_ID($id){
        $sql = "SELECT * FROM `course` WHERE coll_id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_program_coordinator($course_id){
        $sql = "SELECT * FROM `course_faculty` CF
            INNER JOIN faculty F ON F.fac_id = CF.fac_id
            INNER JOIN faculty_designation FD ON FD.fac_id = F.fac_id
            LEFT JOIN designation D ON D.designation_id = FD.designation_id
            WHERE `course_id`= ? AND `designation_title`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, "Program Coordinator"]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_course_by_fac_ID($id){
        $sql = "SELECT course_id FROM `course_faculty` WHERE fac_id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function update_course($course_data){
        $sql = "UPDATE `course` SET `coll_id`=?,`crs_code`=?,`crs_desc`=?,`major`=? WHERE `course_id`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $course_data->coll_id,
            $course_data->crs_code,
            $course_data->crs_desc,
            $course_data->major,
            $course_data->course_id
        ]);
        return true;
    }

    public function delete($course_id){
        $sql = "DELETE FROM `course` WHERE `course_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id]);
    }
}