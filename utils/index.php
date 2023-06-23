<?php

class Utils{
    private $partial_code = "";
    // GENERATE PARTIAL PROGRAM CODE
    public function gen_program_code($course_code, $major, $year, $sem){
        if(!empty($major)){
            // SPLIT INTO WORDS
            $exp_words = explode(" ", $major);
            for($i=0; $i<count($exp_words); $i++){
                // CONCATENATE THE FIRST LETTER OF EACH WORDS
                $this->partial_code .= $exp_words[$i][0];
            };
        }else{
            // GET THE LAST TWO LETTERS OF THE COURSE CODE
            $this->partial_code = substr($course_code, -2);
        }

        switch($_GET["year"]){
            case "first":
                $year = "1";
                break;
            case "second":
                $year = "2";
                break;
            case "third":
                $year = "3";
                break;
            case "fourth":
                $year = "4";
                break;
            case "fifth":
                $year = "5";
                break;
        }

        if($_GET["sem"] == "first"){
            $sem = "1";
        }else if($_GET["sem"] == "second"){
            $sem = "2";
        }else{
            $sem = "3";
        }

        return $this->partial_code .= $year . $sem;
    }

    /**
     * RETURN AN INTEGER REPREENTATION OF TIME
     * BASICALLY AN MINUTES FORM
     * TIME FORMAT MUST BE EX.("5:30AM")
     */
    public function time_to_minutes($time){
        $ext_time = explode(":", $time);
        $hour = $ext_time[0];
        $min = substr($ext_time[1], 0, 2);
        $merid = substr($ext_time[1], -2);
        if($merid == "PM") $hour = $hour + 12;
        $time_in_min = $hour * 60 + $min;
        return $time_in_min;
    }
}
