
<?php
require_once "../models/UserModel.php";
require_once "../models/HistoryLogModel.php";

class UserContr extends UserModel {
    public $login_error;

    public function add_account($user){
        // CHECK IF USER ACCOUNT ALREADY EXIST THEN STOP THE PROCESS
        if(!empty($this->read_user_by_uname($user["username"]))) return;

        // PROCED ADDING THE ACCOUNT TO THE DATABASE
        if($this->create_user($user)){
            return true;
        }else{
            return false;
        }
    }

    public function login($username, $password){
        if(empty($username) || empty($password)){
            $this->login_error = "All fields are required";
            return;
        }

        $user_data = $this->read_user_by_uname($username);

        if(!empty($user_data)){
            // CONFIRM THE PASSWORD
            if(md5($password) === $user_data["password"]){
                session_start();
                // SET USER SESSION
                $_SESSION["user"] = $user_data;
                $this->get_login_attempt("success");
                // REDIRECT TO ADMIN INDEX
                header("Location: ./");
            }else{
                $this->login_error = "Incorrect password";
                $this->get_login_attempt("failed");
                return;
            }
        }else{
            $this->login_error = "Account doesn't exist";
            $this->get_login_attempt("failed");
            return;
        }
    }

    public function get_login_attempt($status){
        $hl_model = new HistoryLogModel();
        $ip_address = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
        $ip_address = inet_ntop(inet_pton($ip_address));
        // ADD TO THE DATABASE
        $hl_model->create_login_attempt([
            "id"            => uniqid(),
            "ip"            => $ip_address,
            "user_agent"    => $_SERVER['HTTP_USER_AGENT'],
            "status"        => $status
        ]);
    }

    public function get_users(){
        return $this->read_users();
    }

    public function add_staff(){
        $user_id = uniqid();
        $this->creat_staff([
            "user_id"   => $user_id,
            "fname"     => $_POST["fname"],
            "mname"     => $_POST["mname"],
            "lname"     => $_POST["lname"],
            "ext"       => $_POST["ext"],
            "username"  => $this->gen_username($_POST["fname"] . " " . $_POST["lname"]),
            "password"  => md5($user_id),
            "user_type" => "staff"
        ]);
        header("Location: ./staff.php");
    }

    public function get_staff(){
        return $this->read_staff();
    }

    public function edit_staff($staff_data){
        return $this->update_staff(json_decode($staff_data));
    }

    public function delete_staff_now($staff_id){
        try{
            $this->delete_staff($staff_id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }

    public function delete_signee_now($id){
        try{
            $this->delete_staff($id);
            return true;
        }catch(PDOException $e){
            return false;
        }
    }

    public function verify_account($account){
        // GET THE USER ACCOUNT FROM THE DATABASE THROUGH username
        $cur_account = $this->read_user_by_uname($account->username);

        if(empty($cur_account)) return false;

        // VERIFY THE PASSWORD
        if(md5($account->password) === $cur_account["password"]){
            return true;
        }else{
            return false;
        }
    }

    public function change_password($account){
        // CHANGE IF ACCOUNT EXIST
        $cur_account = $this->read_user_by_uname($account->username);

        if(empty($cur_account)) return false;

        // UPDATE CURRENT USER ACCOUNT RECORD
        if($this->update_password($account->username, md5($account->password))){
            return true;
        }else{
            return false;
        }
    }

    public function get_user_by_uname($uname){
        return $this->read_user_by_uname($uname);
    }

    public function get_user_by_fac_id($fac_id){
        return $this->read_user_by_fac_id($fac_id);
    }

    public function gen_username($string){
        $pattern = " ";
        $firstPart = strstr(strtolower($string), $pattern, true);
        $secondPart = substr(strstr(strtolower($string), $pattern, false), 0,3);
        $nrRand = rand(100, 999);
        
        $username = trim($firstPart).trim($secondPart).trim($nrRand);
        return $username;
    }
}

