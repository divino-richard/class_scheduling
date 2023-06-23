<?php
session_start();

require_once "../controllers/ProspectusContr.php";
$prospectus_contr = new ProspectusContr();

require_once "../models/ScheduleModel.php";
$sched = new ScheduleModel();

require_once "../controllers/ScheduleContr.php";
$sched_contr = new ScheduleContr();

require_once "../controllers/FacultiesContr.php";
$faculty_contr = new FacultiesContr();

require_once "../controllers/CollegeContr.php";
$college_contr = new CollegeContr();

require_once "../controllers/CourseContr.php";
$course_contr = new CourseContr();

require_once "../controllers/RoomContr.php";
$room_contr = new RoomContr();

require_once "../controllers/DesignationContr.php";
$designation_contr = new DesignationContr();

require_once "../controllers/PositionContr.php";
$position_contr = new PositionContr();

require_once "../controllers/UserContr.php";
$user_contr = new UserContr();

require_once "../controllers/StudentContr.php";
$student_contr = new StudentContr();

require_once "../controllers/SignatoryContr.php";
$signatory_contr = new SignatoryContr();

// HANDLE POST REQUEST
if($_SERVER["REQUEST_METHOD"] == "POST"){
    if(isset($_POST["action"])){
        switch(strtoupper($_POST["action"])){
            case "INSERT_OFFERED_SEM":
                if(isset($_POST["payload"])){
                    $schedules = json_decode($_POST["payload"]);
                    foreach($schedules as $schedule){
                        $sched->create_schedule($schedule);
                    }
                    echo json_encode(["type" => "success", "msg" => "Saved successfully!"]);
                }
                break;

            case "ADD_SUBJECT":
                $subject = (array) json_decode($_POST["subject"]);
                $prospectus_details = (array) json_decode($_POST["prospectus_details"]);
                $add_subject_response = $prospectus_contr->add_subject($subject, $prospectus_details );
                // SEND RESPONSE
                echo json_encode($add_subject_response);
                break;

            case "CHANGE_INSTRUCTOR":
                if(isset($_POST["program_code"]) && isset($_POST["faculty_id"])){
                    if($sched->update_schedule($_POST["program_code"], $_POST["faculty_id"])){
                        echo json_encode(["type" => "success", "msg" => "Instructor updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to update instructor"]);
                    }
                }
                break;
            
            case "EDIT_ROOM":
                if(isset($_POST["room_data"])){
                    if($room_contr->edit_room($_POST["room_data"])){
                        echo json_encode(["type" => "success", "msg" => "Room updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;

            case "EDIT_DESIGNATION":
                if(isset($_POST["designation_data"])){
                    if($designation_contr->edit_designation($_POST["designation_data"])){
                        echo json_encode(["type" => "success", "msg" => "Designation updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;
            
            case "EDIT_POSITION":
                if(isset($_POST["position_data"])){
                    if($position_contr->edit_position($_POST["position_data"])){
                        echo json_encode(["type" => "success", "msg" => "Position updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;
            
            case "EDIT_FACULTY":
                if(isset($_POST["faculty_data"])){
                    if($faculty_contr->edit_faculty($_POST["faculty_data"])){
                        echo json_encode(["type" => "success", "msg" => "Faculty updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;
            
            case "EDIT_COURSE":
                if(isset($_POST["course_data"])){
                    if($course_contr->edit_course($_POST["course_data"])){
                        echo json_encode(["type" => "success", "msg" => "Course updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;

            case "EDIT_COLLEGE":
                if(isset($_POST["college_data"])){
                    if($college_contr->edit_college($_POST["college_data"])){
                        echo json_encode(["type" => "success", "msg" => "College updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;

            case "EDIT_SUBJECT":
                if(isset($_POST["subject_data"])){
                    if($prospectus_contr->edit_subject($_POST["subject_data"])){
                        echo json_encode(["type" => "success", "msg" => "Subject updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;

            case "EDIT_SIGNATORY":
                if(isset($_POST["signatory_data"])){
                    if($signatory_contr->edit_signatory($_POST["signatory_data"])){
                        echo json_encode(["type" => "success", "msg" => "Signatory updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;

            case "EDIT_STAFF":
                if(isset($_POST["staff_data"])){
                    if($user_contr->edit_staff($_POST["staff_data"])){
                        echo json_encode(["type" => "success", "msg" => "Staff updated successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Edit Failed"]);
                    }
                }
                break;

            case "DELETE_SCHEDULE":
                if(isset($_POST["program_code"]) && isset($_POST["password"])){
                    // CONFIRM THE PASSWORD OF THE USER
                    if(md5($_POST["password"]) === $_SESSION["user"]["password"]){
                        // DELETE THE SCHEDULE
                        if($sched->delete_schedule($_POST["program_code"])){
                            echo json_encode(["type" => "success", "msg" => "Schedule deleted successfully!"]);
                        }else {
                            echo json_encode(["type" => "error", "msg" => "Failed to delete schedule"]);
                        }
                    }else{
                        echo json_encode(["type" => "error", "msg" => "Password Incorrect"]);
                    }
                }
                break;

            case "DELETE_COLLEGE":
                if(isset($_POST["college_id"])){
                    if($college_contr->delete_college_now($_POST["college_id"])){
                        echo json_encode(["type" => "success", "msg" => "College deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete college"]);
                    }
                }
                break;

            case "DELETE_COURSE":
                if(isset($_POST["course_id"])){
                    if($course_contr->delete_course_now($_POST["course_id"])){
                        echo json_encode(["type" => "success", "msg" => "Course deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete course"]);
                    }
                }
                break;
                
            case "DELETE_POSITION":
                if(isset($_POST["position_id"])){
                    if($position_contr->delete_position_now($_POST["position_id"])){
                        echo json_encode(["type" => "success", "msg" => "Position deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete position"]);
                    }
                }
                break;

            case "DELETE_DESIGNATION":
                if(isset($_POST["designation_id"])){
                    if($designation_contr->delete_designation_now($_POST["designation_id"])){
                        echo json_encode(["type" => "success", "msg" => "Designation deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete designation"]);
                    }
                }
                break;

            case "DELETE_FACULTY":
                if(isset($_POST["faculty_id"]) && isset($_POST["course_id"])){
                    if($faculty_contr->delete_faculty_now($_POST["faculty_id"], $_POST["course_id"])){
                        echo json_encode(["type" => "success", "msg" => "Faculty deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete faculty"]);
                    }
                }
                break;

            case "DELETE_ROOM":
                if(isset($_POST["room_id"])){
                    if($room_contr->delete_room_now($_POST["room_id"])){
                        echo json_encode(["type" => "success", "msg" => "Room deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete room"]);
                    }
                }
                break;

            case "DELETE_SUBJECT":
                if(isset($_POST["course_id"]) || isset($_POST["revision_year"]) || isset($_POST["subject_code"])){
                    if($prospectus_contr->deleteSubject($_POST["course_id"], $_POST["revision_year"], $_POST["subject_code"])){
                        echo json_encode(["type" => "success", "msg" => "Subject deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete this subject, it's may be added to the schedule."]);
                    }
                }
                break;

            case "DELETE_SIGNATORY":
                if(isset($_POST["id"])){
                    if($signatory_contr->delete_signatory_now($_POST["id"])){
                        echo json_encode(["type" => "success", "msg" => "Signatory deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete"]);
                    }
                }
                break;
            
            case "DELETE_STAFF":
                if(isset($_POST["staff_id"])){
                    if($user_contr->delete_staff_now($_POST["staff_id"])){
                        echo json_encode(["type" => "success", "msg" => "Staff deleted successfully!"]);
                    }else {
                        echo json_encode(["type" => "error", "msg" => "Failed to delete"]);
                    }
                }
                break;
                
            case "VERIFY_PASSWORD":
                if(isset($_POST["user"])){
                    if($user_contr->verify_account(json_decode($_POST["user"]))){
                        echo json_encode(["type" => "success", "msg" => "Verified"]);
                    }else{
                        echo json_encode(["type" => "error", "msg" => "Invalid credential!"]);
                    }
                }
                break;

            case "CHANGE_PASSWORD":
                if(isset($_POST["user"])){
                    if($user_contr->change_password(json_decode($_POST["user"]))){
                        echo json_encode(["type" => "error", "msg" => "Password changed successfully :)"]);
                    }else{
                        echo json_encode(["type" => "error", "msg" => "Something went wrong!"]);
                    }
                }
                break;

            case "CHECK_ROOM_AVAILABILITY":
                if(isset($_POST["room_id"]) && isset($_POST["sem"]) && isset($_POST["days"]) && isset($_POST["acad_year"]) && isset($_POST["timeslot"])){
                    $is_available = $sched_contr->check_room_availability($_POST["room_id"], $_POST["sem"], json_decode($_POST["days"]), $_POST["acad_year"], $_POST["timeslot"]);
                    if($is_available){
                        echo json_encode(["status" => true, "msg" => "Room is available"]);
                    }else{
                        echo json_encode(["status" => false, "msg" => "Room conflict detected"]);
                    }
                }
            
            case "CHECK_STUDENT_PER_SECTION_CONFLICT":
                if( isset($_POST["course_id"]) && isset($_POST["year"]) && isset($_POST["sem"]) &&
                    isset($_POST["section"]) && isset($_POST["days"]) && isset($_POST["acad_year"]) && isset($_POST["timeslot"])){

                    $is_available = $sched_contr->check_student_per_section_conflict($_POST["course_id"], $_POST["year"], $_POST["sem"],  $_POST["section"], json_decode($_POST["days"]), $_POST["acad_year"], $_POST["timeslot"]);
                    
                    if($is_available){
                        echo json_encode(["status" => true, "msg" => "No conflict for this section"]);
                    }else{
                        echo json_encode(["status" => false, "msg" => "Student conflict detected"]);
                    }
                }
                break;

            case "CHECK_INSTRUCTOR_CONFLICT":
                if(isset($_POST["fac_id"]) && isset($_POST["sem"]) && isset($_POST["days"]) && isset($_POST["acad_year"]) && isset($_POST["timeslot"])){
                    $conflict_sched = $sched_contr->check_instructor_conflict($_POST["fac_id"], $_POST["sem"], json_decode($_POST["days"]), $_POST["acad_year"], $_POST["timeslot"]);
                    if(empty($conflict_sched)){
                        echo json_encode(["status" => true, "msg" => "No conflict for this instructor"]);
                    }else{
                        echo json_encode(["status" => false, "msg" => $conflict_sched]);
                    }
                }
                break;
            case "REUSE_SCHEDULES":
                if(isset($_POST["course_id"]) && isset($_POST["acad_year"]) && isset($_POST["reused_in"])){
                    $reponse = $sched_contr->reuse_schedules($_POST["course_id"], $_POST["acad_year"], $_POST["reused_in"]);
                    echo json_encode($reponse);
                }
                break;
        }
    }
}

// HANDLE GET REQUEST
if($_SERVER["REQUEST_METHOD"] == "GET"){
    if(isset($_GET["action"])){
        switch(strtoupper($_GET["action"])){
            case "GET_PROSPECTUS":
                echo json_encode(
                    $prospectus_contr->get_prospectus($_GET["course_id"], $_GET["revision_year"])
                );
                break;

            case "GET_INSTRUCTORS_BY_COURSE":
                if(isset($_GET["course_id"])){
                    echo json_encode($faculty_contr->get_fac_by_crsID($_GET["course_id"]));
                }
                break;
            
            case "GET_INSTRUCTORS_BY_COLLEGE":
                if(isset($_GET["coll_id"])){
                    echo json_encode($faculty_contr->get_fac_by_collID($_GET["coll_id"]));
                }
                break;

            case "GET_ROOM_SCHEDULES":
                if(isset($_GET["room_id"]) && isset($_GET["sem"]) && isset($_GET["acad_year"]) ){
                    $room_schedules = $sched->read_room_schedules($_GET["room_id"], $_GET["sem"], $_GET["acad_year"]);
                    echo json_encode($room_schedules);
                }
                break;

            case "GET_SCHEDULE":
                if(isset($_GET["program_code"]) && isset($_GET["acad_year"]) ){
                    $schedule = $sched->read_schedule($_GET["program_code"], $_GET["acad_year"]);
                    echo json_encode($schedule);
                }
                break;

            case "GET_SCHEDULE_BY_SECTION":
                $schedule = $sched->read_section_schedules(
                    $_GET["course_id"],
                    $_GET["year"],
                    $_GET["sem"],
                    $_GET["section"],
                    $_GET["acad_year"]
                );
                echo json_encode($schedule);
                break;

            case "GET_INSTRUCTOR_SCHEDULES":
                if(isset($_GET["instructor_id"]) && isset($_GET["sem"]) && isset($_GET["acad_year"])){
                    echo json_encode($sched->read_faculty_schedules($_GET["instructor_id"], $_GET["sem"], $_GET["acad_year"]));
                }
                break;

            case "GET_SCHEDULES_BY_FACULTY_ID":
                if(isset($_GET["faculty_id"]) && isset($_GET["sem"]) && isset($_GET["acad_year"])){
                    echo json_encode($sched->read_schedules_by_facID($_GET["faculty_id"], $_GET["sem"], $_GET["acad_year"]));
                }
                break;

            case "GET_SCHED_SEM_AND_YEAR":
                if(isset($_GET["course_id"]) && isset($_GET["acad_year"])){
                    echo json_encode($sched->read_sched_sem_and_year($_GET["course_id"], $_GET["acad_year"]));
                }
                break;

            case "GET_FACULTY_LOADS":
                if(isset($_GET["faculty_id"]) && isset($_GET["acad_year"]) && isset($_GET["semester"]) && isset($_GET["load_type"])){
                    if($_GET["load_type"] == "regular"){
                        $regular = $sched->read_faculty_loads($_GET["faculty_id"], $_GET["semester"], $_GET["acad_year"], $_GET["load_type"]);
                        $merge = $sched->read_faculty_loads($_GET["faculty_id"], $_GET["semester"], $_GET["acad_year"], "merge");
                        $cleanMerge = [];
                        $subjectTracker = [];
                        foreach($merge as $m){
                            if(!in_array($m["subject_code"], $subjectTracker)){
                                array_push($cleanMerge, $m);
                                array_push($subjectTracker, $m["subject_code"]);
                            }
                        }
                        echo json_encode(array_merge($cleanMerge, $regular));
                    }else{
                        // GET THE LATEST PROSPECTUS
                        echo json_encode($sched->read_faculty_loads($_GET["faculty_id"], $_GET["semester"], $_GET["acad_year"], $_GET["load_type"]));
                    }
                }
                break;

            case "GET_ALL_COURSES":
                echo json_encode($course_contr->get_courses());
                break;

            case "GET_COURSE_BY_ID":
                if(isset($_GET["course_id"])){
                    echo json_encode($course_contr->get_course_by_ID($_GET['course_id']));
                }
                break;
            
            case "GET_ALL_COLLEGES":
                echo json_encode($college_contr->get_colleges());
                break;
            
            case "GET_FACULTY_DESIGNATIONS":
                if(isset($_GET["faculty_id"])){
                    echo json_encode($designation_contr->get_faculty_designations($_GET["faculty_id"]));
                }
                break;
            
            case "GET_PROGRAM_COORDINATOR":
                if(isset($_GET["course_id"])){
                    echo json_encode($course_contr->get_program_coordinator($_GET["course_id"]));
                }
                break;

            case "GET_STUDENT_SCHEDULE":
                if(isset($_GET["Stud_id"]) || isset($_GET["s_year"]) || isset($_GET["sem"]) || isset($_GET["course_id"])){
                    echo json_encode($sched->read_student_schedule($_GET["Stud_id"], $_GET["s_year"], $_GET["sem"], $_GET["course_id"]));
                }
                break;
            
            case "GET_CURRERNT_STUDENT_SCHEDULE":
                if(isset($_GET["course_id"]) || isset($_GET["year"]) || isset($_GET["sem"]) || isset($_GET["section"])){
                    echo json_encode($sched->read_current_student_schedule($_GET["course_id"], $_GET["year"], $_GET["sem"], $_GET["section"]));
                }
                break;

            case "GET_SINGEES":
                echo json_encode($signatory_contr->get_signatories());
                break;
                
            case "SEARCH_FACULTY":
                if(isset($_GET["search_term"])){
                    echo json_encode($faculty_contr->search_faculty($_GET["search_term"]));
                }else{
                    echo json_encode($faculty_contr->get_faculties());
                }
                break;

            case "SEARCH_ROOM":
                if(isset($_GET["search_term"])){
                    echo json_encode($room_contr->search_room($_GET["search_term"]));
                }else{
                    echo json_encode($room_contr->get_rooms());
                }
                break;

            case "SEARCH_DESIGNATION":
                if(isset($_GET["search_term"])){
                    echo json_encode($designation_contr->search_designation($_GET["search_term"]));
                }else{
                    echo json_encode($designation_contr->get_designations());
                }
                break;

            case "SEARCH_POSITION":
                if(isset($_GET["search_term"])){
                    echo json_encode($position_contr->search_position($_GET["search_term"]));
                }else{
                    echo json_encode($position_contr->get_positions());
                }
                break;
            case "SEARCH_ENROLLED_STUDENT":
                if(isset($_GET["search_term"]) && isset($_GET["sem"]) && isset($_GET["course_id"])){
                    echo json_encode($student_contr->suggest_enrolled_students($_GET["search_term"], $_GET["sem"], $_GET["course_id"]));
                }
                break;
        }
    }
}