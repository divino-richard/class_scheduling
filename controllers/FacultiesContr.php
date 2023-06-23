<?php
require_once "../models/FacultiesModel.php";
require_once "../controllers/UserContr.php";
require_once "../models/CourseModel.php";
require_once "../controllers/DesignationContr.php";

class FacultiesContr extends FacultiesModel{
    public function add_faculty(){
        $designation_contr = new DesignationContr();
        $user_contr = new UserContr();
        
        // PREPARING INPUT DATA
        $faculty_data = array(
            'fac_id'            => $_POST["fac_id"], 
            'fname'             => $_POST["fname"], 
            'mname'             => $_POST["mname"], 
            'lname'             => $_POST["lname"], 
            'address'           => $_POST["address"], 
            'sex'               => $_POST["sex"], 
            'marital_stat'      => $_POST["marital_stat"], 
            'contact'           => $_POST["contact"], 
            'vaccinated'        => $_POST["vaccinated"],
            'educ_qualification'=> $_POST["educ_qualification"], 
            'qual_major'        => $_POST["qual_major"], 
            'eligibility_prc'   => $_POST["eligibility_prc"], 
            'position'          => $_POST["position"]
        );

        if(empty($this->read_faculty_by_ID($_POST["fac_id"]))){
            // PASS THE DATA TO THE MODEL
            if($this->create_faculty($faculty_data)){
                // ADD TO THE BRIGDE TABLE
                $this->create_course_faculty(array(
                    'course_id' => $_POST["course_id"], 
                    'fac_id'    => $_POST["fac_id"]
                ));

                //ADD FACULTY DESIGNATION IF ONE OR MORE WAS SELECTED
                if(isset($_POST["designation"])){
                    foreach($_POST["designation"] as $designation_id){
                        $designation_contr->add_faculty_designation($_POST["fac_id"], $designation_id);
                    }

                    // GET THE ID OF THE DESIGNATION WHERE TITLE IS "Program Coordinator"
                    $program_oordinator_id = $designation_contr->get_program_coordinator_id();

                    if(!empty($program_oordinator_id)){
                        // IF FACULTY IS A PROGRAM COORDINATOR THEN GENERATE A USER ACC FOR HIM
                        if(in_array($program_oordinator_id, $_POST["designation"])){
                            if(empty($user_contr->get_user_by_fac_id($faculty_data["fac_id"]))){
                                // GENERATE ACCOUNT
                                $this->generate_account($faculty_data);
                                header("Location: faculties.php");
                            }
                        }
                    }
                    header("Location: faculties.php");
                }

                header("Location: faculties.php");
            }
        }else{
            echo "<script>alert('Faculty already exist')</script>";
        }
    }

    public function get_faculties(){
        return $this->read_faculties();
    }

    public function get_faculty_by_ID($id){
        return $this->read_faculty_by_ID($id);
    }

    // GET ALL FUCULTIES ACCORDING TO COURSE ID
    public function get_fac_by_crsID($id){
        return $this->read_fac_by_crsID($id);
    }

    public function get_fac_by_collID($id){
        return $this->read_fac_by_collID($id);
    }

    public function get_department_chair($course_id){
        $designation_contr = new DesignationContr();

        // GET ALL THE FACULTIES OF THE GIVEN COURSE
        $faculties = $this->read_fac_by_crsID($course_id);
        foreach($faculties as $faculty){
            // GET ALL THE DESIGNATION OF THE CURRENT FACULTY THEN LOOP THROUGH
            foreach($designation_contr->read_faculty_designations($faculty["fac_id"]) as $designation){
                // IF THE CURRENT FACULTY HAS A DESIGNATION OF PROGRAM COORDINATOR THEN RETURN THE FACULTY
                if(strtoupper($designation["designation_title"]) == "DEPARTMENT CHAIR"){
                    return $faculty;
                }
            }
        }
        return;
    }

    public function search_faculty($search_term){
        return $this->read_faculty_by_term($search_term);
    }

    public function edit_faculty($data){
        $designation_contr = new DesignationContr();
        $user_contr = new UserContr();
        $faculty_data = (array) json_decode($data);

        if($this->update_faculty($faculty_data)){
            // DELETE ALL DESIGNATIONS
            if($this->delete_faculty_designations($faculty_data["fac_id"])){
                // EXTRACT THE FACULTY DESIGNATIONS
                foreach($faculty_data["designations"] as $designation_id){
                    // INSERT THE NEW DESIGNATIONS
                    $this->create_faculty_designation($faculty_data["fac_id"], $designation_id);

                    // IF DESIGANATION IS A PROGRAM COORDINATOR THEN CREATE AN ACCOUNT FOR THAT FACULTY
                    if($designation_id === $designation_contr->get_program_coordinator_id()){
                        // CREATE USER ACCOUNT IF NOT EXIST
                        if(empty($user_contr->get_user_by_fac_id($faculty_data["fac_id"]))){
                            // GENERATE ACCOUNT
                            $this->generate_account($faculty_data);
                        }
                    }
                }
                return true;
            }
        }
    }

    public function generate_account($faculty_data){
        // USER MODEL INSTANCE
        $user_contr = new UserContr();

        // GENERATE A username
        $full_name = $faculty_data["fname"]." ".$faculty_data["lname"];
        $username = "";
        while(true){
            $username = $this->gen_username($full_name);
            if(empty($user_contr->get_user_by_uname($username))){
                break;
            }
        }

        // THE FACULTY ID IS THE DEFAULT PASSWORD OF A PROGRAM COORDINATOR
        $password = md5($faculty_data["fac_id"]);

        $user_contr->add_account(array(
            "user_id" => uniqid(),
            "fac_id" => $faculty_data["fac_id"],
            "fname" => $faculty_data["fname"],
            "mname" => $faculty_data["mname"],
            "lname" => $faculty_data["lname"],
            "username" => $username,
            "password" => $password,
            "user_type" => "Program coordinator"
        ));
    }

    public function gen_username($string){
        $pattern = " ";
        $firstPart = strstr(strtolower($string), $pattern, true);
        $secondPart = substr(strstr(strtolower($string), $pattern, false), 0,3);
        $nrRand = rand(100, 999);
        
        $username = trim($firstPart).trim($secondPart).trim($nrRand);
        return $username;
    }

    public function delete_faculty_now($faculty_id, $course_id){
        try{
            if($this->delete_course_faculty($faculty_id, $course_id)){
                $this->delete($faculty_id);
                return true;
            }
        }catch(PDOException $e){
            return false;
        }
    }
}
