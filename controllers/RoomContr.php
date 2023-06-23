
<?php
require_once "../models/RoomModel.php";

class RoomContr extends RoomModel{
    public function set_room(){
        $rm_data =  array(
            'room_id'   => $_POST["room_id"],
            'building'  => $_POST["building"],
            'type'      => $_POST["type"],
            'status'    => $_POST["status"]
        );

        // IF ROOM TO BE ADDED DOES NOT EXIST IN THE DATABASE THEN PROCESS ADDING
        if(empty($this->read_room_by_ID($_POST["room_id"]))){
            if($this->create_room($rm_data)){
                header("Location: rooms.php");
            }
        }else{
            echo "<script>alert('Room already exist')</script>";
        }
    }
    
    public function get_rooms(){
        return $this->read_rooms();
    }

    public function get_room_by_id($room_id){
        return $this->read_room_by_ID($room_id);
    }
    
    public function get_usable_rooms(){
        return $this->read_usable_rooms();
    }
    
    public function edit_room($rm_data){
        return $this->update_room(json_decode($rm_data));
    }

    public function search_room($search_term){
        return $this->read_room_by_term($search_term);
    }

    public function delete_room_now($room_id){
        try{
            $this->delete($room_id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
}



