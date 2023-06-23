<?php
require_once "../config/Dbh.php";

class ScheduleModel extends Dbh{
    private $conn;
    
    public function __construct(){
        $this->conn = $this->connect();
    }

    public function create_schedule($data){
        $sql = "INSERT INTO `offering_sem` (
            `program_code`,
            `subject_code`,
            `acad_year`,
            `course_id`, 
            `year`,
            `sem`,
            `section`, 
            `fac_id`, 
            `rm_id`, 
            `sched_time`,
            `sched_day`,
            `type`,
            `format`,
            `load_type`
            )
            VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([
            $data->programCode,
            $data->subjectCode,
            $data->acad_year,
            $data->courseId,
            $data->year,
            $data->sem,
            $data->section,
            $data->faculty_id,
            $data->rm_id,
            $data->sched_time,
            $data->sched_day,
            $data->type,
            $data->format,
            $data->load_type
        ]);
        return true;
    }

    public function read_faculty_schedules($id, $sem, $academic_year){
        $sql = "SELECT * FROM `offering_sem` os
                WHERE os.fac_id=? and os.sem=? and os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id, $sem, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_schedules_by_facID($id, $sem, $academic_year){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.fac_id,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            os.type,
            os.load_type,
            c.crs_code,
            s.title,
            s.lec_hr,
            s.lab_hr,
            r.rm_id,
            r.building
            FROM offering_sem as os
            INNER JOIN subject s ON os.subject_code = s.subject_code
            INNER JOIN course c ON os.course_id = c.course_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.fac_id=? AND os.sem=? AND os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id, $sem, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function read_room_schedules($id, $sem, $academic_year){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            f.fac_id,
            f.fname,
            f.lname,
            r.rm_id,
            r.building,
            c.crs_code,
            c.crs_desc
            FROM offering_sem as os
            INNER JOIN faculty f ON os.fac_id = f.fac_id
            INNER JOIN course c ON os.course_id = c.course_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.rm_id=? AND os.sem=? AND os.acad_year=?";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id, $sem, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_room_timeslots($id, $sem, $day, $acad_year){
        $sql = "SELECT os.sched_time FROM offering_sem as os WHERE os.rm_id=? AND os.sem=? AND os.sched_day=? AND os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id, $sem, $day, $acad_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_section_timeslots($course_id, $year, $sem, $section, $day, $academic_year){
        $sql = "SELECT os.sched_time FROM offering_sem as os
                WHERE os.course_id=? and os.year=? and os.sem=? and os.section=? and os.sched_day=?  and os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $year, $sem, $section, $day, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_instructor_timeslots($id, $sem, $day, $acad_year){
        $sql = "SELECT os.program_code, os.sched_day, os.sched_time, os.year, os.sem, c.crs_code
                FROM offering_sem as os 
                INNER JOIN course c ON os.course_id = c.course_id
                WHERE os.fac_id=? AND os.sem=? AND os.sched_day=? AND os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id, $sem, $day, $acad_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    

    public function read_schedule($program_code, $academic_year){
        $sql = "SELECT * FROM offering_sem os WHERE os.program_code=? AND os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$program_code, $academic_year]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function read_schedules($course_id, $year, $sem, $academic_year){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            os.type,
            s.title,
            s.lec_hr,
            s.lab_hr,
            f.fac_id,
            f.fname,
            f.lname,
            r.rm_id,
            r.building
            FROM offering_sem as os
            INNER JOIN subject s ON os.subject_code = s.subject_code
            INNER JOIN faculty f ON os.fac_id = f.fac_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.course_id=? and os.year=? and os.sem=? and os.acad_year=? ORDER By os.section";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $year, $sem, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_section_schedules($course_id, $year, $sem, $section, $academic_year){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            os.type,
            os.format,
            s.title,
            s.lec_hr,
            s.lab_hr,
            f.fac_id,
            f.fname,
            f.lname,
            r.rm_id,
            r.building,
            r.status as room_status
            FROM offering_sem as os
            INNER JOIN subject s ON os.subject_code = s.subject_code
            INNER JOIN faculty f ON os.fac_id = f.fac_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.course_id=? and os.year=? and os.sem=? and os.section=? and os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $year, $sem, $section, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_faculty_loads($faculty_id, $semester, $academic_year, $load_type){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.fac_id,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            os.type,
            os.format,
            os.load_type,
            c.crs_code,
            s.title,
            s.lec_hr,
            s.lab_hr,
            r.rm_id,
            r.building
            FROM offering_sem as os
            INNER JOIN subject s ON os.subject_code = s.subject_code
            INNER JOIN course c ON os.course_id = c.course_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.fac_id=? AND os.sem=? AND os.acad_year=? AND os.load_type=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id, $semester, $academic_year, $load_type]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_student_schedule($stud_id, $s_year, $sem, $course_id){
        $sql = "SELECT OS.program_code,
            OS.subject_code,
            OS.fac_id,
            OS.year,
            OS.sem,
            OS.section,
            OS.sched_time,
            OS.sched_day,
            OS.type,
            C.crs_code,
            S.title,
            S.lec_hr,
            S.lab_hr,
            F.fac_id,
            F.fname,
            F.lname,
            R.rm_id,
            R.building
            FROM stud_enrolled_subject AS SEC
            INNER JOIN offering_sem AS OS ON OS.subject_code = SEC.subject_code
            INNER JOIN subject S ON OS.subject_code = S.subject_code
            INNER JOIN course C ON OS.course_id = C.course_id
            INNER JOIN faculty F ON os.fac_id = F.fac_id
            INNER JOIN rooms R ON OS.rm_id = R.rm_id
            WHERE SEC.Stud_id=? AND SEC.s_year=? AND SEC.sem=? AND OS.course_id=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$stud_id, $s_year, $sem, $course_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_current_student_schedule($course_id, $year, $sem, $section){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            os.type,
            os.format,
            s.title,
            s.lec_hr,
            s.lab_hr,
            f.fac_id,
            f.fname,
            f.lname,
            r.rm_id,
            r.building,
            r.status as room_status
            FROM offering_sem as os
            INNER JOIN subject s ON os.subject_code = s.subject_code
            INNER JOIN faculty f ON os.fac_id = f.fac_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.course_id=? and os.year=? and os.sem=? and os.section=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $year, $sem, $section]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_course_schedules($course_id, $acad_year){
        $sql = "SELECT os.program_code,
            os.subject_code,
            os.year,
            os.sem,
            os.section,
            os.sched_time,
            os.sched_day,
            os.type,
            os.format,
            os.load_type,
            s.title,
            s.lec_hr,
            s.lab_hr,
            f.fac_id,
            f.fname,
            f.lname,
            r.rm_id,
            r.building,
            r.status as room_status
            FROM offering_sem as os
            INNER JOIN subject s ON os.subject_code = s.subject_code
            INNER JOIN faculty f ON os.fac_id = f.fac_id
            INNER JOIN rooms r ON os.rm_id = r.rm_id
            WHERE os.course_id=? and os.acad_year=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $acad_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function update_schedule($program_code, $faculty_id){
        $sql = "UPDATE `offering_sem` SET `fac_id`=? WHERE `program_code`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$faculty_id, $program_code]);
        return true;
    }

    public function delete_schedule($program_code){
        $sql = "DELETE FROM `offering_sem` WHERE `program_code` = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$program_code]);
        return true;
    }

    public function read_sched_sem_and_year($course_id, $academic_year){
        $sql = "SELECT DISTINCT year, sem FROM `offering_sem` WHERE `course_id`=? AND `acad_year`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id, $academic_year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_sched_ay($course_id){
        $sql = "SELECT DISTINCT `acad_year` FROM `offering_sem` WHERE `course_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$course_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function read_instructor_sched_ay($fac_id){
        $sql = "SELECT DISTINCT `acad_year` FROM `offering_sem` WHERE `fac_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$fac_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function read_room_sched_ay($room_id){
        $sql = "SELECT DISTINCT `acad_year` FROM `offering_sem` WHERE `rm_id`=?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$room_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

