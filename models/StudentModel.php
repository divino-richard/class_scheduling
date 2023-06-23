<?php
require_once "../config/Dbh.php";

class StudentModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function read_enrolled_students_by_term($search_term, $sem, $course_id){
        $sql = "SELECT SEC.Stud_id, SEC.s_year, SEC.sem, SEC.year, S.fname, S.mname, S.lname, S.ext_name
                FROM `students_enrolled_course` AS SEC
                INNER JOIN `students` AS S ON S.Stud_id = SEC.Stud_id
                WHERE SEC.Stud_id LIKE ? AND SEC.sem=? AND SEC.course_id=? LIMIT 10";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(["%$search_term%", $sem, $course_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}


