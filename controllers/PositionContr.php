<?php
require_once "../models/PositionModel.php";

class PositionContr extends PositionModel{
    public function add_position(){
        $data = array(
            "position_id" => uniqid(),
            "position_title" => $_POST["position_title"],
            "min_load" => $_POST["min_load"],
            "max_load" => $_POST["max_load"],
            "status" => $_POST["status"]
        );

        if($this->create_position($data)){
            header("Location: position.php");
        }
    }

    public function get_positions(){
        return $this->read_positions();
    }

    public function search_position($search_term){
        return $this->read_position_by_term($search_term);
    } 

    public function edit_position($position_data){
        return $this->update_position(json_decode($position_data));
    }
    

    public function delete_position_now($position_id){
        try{
            $this->delete($position_id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
}
