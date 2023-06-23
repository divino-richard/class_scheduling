<?php
require_once "../models/CollegeModel.php";

class CollegeContr extends CollegeModel{
    public function add_college(){
        $coll_id = uniqid();
        $coll_data = array(
            "coll_id" => $coll_id,
            "coll_code" => $_POST["coll_code"],
            "coll_desc" => $_POST["coll_desc"]
        );
        $coll_dean_data = array(
            "coll_id" => $coll_id,
            "name" => $_POST["name"],
            "degree" => $_POST["degree"]
        );
        if($this->create_college($coll_data) && $this->create_dean($coll_dean_data)){
            header("Location: college.php");
        }
    }
    public function get_colleges(){
        return $this->read_colleges();
    }
    public function edit_college($college_data){
        $data = json_decode($college_data);
        // EDIT THE COLLEGE AS WELL AS THE DEAN
        if($this->update_college($data) && $this->update_dean($data)){
            return true;
        }
    }
    public function delete_college_now($college_id){
        try{
            $this->delete($college_id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
}



