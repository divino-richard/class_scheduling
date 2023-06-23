<?php 
    session_start();
    
    if(!isset($_SESSION["user"])){
        header("HTTP/1.1 403 Forbidden");
        echo "Access to this resource is forbidden.";
        exit();
    }
    
    if(!isset($_GET["fac_id"]) || empty($_GET["fac_id"]) || !isset($_GET["course_id"]) || empty($_GET["course_id"])){
        header("Location: ../logout.php");
    }

    require_once "../controllers/ProspectusContr.php";
    $prospect_contr = new ProspectusContr();

    require_once "../controllers/FacultiesContr.php";
    $faculty_contr =  new FacultiesContr();

    require_once "../controllers/ScheduleContr.php";
    $sched_contr = new ScheduleContr();

    require_once "../controllers/SignatoryContr.php";
    $signatory_contr = new SignatoryContr();

    $faculty_info = $faculty_contr->get_faculty_by_ID($_GET["fac_id"]);
    // print_r($faculty_info);
    $department_chair = $faculty_contr->get_department_chair($_GET["course_id"]);

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
    <link rel="stylesheet" href="../public/css/instructor_load.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Instructor Loads</title>
</head>
<body>
    <div class="container">
        <div class="actions">
            <button class="back_btn" onclick="history.back();"><b>&#8617;</b> Back</button>
            <section>
                <select name="" id="select_load_type">
                    <option value="regular">Regular Load</option>
                    <option value="over">Over Load</option>
                    <option value="emergency">Emergency Load</option>
                    <!-- <option value="merge">Merge</option> -->
                </select>

                <select name="" id="select_academic_year">
                    <?php 
                    $sched_years = $sched_contr->read_instructor_sched_ay($_GET["fac_id"]);
                    if(!empty($sched_years)){
                        foreach($sched_years as $item){
                            echo '<option value="'.$item["acad_year"].'">AY: '.$item["acad_year"].'</option>';
                        }
                    }else{
                        echo '<option value="">None</option>';
                    }
                    ?>
                </select>

                <select name="" id="select_semester">
                    <option value="first">1st sem</option>
                    <option value="second">2nd sem</option>
                    <option value="summer">summer</option>
                </select>
                <button id="print_btn" onclick="window.print()"><i class="fa-solid fa-print"></i> Print</button>
            </section>
        </div>

        <div class="main">
            <div class="header">
                <img class="nemsu_logo" src="../public/img/NEMSU.png" alt="">
                <div>
                    <span>Republic of the Philippines</span>
                    <h3>NORTH EASTERN MINDANAO STATE UNIVERSITY</h3>
                    <span>Formerly Surigao del Sur State University</span>
                    <h4>LIANGA CAMPUS</h4>
                    <span>Lianga, Surigao del Sur, 8307</span><br><br>
                    <h4><?php echo strtoupper($faculty_info['coll_desc']); ?></h4>
                    <h4 class="load_type_info"></h4>
                    <h4 id="semster"></h4>
                    <span id="academic_year"></span>
                </div>
                <img class="iso_logo" src="../public/img/ISO.jpg" alt="">
            </div>
            
            <div class="instructor_info">
                <section>
                    <span>Name: <b>
                        <?php 
                        $instructor_mname = !empty($faculty_info['mname']) ? $faculty_info['mname'][0]."." : "";
                        $instructor_name = $faculty_info['lname'].", ".$faculty_info['fname']." ".$instructor_mname;
                        echo strtoupper($instructor_name);
                        ?></b>
                    </span>
                    <span>Years in Service: </span>
                    <span>Status: 
                        <?php 
                            if(strtoupper($faculty_info['position']) === "PART-TIME"){
                                echo "<b>Part-time</b>";
                            }else if(strtoupper($faculty_info['position']) === "CONTRUCTUAL"){
                                echo "<b>Contructual</b>";
                            }else{
                                echo "<b>Permanent</b>";
                            }
                        ?>
                    </span>
                </section>
                <section>
                    <span>Educational Qualification: <b><?php echo $faculty_info['educ_qualification']; ?></b></span>
                    <span>Major: <b><?php echo $faculty_info['qual_major']; ?></b></span>
                    <span>Eligibility: <b><?php echo $faculty_info['eligibility_prc']; ?></b></span>
                </section>
            </div>

            <table>
                <thead>
                    <th>DAY & TIME</th>
                    <th>PROGRAM CODE</th>
                    <th>COURSE CODE</th>
                    <th>DESCRIPTION</th>
                    <th>UNITS</th>
                    <th>ROOM</th>
                </thead>
                <?php 
                    $schedule_frame = array(
                        array("day" => "MTh", "meridiem" => array("morning", "afternoon")),
                        array("day" => "MWF", "meridiem" => array("morning", "afternoon")),
                        array("day" => "Wed", "meridiem" => array("morning", "afternoon")),
                        array("day" => "TF", "meridiem" => array("morning", "afternoon")),
                        array("day" => "TTh", "meridiem" => array("morning", "afternoon")),
                        array("day" => "Sat", "meridiem" => array("morning", "afternoon"))
                    );

                    foreach($schedule_frame as $frame){
                        for($i=0; $i<2; $i++){
                            ?>
                            <thead>
                                <th class="left_text">
                                    <?php 
                                        echo strtoupper($frame["meridiem"][$i]) . ($frame["meridiem"][$i] == "morning" ? " - ".$frame["day"] : "");
                                    ?>
                                </th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </thead>
                            <tbody id="<?php echo $frame["day"] ."_". $frame["meridiem"][$i];?>">
                                <tr class="placeholder">
                                    <td class="left_text"><?php echo $frame["meridiem"][$i] == "morning" ? "7:30-12:00" : "1:00-8:00"; ?></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <?php
                        }
                    }
                ?>
                <thead>
                    <th class="left_text" colspan="2">Total No. of Units</th>
                    <th></th>
                    <th></th>
                    <th id="unitsSubTotal_1"></th>
                    <th></th>
                </thead>
                <thead>
                    <th class="left_text" colspan="2">
                        Number of Preparation : 
                        <span id="number_of_preparation"></span>
                    </th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </thead>
                <thead>
                    <th class="left_text" colspan="3">
                        Add: Designation:  <span id="designation"></span>
                    </th>
                    <th></th>
                    <th id="deloading"></th>
                    <th></th>
                </thead>
                <thead>
                    <th class="left_text" colspan="2">Total No. of Units</th>
                    <th></th>
                    <th></th>
                    <th id="unitsSubTotal_2"></th>
                    <th></th>
                </thead>
                <thead>
                    <th class="left_text" colspan="2">Add Special Assigment</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </thead>
                <thead>
                    <th class="left_text">Total Units</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th id="total_units"></th>
                    <th></th>
                </thead>
            </table>

            <div class="undersigned">
                <section>
                    <div>
                        <span>Prepared by:</span>
                        <div class="name">
                            <h4>
                                <?php 
                                    if($department_chair){
                                        $prepared_by_mname = !empty($department_chair["mname"]) ? $department_chair["mname"][0].". " : '';
                                        $qual_pre = !empty($department_chair['educ_qualification']) ? ", ".$department_chair['educ_qualification'] : "";
                                        $prepared_by_name = $department_chair["fname"]." ".$prepared_by_mname." ".$department_chair["lname"].$qual_pre;
                                        echo strtoupper($prepared_by_name);     
                                    }else{
                                        echo "No Department Chair Assigned";
                                    }
                                ?>
                            </h4>
                            <span><?php echo $faculty_info["crs_code"].", ";?>Department Chair</span>
                        </div>
                    </div>
                    <div>
                        <span>Conforme:</span>
                        <div class="name">
                            <h4>
                                <?php 
                                $conforme_mname = !empty($faculty_info["mname"]) ? $faculty_info["mname"][0].". " : '';
                                $qual_conf = !empty($faculty_info['educ_qualification']) ? ", ".$faculty_info['educ_qualification'] : "";
                                $conforme_name = $faculty_info['fname']." ".$conforme_mname . $faculty_info['lname'];
                                echo strtoupper($conforme_name . $qual_conf);
                                ?>
                            </h4>
                            <span><?php echo $faculty_info['position'];?></span>
                        </div>
                    </div>
                </section>

                <section>
                    <div>
                        <span>Recommending Approval:</span>
                        <div class="recom_approval">
                            <!-- RECOMMENDING APPROVAL WILL SHOW HERE -->
                        </div>
                    </div>
                    <div>
                        <div class="name">
                            <h4><?php echo !empty($faculty_info['name']) ? strtoupper($faculty_info['name']).", " : "No Dean Assigned";?>
                                <?php echo strtoupper($faculty_info['degree']);?>
                            </h4>
                            <span>Dean, <?php echo $faculty_info['coll_desc']; ?></span>
                        </div>
                    </div>
                </section>

                <section>
                    <div>
                        <span>Approved:</span>
                        <div class="approved">
                            <!-- APPROVED WILL SHOW HERE -->
                        </div>
                    </div>

                    <div>
                        <div class="name">
                            
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/instructor_load.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>