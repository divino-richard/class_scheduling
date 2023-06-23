<?php
    if(!isset($_GET["course_id"]) || empty($_GET["course_id"])){
        header("Location: ./");
    }

    require_once "../controllers/CourseContr.php";
    $course_contr = new CourseContr(); // COURSE CONTROLLER

    require_once "../controllers/ProspectusContr.php";
    $prospectus_contr = new ProspectusContr();

    require_once "../controllers/ScheduleContr.php";
    $sched_contr = new ScheduleContr();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/general.css">
    <link rel="stylesheet" href="../public/css/schedules.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Schedules</title>
</head>
<body>
    <!-- COSTUM POP UP -->
    <div class="popup_msg_con">
        <div class="popup_msg_content">
            <div class="popup_msg">
                <!-- POPUP MESSAGE INFO WILL APPEAR HERE -->
            </div>
        </div>
    </div>
    
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <?php 
                    $course = $course_contr->get_course_by_ID($_GET["course_id"]);
                    $all_prospectus = $prospectus_contr->get_all_prospectus($_GET["course_id"]);
                    ?>
                    <div class="course_schedules">
                        <div class="schedule_header">
                            <h2>
                                <?php echo strtoupper($course["crs_desc"]); ?>
                                <?php echo strtoupper($course["major"]); ?>
                            </h2>
                        </div>
                        
                        <section>
                            <select name="" id="select_acad_year">
                                <?php 
                                $sched_years = $sched_contr->read_sched_ay($_GET["course_id"]);
                                if(!empty($sched_years)){
                                    foreach($sched_years as $item){
                                        echo '<option value="'.$item["acad_year"].'">AY: '.$item["acad_year"].'</option>';
                                    }
                                }else{
                                    echo '<option value="">AY: None</option>';
                                }
                                ?>
                            </select>
                            <button onclick="handleReuseSchedules()">Reuse Schedules</button>
                        </section>

                        <div class="schedules">
                            <div class="schedule_placeholder">
                                <i class="fas fa-table-cells"></i>
                                <span>Empty Schedule</span>
                            </div>
                        </div>
                    </div>
                    <?php
                ?>
            </div>
        <div>
    </div>

    <!-- MODAL FOR REUSING SCHEDULES -->
    <div class="modal_container">
        <div class="modal_content">
            <h2>Select Academic Year</h2>
            <section>
                <select id="selected_empty_year">
                <?php
                    $cur_year = date("Y");
                    for($i=$cur_year; $i<=($cur_year+2); $i++){
                        $acad_year = $i ."-". ($i+1);
                        echo '<option value="'.$acad_year.'">AY: '.$acad_year.'</option>';
                    }
                ?>
                </select>
            </section>
            <div>
                <button id="reuse_now">Reuse Now</button>
                <button id="cancel">Cancel</button>
            </div>
        </div>                       
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/schedules.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>