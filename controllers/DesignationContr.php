<?php

require_once "../models/DesignationModel.php";

class DesignationContr extends DesignationModel{
    public function add_designation(){
        $data = array(
            "designation_id" => uniqid(),
            "designation_title" => $_POST["designation_title"],
            "deloading" => $_POST["deloading"]
        );
        if($this->create_designation($data)){
            header("Location: designation.php");
        }
    }

    public function add_faculty_designation($faculty_id, $designation_id){
        $this->create_faculty_designation($faculty_id, $designation_id);
    }

    public function get_designations(){
        return $this->read_designations();
    }

    public function get_faculty_designations($fac_id){
        if($fac_id){
            return $this->read_faculty_designations($fac_id);
        }
    }

    public function get_program_coordinator_id(){
        $program_coordinator= $this->read_designation("Program Coordinator");
        return $program_coordinator["designation_id"];
    }

    public function search_designation($search_term){
        return $this->read_designation_by_term($search_term);
    }

    public function edit_designation($designation_data){
        return $this->update_designation(json_decode($designation_data));
    }

    public function delete_designation_now($designation_id){
        try{
            $this->delete($designation_id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
}

