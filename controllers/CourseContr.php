
<?php
require_once "../models/CourseModel.php";

class CourseContr extends CourseModel{
    public function add_course(){
        $course_id = uniqid();
        $data = array(
            "course_id" => $course_id,
            "coll_id"   => $_POST["coll_id"],
            "crs_code"  => $_POST["crs_code"],
            "crs_desc"  => $_POST["crs_desc"],
            "major"     => $_POST["major"]
        );
        if($this->create_course($data)){
            header("Location: course.php");
        }
    }
    public function get_courses(){
        return $this->read_courses();
    }
    public function get_course_by_ID($id){
        // RETURN THE COURSE WITH THE PASSED ID IF EXIST OTHERWISE REDIRECT TO THE HOME PAGE
        if(!empty($this->read_course_by_ID($id))){
            return $this->read_course_by_ID($id);
        }else{
            header("Location: ./");
        }
    }
    public function get_course_by_fac_ID($id){
        return $this->read_course_by_fac_ID($id);
    }
    public function get_college_courses($id){
        return $this->read_courses_by_coll_ID($id);
    } 
    public function edit_course($course_data){
        return $this->update_course(json_decode($course_data));
    }
    public function get_program_coordinator($course_id){
        return $this->read_program_coordinator($course_id);
    }
    public function delete_course_now($course_id){
        try{
            $this->delete($course_id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
}



