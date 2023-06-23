
<?php
require_once "../models/StudentModel.php";

class StudentContr extends StudentModel{
    public function suggest_enrolled_students($search_term, $sem, $course_id){
        return $this->read_enrolled_students_by_term($search_term, $sem, $course_id);
    }
}



