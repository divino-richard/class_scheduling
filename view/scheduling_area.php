<?php
    session_start();
    
    if(!isset($_SESSION["user"])){
        header("HTTP/1.1 403 Forbidden");
        echo "Access to this resource is forbidden.";
        exit();
    }

    // CHECK THE REQUIRED GET REQUEST
    if(!isset($_GET["coll_id"]) || !isset($_GET["course_id"]) || !isset($_GET["revision_year"]) || !isset($_GET["year"]) || !isset($_GET["sem"])){
        header("Location: ./");
        exit();
    }

    $path = "../controllers";

    require_once $path . "/ProspectusContr.php";
    $prospect_contr = new ProspectusContr();

    require_once $path . "/CourseContr.php";
    $course_contr = new CourseContr();

    require_once $path . "/FacultiesContr.php";
    $faculties_contr = new FacultiesContr();

    require_once $path . "/RoomContr.php";
    $room_contr = new RoomContr();

    require_once "../utils/index.php";
    $utils = new Utils();

    require_once "../models/HistoryLogModel.php";
    $hl_model = new HistoryLogModel();

    // EXTRACT SUBJECTS FROM PROSPECTUS ACORDING TO YEAR AND SEMESTER
    $prospectus = $prospect_contr->get_prospectus_by_rev_year($_GET["course_id"], $_GET["revision_year"]);
    foreach($prospectus["details"] as $prospectus_detail){
        // FILTER SUBJECTS ACCORDING TO THE SELECTED YEAR AND SEMESTER
        if($prospectus_detail["year"] == $_GET["year"] && $prospectus_detail["sem"] == $_GET["sem"]){
            $subjects = $prospectus_detail["subjects"];
            break;
        }
    }

    // HANDLE ACCESS LOG
    $user_id = $_SESSION["user"]["user_id"];
    $ip_address = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
    $ip_address = inet_ntop(inet_pton($ip_address));
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    $url = $_SERVER['REQUEST_URI'];
    $hl_model->create_acces_log(["user_id" => $user_id, "ip" => $ip_address, "user_agent" => $user_agent, "url" => $url]);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/scheduling_area.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Scheduling area</title>
</head>
<body>
    <!-- MODAL -->
    <div class="modal_container">
        <div class="modal">
            <header>
                <!-- HEADER INFO WILL POPUP HERE... -->
            </header>

            <div class="modal_content">
                <!-- ACTION BUTTONS WILL POPUP HERE... -->
            </div>

            <div class="modal_actions">
                <!-- ACTION BUTTONS WILL POPUP HERE... -->
            </div>
        </div>
    </div>

    <!-- COSTUM POP UP -->
    <div class="popup_msg_con">
        <div class="popup_msg_content">
            <div class="popup_msg">
                <!-- POPUP MESSAGE INFO WILL APPEAR HERE -->
            </div>
        </div>
    </div>

    <div class="instructor_schedules_popup">
        <header>
            <h3>Schedules</h3>
            <button id="close_instructor_schedules_popup">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </header>
        <section class="instructor_schedules">
            <!-- CONTENT WILL SHOW HERE -->
        </section>
    </div>

    <div class="header">
        <section>
            <button class="back_btn" onclick="history.go(-1);"><i class="fa-solid fa-arrow-left"></i> Back</button>

            <?php
                $course = $course_contr->get_course_by_ID($_GET["course_id"]);
                echo '
                    <h3>'.$course["crs_code"].' - '.strtoupper($_GET["year"]).' YEAR, '.strtoupper($_GET["sem"]).' SEMESTER</h3>
                ';
            ?>
           
            <div class="academic_year">
                <!-- ACADEMIC YEAR WILL DISPLAY HERE -->
            </div>
        </section>

        <div class="header_actions">
            <select id="select_format">
                <option value="format1">Format 1</option>
                <option value="format2">Format 2</option>
            </select>

            <select id="select_academic_year">
                <?php
                    // CREATE ACADEMIC YEAR
                    $rev_year = explode("-", $_GET["revision_year"]);
                    $current_year = date("Y");
                    for($i=$rev_year[0]; $i<=($current_year+2); $i++){
                        $academic_year = $i."-".($i + 1);
                        echo '<option value="'.$academic_year.'" >AY: '.$academic_year.'</option>';
                    }
                ?>
            </select>

            <select id="select_room">
                <option value="">--Room--</option>
                <?php 
                    foreach($room_contr->get_usable_rooms() as $room){
                        echo '
                            <option value="'.$room["rm_id"].'">'.$room["building"].'</option>
                        ';
                    }
                ?>
            </select>

            <select id="select_section">
                <option value="">--Section--</option>
                <option value="A">Section A</option>
                <option value="B">Section B</option>
                <option value="C">Section C</option>
                <option value="D">Section D</option>
                <option value="E">Section E</option>
                <option value="F">Section F</option>
                <option value="G">Section G</option>
                <option value="H">Section H</option>
                <option value="I">Section I</option>
                <option value="J">Section J</option>
            </select>

            <button id="view_schedule_btn">Preview</button>
        </div>
    </div>

    <div class="main_content" >
        <div class="subjects">
            <?php
                if(count($subjects) == 0) echo "<h3 style='background-color:#dbdbdb; 
                    text-align:center;
                    padding: 1rem;
                    color: #585858'>No Subjects Yet!</h3>";

                // GENERATE PARTIAL PROGRAM CODE
                $program_code = $utils->gen_program_code(
                    $course["crs_code"],
                    $course["major"],
                    $_GET["year"],
                    $_GET["sem"]
                );

                $subject_counter = 0;
                // LOOP THROUGH ALL THE SUBJECTS
                foreach($subjects as $subject){
                    // LECTURE SUBJECT
                    $lec = !empty($subject["lab_hr"]) ? " - Lec ": "";

                    // INIT SUBJECT DATA
                    $subject_data = array(
                        "partialProgCode" => $program_code . $subject_counter++,
                        "subjCode" => $subject['subject_code'],
                        "subjTitle" => $subject["title"],
                        "subjDuration" => $subject["lec_hr"],
                        "instructorLoad" => $subject["lec_hr"],
                        "subjType" => "lec",
                        "year" => $_GET["year"],
                        "sem" => $_GET["sem"]
                    );

                    ?>
                    <div class="subject" id="<?php echo $subject_data["partialProgCode"]; ?>" draggable="true"
                        ondragstart='dragStart(
                            event,
                            `<?php echo json_encode($subject_data ); ?>`
                        );'
                    >
                        <span><b><?php echo $subject_data["partialProgCode"] . " (" . $subject["lec_hr"] . " hours)"; ?></b></span><br>
                        <span><?php echo $subject["title"]. $lec; ?></span>
                    </div>
                    <?php
                    // CHECK IF THERE IS A LABORATORY SUBJECT THEN SHOW
                    if(!empty($subject["lab_hr"])){
                        // USSUAL CONDUCT HOURS FOR LABORATORY SUBJECT 
                        $lab_conduct_hrs = $subject["lab_hr"] * 3;

                        // CHANGE SOME OF THE SUBJECT DATA
                        $subject_data["partialProgCode"] = $program_code . $subject_counter++;
                        $subject_data["subjDuration"] = $lab_conduct_hrs;
                        $subject_data["instructorLoad"] = $lab_conduct_hrs * .75;
                        $subject_data["subjType"] = 'lab';

                        ?>
                        <div class="subject" id="<?php echo $subject_data["partialProgCode"]; ?>" draggable="true"
                            ondragstart='dragStart(
                                event,
                                `<?php echo json_encode($subject_data ); ?>`
                            );'
                        >
                            <span><b><?php echo $subject_data["partialProgCode"] . " (" . $lab_conduct_hrs ." hours)"; ?></b></span><br>
                            <span><?php echo $subject["title"]." - Lab";?></span>
                        </div>
                        <?php
                    }
                }
            ?>
        </div>

        <div class="table">
            <div class="sched_day_format">
                <span>Format : </span>
                <section>
                    
                </section>
            </div>

            <div class="tb_header">
                <div class="tb_header_cell">Time</div>
                <div class="tb_header_cell">Monday</div>
                <div class="tb_header_cell">Tuesday</div>
                <div class="tb_header_cell">Wednesday</div>
                <div class="tb_header_cell">Thursday</div>
                <div class="tb_header_cell">Friday</div>
                <div class="tb_header_cell">Saturday</div>
            </div>

            <?php 
                // DEFINE TIME SLOTS
                $morning_time = array(
                    "7:30AM", "7:40AM", "7:50AM", "8:00AM", "8:10AM", "8:20AM", "8:30AM", "8:40AM", "8:50AM",
                    "9:00AM", "9:10AM", "9:20AM", "9:30AM", "9:40AM", "9:50AM", "10:00AM", "10:10AM", "10:20AM",
                    "10:30AM", "10:40AM", "10:50AM", "11:00AM", "11:10AM", "11:20AM", "11:30AM", "11:40AM", "11:50AM", "12:00AM"
                );
                $afternoon_time = array(
                    "1:00PM", "1:10PM", "1:20PM", "1:30PM", "1:40PM", "1:50PM",
                    "2:00PM", "2:10PM", "2:20PM", "2:30PM", "2:40PM", "2:50PM", 
                    "3:00PM", "3:10PM", "3:20PM", "3:30PM", "3:40PM", "3:50PM",
                    "4:00PM", "4:10PM", "4:20PM", "4:30PM", "4:40PM", "4:50PM", 
                    "5:00PM", "5:10PM", "5:20PM", "5:30PM", "5:40PM", "5:50PM", 
                    "6:00PM", "6:10PM", "6:20PM", "6:30PM", "6:40PM", "6:50PM",
                    "7:00PM", "7:10PM", "7:20PM", "7:30PM", "7:40PM", "7:50PM",
                    "8:00PM"
                );

                // DEFINE DAYS
                $days = array("Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
            ?>
                
            <div class="tb_body" id="tb_body_am" >
                <div class="coll">
                    <?php
                        // SHOW TIME SLOTS
                        for($i = 0; $i < count($morning_time); $i++){
                            ?>
                            <div class="time_slots <?php echo date_parse($morning_time[$i])['minute'] == 0 ? 'hour_in_time' : '';?>" >
                                <?php echo $morning_time[$i];?>
                            </div>
                            <?php
                        }
                    ?>
                </div>
                <?php 
                    // GENERATE TABLE CELLS AND COLUNMS
                    for($i=0; $i<6; $i++){
                        ?>
                        <div class="coll coll_with_cells <?php echo $days[$i]; ?>">
                            <?php
                                for($j=0; $j<count($morning_time); $j++){
                                    $cell_id_start = $morning_time[$j]."_".$days[$i]."_start";
                                    $cell_id_end = $morning_time[$j]."_".$days[$i]."_end";

                                    if($j==count($morning_time)-1){
                                        echo '
                                        <div class="cell" id="'.$cell_id_end.'"></div>
                                        <div class="cell" id="'.$cell_id_start.'"></div>
                                        ';
                                        continue;
                                    }

                                    echo '
                                    <div class="cell" id="'.$cell_id_end.'"></div>
                                    <div class="cell drop-zone" id="'.$cell_id_start.'"
                                        ondragenter="dragEnter(event);"
                                    ></div>
                                    ';
                                }
                            ?>
                        </div>
                        <?php
                    }
                ?>
            </div>

            <div class="lunch_break">
                Lunch Break!
            </div>

            <div class="tb_body" id="tb_body_pm">
                <div class="coll">
                    <?php
                        // SHOW TIME SLOTS
                        for($i = 0; $i < count($afternoon_time); $i++){
                            ?>
                            <div class="time_slots <?php echo date_parse($afternoon_time[$i])['minute'] == 0 ? 'hour_in_time' : '';?>" >
                                <?php echo $afternoon_time[$i];?>
                            </div>
                            <?php
                        }
                    ?>
                </div>
                <?php 
                    // GENERATE TABLE CELLS AND COLUNMS
                    for($i=0; $i<6; $i++){
                        ?>
                        <div class="coll coll_with_cells <?php echo $days[$i]; ?>">
                            <?php
                                for($j=0; $j<count($afternoon_time); $j++){
                                    $cell_id_start = $afternoon_time[$j]."_".$days[$i]."_start";
                                    $cell_id_end = $afternoon_time[$j]."_".$days[$i]."_end";

                                    if($j==count($afternoon_time)-1){
                                        echo '
                                        <div class="cell" id="'.$cell_id_end.'"></div>
                                        <div class="cell" id="'.$cell_id_start.'"></div>
                                        ';
                                        continue;
                                    }

                                    echo '
                                    <div class="cell" id="'.$cell_id_end.'"></div>
                                    <div class="cell drop-zone" id="'.$cell_id_start.'"
                                        ondragenter="dragEnter(event);"
                                    ></div>
                                    ';
                                }
                            ?>
                        </div>
                        <?php
                    }
                ?>
            </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/general.js"></script>
    <script src="../public/js/scheduling_area.js"></script>
</body>
</html>