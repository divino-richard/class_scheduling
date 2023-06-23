<?php
require_once "../models/ProspectusModel.php";

class ProspectusContr extends ProspectusModel{
    public function add_prospectus($course_id){
        $year1 = $_POST["year1"];
        $year2 = $_POST["year2"];
        $revision_year = $year1."-".$year2;

        if($year1 == $year2){
            echo "<script>alert('Invalid Revision Year $revision_year')</script>";
            return;
        }

        if($year1 > $year2) {
            echo "<script>alert('Invalid Revision Year $revision_year')</script>";
            return;
        }

        if($year2-1 != $year1){
            echo "<script>alert('Invalid Revision Year $revision_year')</script>";
            return;
        }
        if(!empty($this->read_prospectus_by_rev_year($course_id, $revision_year))){
            echo "<script>alert('$revision_year Already Exist!')</script>";
            return;
        }

        if($this->create_prospectus($revision_year, $course_id)){
            echo "<script>alert('Prospectus Added Successsfully!')</script>";
        }
    } 

    /**
     * GET SPECIFIC PROSPECTUS ACCORDING TO COURSE ID AND REVISION YEAR
     * IT WILL ALSO RETURN A STRUCTURES PROSPECTUS DETAILS AND SUBJECTS
     */
    public function get_prospectus($course_id){
        // PROSPECTUS
        $all_prospectus = $this->read_all_prospectus($course_id);

        if(!$all_prospectus) return false;

        $revision_year = 0;
        $active_prospectus = '';
        foreach($all_prospectus as $prospectus){
            // IF THE NEW REVISION YEAR IS GREATER THAN THE CURRENT REVISION YEAR, MEANS THAN IT IS NEW REVISION YEAR
            if($prospectus["revision_year"] > $revision_year){
                $revision_year = $prospectus["revision_year"];
                $active_prospectus = $prospectus;
            }
        }

        // PROSPECUS TEMPLATE
        $prospec_details_template = array(
            array("year" => "first", "sem" => "first", "subjects" => array()),
            array("year" => "first", "sem" => "second", "subjects" => array()),
            array("year" => "first", "sem" => "summer", "subjects" => array()),
            array("year" => "second", "sem" => "first", "subjects" => array()),
            array("year" => "second", "sem" => "second", "subjects" => array()),
            array("year" => "second", "sem" => "summer", "subjects" => array()),
            array("year" => "third", "sem" => "first", "subjects" => array()),
            array("year" => "third", "sem" => "second", "subjects" => array()),
            array("year" => "third", "sem" => "summer", "subjects" => array()),
            array("year" => "fourth", "sem" => "first", "subjects" => array()),
            array("year" => "fourth", "sem" => "second", "subjects" => array()),
            array("year" => "fourth", "sem" => "summer", "subjects" => array())
        );
        
        foreach($this->read_prospectus_detail($course_id, $revision_year) as $details){
            for($i=0; $i<count($prospec_details_template); $i++){
                if($details["year"] == $prospec_details_template[$i]["year"] && $details["sem"] == $prospec_details_template[$i]["sem"]){
                    // ADD THE SUBJECT TO THE SPECIFIC PROSPECTUS DETAIL
                    array_push($prospec_details_template[$i]["subjects"], $this->read_subject_by_code($details["subject_code"]));
                }
            }
        }

        // ADD THE PROSPECTUS DETAILS
        $active_prospectus["details"] = $prospec_details_template;

        return $active_prospectus;
    }

    public function get_prospectus_by_rev_year($course_id, $revision_year){
        // PROSPECTUS
        $prospectus = $this->read_prospectus_by_rev_year($course_id, $revision_year);

        // PROSPECUS TEMPLATE
        $prospec_details_template = array(
            array("year" => "first", "sem" => "first", "subjects" => array()),
            array("year" => "first", "sem" => "second", "subjects" => array()),
            array("year" => "first", "sem" => "summer", "subjects" => array()),
            array("year" => "second", "sem" => "first", "subjects" => array()),
            array("year" => "second", "sem" => "second", "subjects" => array()),
            array("year" => "second", "sem" => "summer", "subjects" => array()),
            array("year" => "third", "sem" => "first", "subjects" => array()),
            array("year" => "third", "sem" => "second", "subjects" => array()),
            array("year" => "third", "sem" => "summer", "subjects" => array()),
            array("year" => "fourth", "sem" => "first", "subjects" => array()),
            array("year" => "fourth", "sem" => "second", "subjects" => array()),
            array("year" => "fourth", "sem" => "summer", "subjects" => array())
        );
        
        foreach($this->read_prospectus_detail($course_id, $revision_year) as $details){
            for($i=0; $i<count($prospec_details_template); $i++){
                if($details["year"] == $prospec_details_template[$i]["year"] && $details["sem"] == $prospec_details_template[$i]["sem"]){
                    // ADD THE SUBJECT TO THE SPECIFIC PROSPECTUS DETAIL
                    array_push($prospec_details_template[$i]["subjects"], $this->read_subject_by_code($details["subject_code"]));
                }
            }
        }

        // ADD THE PROSPECTUS DETAILS
        $prospectus["details"] = $prospec_details_template;

        return $prospectus;
    }

    public function get_all_prospectus($course_id){
        return $this->read_all_prospectus($course_id);
    }

    public function get_latest_prospectus($course_id){
        return $this->read_latest_prospectus($course_id);
    }

    public function add_subject($subject, $prospectus_details){
        /**ADD THE SUBJECT IF IT DOES'NT EXIST OTHERWISE JUST CONTANUE ADDING THE 
         * PROSPECTUS DETAILS */
        try{
            $this->create_subject($subject);
        }catch(PDOException $e){
            $code = $e->getCode();
            /**CHECK IF ERROR IS NOT RELATED CONSTRAINT VIOLATION THEN TERMENATE 
             * THE PROCESS OTHREWISE THE ERROR WAS JUST RELATED TO CONSTRAINT VIOLATION 
             * (MEANS THE SUBJECT ALREADY EXIST IN THE DATABASE) THEN JUST CONTANUE THE PROCESSS */
            if($code != 23000){
                echo $e->getMessage();
                return;
            }
        }
        
        // INSERT THE PROSPECTUS DETAILS
        try{
            $this->create_prospec_details($prospectus_details);
            return array("type" => "success", "text" => "Subject added successfully");
        }catch(PDOException $e){
            if($e->getCode() == 23000){
                return array("type" => "error", "text" => "Subject already exist in the prospectus");
            }
        }
    }

    public function edit_subject($subject){
        return $this->update_subject((array)json_decode($subject));
    }

    public function deleteSubject($course_id, $revision_year, $subject_code){
        try{
            $this->delete_prospectus_detail($course_id, $revision_year, $subject_code);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
} 






