<?php    
    require_once "../controllers/CourseContr.php";
    $course_contr = new CourseContr(); // CONTROLLER INSTANCE

    require_once "../controllers/SignatoryContr.php";
    $signatory_contr = new SignatoryContr();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/all.css">
    <link rel="stylesheet" href="../public/css/class_schedule.css">
    
    <title>Student Class Schedules</title>
</head>
<body>
    <div class="small_header">
        <button id="show_header_btn"><i class="fa-solid fa-bars"></i></button>
    </div>
    
    <div class="header">
        <section>
            <button id="hide_header_btn"><i class="fa-solid fa-xmark"></i></button>

            <select id="select_course">
                <?php 
                foreach($course_contr->get_courses() as $course){
                    echo '<option value='.$course["course_id"].'>'.$course["crs_code"].'</option>';                        
                }
                ?>
            </select>
           
            <select id="select_year">
                <option value="first">1st Year</option>
                <option value="second">2nd Year</option>
                <option value="third">3rd Year</option>
                <option value="fourth">4th Year</option>
            </select>
            
            <select id="select_sem">
                <option value="first">1st Sem</option>
                <option value="second">2nd Sem</option>
                <option value="summer">Summer</option>
            </select>
           
            <select id="select_section">
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
            <button class="download_btn" onclick="downloadClassSchedule();"><i class="fa-solid fa-download"></i> Download</button>
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
                    <p><span class="course_head"></span></p>
                    <p><span class="major_head"></span></p>
                    <?php 
                        // GENERATE ACADEMIC YEAR
                        $month = date('m');
                        // MIDLE MONTH OF THE SEMESTER IS June or 06 IN NUMBER 
                        if($month < 6)
                            $year1 = date('Y') - 1;
                        else
                            $year1 = date('Y');
                        $year2 = $year1+1;
                        echo 'AY: '.$year1 . '-' . $year2;
                    ?>
                    <p><span class="semester_head"></span> SEMESTER</p>
                </div>
                <img class="iso_logo" src="../public/img/ISO.jpg" alt="">
            </div>

            <table id="table" >
                <!-- SCHEDULE CONTENT WILL DISPLAY HERE -->
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
        <div class="zoom_container">
            <button class="zoom_btn" id="zoom_in" onclick="changeZoomTool('zoom_out');"><i class="fa-solid fa-magnifying-glass-plus"></i></button>
            <button class="zoom_btn" id="zoom_out" onclick="changeZoomTool('zoom_in');"><i class="fa-solid fa-magnifying-glass-minus"></i></button>
        </div>
    </div>

    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/student_schedules.js"></script>
    <script src="../public/js/html2pdf.bundle.min.js"></script>
</body>
</html>

