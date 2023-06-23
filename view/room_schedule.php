<?php 
    if(!isset($_GET["room_id"])){
        header("Location: ./");
    }

    require_once "../controllers/RoomContr.php";
    $room_contr = new RoomContr();

    $room = $room_contr->get_room_by_id($_GET["room_id"]);

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
    <link rel="stylesheet" href="../public/css/room_schedule.css">
    <link rel="stylesheet" href="../public/css/general.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Room Schedule</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>
             
            <div class="content">
                <div class="room_report">
                    <header>
                        <h3><?php echo $room["building"] ;?> Report</h3>
                        
                        <span id="academic_year">
                            <!-- ACADEMISC YEAR WILL DISPLAY HERE -->
                        </span>

                        <span id="semester">
                            <!-- ACADEMISC YEAR WILL DISPLAY HERE -->
                        </span>

                        <div class="actions">
                            <select name="" id="select_acad_year">
                                <?php 
                                $sched_years = $sched_contr->read_room_sched_ay($_GET["room_id"]);
                                if(!empty($sched_years)){
                                    foreach($sched_years as $item){
                                        echo '<option value="'.$item["acad_year"].'">AY: '.$item["acad_year"].'</option>';
                                    }
                                }else{
                                    // SHOW ACADEMIC YEAR BASED ON CURRENT YEAR
                                    $academic_year = date("Y").'-'.(date("Y")+1);
                                    echo '<option value="'.$academic_year.'">AY: '.$academic_year.'</option>';
                                }
                                ?>
                            </select>

                            <select id="select_semester">
                                <option value="first">1st sem</option>
                                <option value="second">2nd sem</option>
                                <option value="summer">summer</option>
                            </select>

                            <button id="print_btn" onclick="window.print();">
                                <i class="fa-solid fa-print"></i> Print
                            </button>
                        </div>
                    </header>
                    <div class="report_content">
                        <section>
                            <span>Monday</span>
                            <div id="monday">
                                <!-- SCHEDULES WILL DISPLAY HERE -->
                            </div>
                        </section>

                        <section>
                            <span>Teusday</span>
                            <div id="tuesday">
                                <!-- SCHEDULES WILL DISPLAY HERE -->
                            </div>
                        </section>

                        <section>
                            <span>Wednesday</span>
                            <div id="wednesday">
                                <!-- SCHEDULES WILL DISPLAY HERE -->
                            </div>
                        </section>

                        <section>
                            <span>Thursday</span>
                            <div id="thursday">
                                <!-- SCHEDULES WILL DISPLAY HERE -->
                            </div>
                        </section>

                        <section>
                            <span>Friday</span>
                            <div id="friday">
                                <!-- SCHEDULES WILL DISPLAY HERE -->
                            </div>
                        </section>

                        <section>
                            <span>Saturday</span>
                            <div id="saturday">
                                <!-- SCHEDULES WILL DISPLAY HERE -->
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/room_schedule.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>

