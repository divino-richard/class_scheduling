

<?php
require_once "../models/SignatoryModel.php";

class SignatoryContr extends SignatoryModel{
    public function add_signatory(){
        $data = array(
            "name"   => $_POST["name"],
            "degree"  => $_POST["degree"],
            "designation"  => $_POST["designation"]
        );
        if($this->create_signatory($data)){
            header("Location: signatory.php");
        }
    }

    public function get_signatories(){
        return $this->read_signatories();
    }

    public function edit_signatory($signatory_data){
        return $this->update_signatory(json_decode($signatory_data));
    }

    public function delete_signatory_now($id){
        try{
            $this->delete($id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }
}







