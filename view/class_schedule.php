<?php 
    session_start();
    
    if(!isset($_SESSION["user"])){
        header("HTTP/1.1 403 Forbidden");
        echo "Access to this resource is forbidden.";
        exit();
    }
    
    if(!isset($_GET["course_id"]) || !isset($_GET["acad_year"]) || !isset($_GET["year"]) || !isset($_GET["sem"]) ){
        header("Location: ./");
    }

    require_once "../controllers/ScheduleContr.php";
    $schedule_contr = new ScheduleContr();

    require_once "../controllers/CourseContr.php";
    $course_contr =  new CourseContr();

    require_once "../controllers/SignatoryContr.php";
    $signatory_contr = new SignatoryContr();

    $sections = $schedule_contr->get_schedule_sections($_GET["course_id"], $_GET["year"], $_GET["sem"], $_GET["acad_year"]);
    $course_info = $course_contr->get_course_by_ID($_GET["course_id"]);

    // HANDLE ACCESS LOG
    $user_id = $_SESSION["user"]["user_id"];
    $ip_address = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
    $ip_address = inet_ntop(inet_pton($ip_address));
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    $url = $_SERVER['REQUEST_URI'];

    require_once "../models/HistoryLogModel.php";
    $hl_model = new HistoryLogModel();
    $hl_model->create_acces_log(["user_id" => $user_id, "ip" => $ip_address, "user_agent" => $user_agent, "url" => $url]);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/class_schedule.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Class Schedules</title>
</head>
<body>
    <div class="header">
        <button class="back_btn" onclick="history.back();"><b>&#8617;</b> Back</button>
        <h2><?php echo $course_info["crs_code"]." - ".strtoupper($_GET["year"])." YEAR, ". strtoupper($_GET["sem"])." SEM"; ?></h2>
        <section>
            <select id="select_section">
                <?php 
                if(empty($sections)){
                    echo '<option value="">--Section--</option>';
                }else{
                    foreach($sections as $section){
                        echo '<option value="'.$section.'">Section '.$section.'</option>';
                    }
                }
                ?>
            </select>
            <button class="print_btn" onclick="window.print();"><i class="fa-solid fa-print"></i> Print</button>
        </section>
    </div>

    <div class="main_container">
        <div id="schedule_container">
            <div class="schedule_header">
                <img class="nemsu_logo" src="../public/img/NEMSU.png" alt="">
                <div>
                    <h3>NORTH EASTERN MINDANAO STATE UNIVERSITY</h3>
                    <p>LIANGA CAMPUS</p>
                    <p>LIANGA, SURIGAO DEL SUR</p>
                    <p><?php echo strtoupper($course_info["crs_desc"]); ?></p>
                    <p><?php echo !empty($course_info["major"]) ? " - ".$course_info["major"] : ""; ?></p>
                    <p><?php echo "AY: ".$_GET["acad_year"]; ?></p>
                    <p><?php echo strtoupper($_GET["sem"]) . " SEMESTER"; ?></p>
                </div>
                <img class="iso_logo" src="../public/img/ISO.jpg" alt="">
            </div>

            <table class="sched_table">
                <!-- SCHEDULES WILL BE DISPLAY HERE  -->
            </table>

            <div class="footer">
                <div class="undersign">
                    <span>Preapared:</span>
                    <section>
                        <?php 
                            foreach($signatory_contr->get_signatories() as $signatory){
                                if(strtoupper($signatory["designation"]) === "ASST. CAMPUS DIRECTOR"){
                                    echo '
                                    <h3>'.strtoupper($signatory["name"]).', '.$signatory["degree"].'</h3>
                                    <span>Asst. Campus Director</span>
                                    ';
                                }
                            }
                        ?>
                    </section>
                </div>

                <span>Note: Only 45 Students per Class</span>
            </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/class_schedule.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>
