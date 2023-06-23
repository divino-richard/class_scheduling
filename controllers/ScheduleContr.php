<?php
require_once "../models/ScheduleModel.php";
require_once "../utils/IntervalSearchTree.php";
require_once "../utils/index.php";

class ScheduleContr extends ScheduleModel{

    public function get_schedule_sections($course_id, $year, $sem, $acad_year){
        $schedules = $this->read_schedules($course_id, $year, $sem, $acad_year);
        $sections = [];
        foreach($schedules as $schedule){
            if(!in_array($schedule["section"], $sections)){
                array_push($sections, $schedule["section"]);
            }
        }
        return $sections;
    }

    public function check_room_availability($room_id, $sem, $days, $acad_year, $new_time_slot){
        $utils = new Utils();

        foreach($days as $day){
            // INITIALIZE NEW TREE
            $tree = new IntervalSearchTree();

            $schedules = $this->read_room_timeslots($room_id, $sem, $day, $acad_year);
            
            // IF NO EXISTING TIMESLOT THEN JUMP TO THE NEXT DAY
            if(count($schedules) <= 0) continue;

            // INSERT SCHEDTULE TIMESLOTS AS INTERVALS OR TREE NODES
            foreach($schedules as $schedule){
                $timeslot = explode("-", $schedule["sched_time"]);
                $start = $utils->time_to_minutes($timeslot[0]);
                $end =  $utils->time_to_minutes($timeslot[1]);
                // THE INTERVAL OR NODE
                $tree->insert([$start, $end]);
            }

            $exp_time_slot = explode("-", $new_time_slot);
            $new_start = $utils->time_to_minutes($exp_time_slot[0]);
            $end_start = $utils->time_to_minutes($exp_time_slot[1]);

            // CHECK FOR NEW TIME SLOT OVERLAP'S THE EXISTING TIMESLOTS
            if($tree->overlaps([$new_start, $end_start])){
                // ROOM IS NOT AVAILABLE
                return false;
            }
        }
        // ROOM IS AVAILABLE
        return true;
    }

    public function check_student_per_section_conflict($course_id, $year, $sem, $section, $days, $academic_year, $new_time_slot){
        $utils = new Utils();

        foreach($days as $day){
            // INITIALIZE NEW TREE
            $tree = new IntervalSearchTree();

            $schedules = $this->read_section_timeslots($course_id, $year, $sem, $section, $day, $academic_year, $new_time_slot);
            
            // IF NO EXISTING TIMESLOT THEN JUMP TO THE NEXT DAY
            if(count($schedules) <= 0) continue;

            // INSERT SCHEDTULE TIMESLOTS AS INTERVALS OR TREE NODES
            foreach($schedules as $schedule){
                $exp_timeslot = explode("-", $schedule["sched_time"]);
                $start = $utils->time_to_minutes($exp_timeslot[0]);
                $end =  $utils->time_to_minutes($exp_timeslot[1]);
                // THE INTERVAL OR NODE
                $tree->insert([$start, $end]);
            }

            $new_exp_timeslot = explode("-", $new_time_slot);
            $new_start = $utils->time_to_minutes($new_exp_timeslot[0]);
            $end_start = $utils->time_to_minutes($new_exp_timeslot[1]);

            // CHECK FOR NEW TIME SLOT OVERLAP'S THE EXISTING TIMESLOTS
            if($tree->overlaps([$new_start, $end_start])){
                // ROOM IS NOT AVAILABLE
                return false;
            }
        }
        // NO CONFLICT FOR THE SECTION
        return true;
    }

    public function check_instructor_conflict($faculty_id, $sem, $days, $acad_year, $new_timeslot){
        $utils = new Utils();
        // print_r($days);

        foreach($days as $day){
            // INITIALIZE NEW TREE
            $tree = new IntervalSearchTree();

            $schedules = $this->read_instructor_timeslots($faculty_id, $sem, $day, $acad_year);
            
            // IF NO EXISTING TIMESLOT THEN JUMP TO THE NEXT DAY
            if(count($schedules) <= 0) continue;

            // INSERT SCHEDTULE TIMESLOTS AS INTERVALS OR TREE NODES
            foreach($schedules as $schedule){
                $timeslot = explode("-", $schedule["sched_time"]);
                $start = $utils->time_to_minutes($timeslot[0]);
                $end =  $utils->time_to_minutes($timeslot[1]);
                // THE INTERVAL OR NODE
                $tree->insert([$start, $end]);
            }

            $exp_timeslot = explode("-", $new_timeslot);
            $new_start = $utils->time_to_minutes($exp_timeslot[0]);
            $end_start = $utils->time_to_minutes($exp_timeslot[1]);

            // CHECK FOR NEW TIME SLOT OVERLAP'S THE EXISTING TIMESLOTS
            if($tree->overlaps([$new_start, $end_start])){
                return $schedules;
            }
        }
    }

    public function reuse_schedules($course_id, $acad_year, $reused_in){
        // CHECK IF SELECTED YEAR HAS EMPTY SCHEDULE OR NOT
        if(empty($this->read_course_schedules($course_id, $reused_in))){
            // COPY ALL THE SCHEDULES ON TO THE NEXT ACADEMIC YEAR
            $schedules = $this->read_course_schedules($course_id, $acad_year);
            $response = false;
            // INSERT EACH SCHEDULES TO THE DATABASE WITH A NEW ACADEMIC YEAR
            foreach($schedules as $schedule){
                $data = [
                    "programCode"    => $schedule["program_code"],
                    "subjectCode"    => $schedule["subject_code"],
                    "acad_year"      => $reused_in,
                    "courseId"       => $course_id,
                    "year"           => $schedule["year"],
                    "sem"            => $schedule["sem"],
                    "section"        => $schedule["section"],
                    "faculty_id"     => $schedule["fac_id"],
                    "rm_id"          => $schedule["rm_id"],
                    "sched_time"     => $schedule["sched_time"],
                    "sched_day"      => $schedule["sched_day"],
                    "type"           => $schedule["type"],
                    "format"         => $schedule["format"],
                    "load_type"      => $schedule["load_type"]
                ];
                // INSERT NOW
                $response = $this->create_schedule((object)$data);
            }

            if($response == true) {
                return ["status" => true, "msg" => "Schedule reuse successfully"];
            } else{
                return ["status" => false, "msg" => "Unable to reuse the schedules"];
            }

        }else{
            return ["status" => false, "msg" => "Make sure there is no schedule exist."];
        }
    }
}
