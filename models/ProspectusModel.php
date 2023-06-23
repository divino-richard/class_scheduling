<?php
require_once "../config/Dbh.php";

class ProspectusModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_prospectus($revision_year, $course_id){
        $sql = "INSERT INTO `prospectus`(`revision_year`, `course_id`) VALUES (?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$revision_year, $course_id]);
        return true;
    }

    public function create_prospec_details($data){
        $sql = "INSERT INTO `prospectus_detail`(`course_id`, `revision_year`, `subject_code`, `year`, `sem`) VALUES (?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$data["course_id"], $data["revision_year"], $data["subject_code"], $data["year"], $data["sem"]]);
        return true;
    }

    public function read_prospectus_by_rev_year($course_id, $revision_year){
        $sql = "SELECT * FROM `prospectus` WHERE course_id = ? and revision_year = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $revision_year]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_all_prospectus($course_id){
        $sql = "SELECT * FROM `prospectus` WHERE `course_id` = ? ORDER BY `revision_year` DESC" ;
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_latest_prospectus($course_id){
        $sql = "SELECT course_id, MAX(`revision_year`) AS revision_year FROM `prospectus`WHERE `course_id` = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_prospectus_detail($course_id, $revision_year){
        $sql = "SELECT * FROM `prospectus_detail` WHERE course_id = ? AND revision_year = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $revision_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_pros_det_by_crs_and_subCode($course_id, $subject_code){
        $sql = "SELECT * FROM `prospectus_detail` WHERE course_id = ? && subject_code = ? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $subject_code]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function create_subject($data){
        $sql = "INSERT INTO `subject`(`subject_code`, `course_id`, `title`, `lec_hr`, `lab_hr`, `units`, `pre_requisites`)
                VALUES (?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data['subject_code'],  $data['course_id'],
            $data['title'],         $data["lec_hr"],
            $data["lab_hr"],        $data["units"],
            $data["pre_requisites"]
        ]);
        return true;
    }

    public function read_subjects(){
        $sql = "SELECT * FROM `subject` INNER JOIN course ON course.course_id = subject.course_id";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_subject_by_code($sub_code){
        $sql = "SELECT * FROM `subject` WHERE `subject_code` = ? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$sub_code]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function update_prospectus_status($course_id, $revision_year, $status){
        $sql = "UPDATE `prospectus` SET `status`= ? WHERE `course_id`=? AND `revision_year`=? ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$status, $course_id, $revision_year]);
        return true;
    }

    public function update_subject($subject){
        $sql = "UPDATE `subject` SET `title`=?,`lec_hr`=?,`lab_hr`=?,`units`=?,`pre_requisites`=? WHERE `subject_code`=? AND `course_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$subject["title"], $subject["lec_hr"], $subject["lab_hr"], $subject["units"], $subject["pre_requisites"], $subject["subject_code"], $subject["course_id"]]);
        return true;
    }

    public function delete_prospectus_detail($course_id, $revision_year , $subject_code){
        $sql = "DELETE FROM `prospectus_detail` WHERE `course_id`=? AND `revision_year`=? AND `subject_code`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $revision_year, $subject_code]);
    }
}

