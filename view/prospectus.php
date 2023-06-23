<?php
    if(!isset($_GET["course_id"]) || empty($_GET["course_id"])){
        header("Location: ./");
        exit();
    }

    require_once "../controllers/ProspectusContr.php";
    require_once "../controllers/CourseContr.php";
    $prospect_contr = new ProspectusContr();
    $course_contr = new CourseContr();

    if(isset($_POST["add_prospectus_now"])){
        $prospect_contr->add_prospectus($_GET["course_id"]);
    }

    // $revision_year = isset($_GET["revision_year"]) ? $_GET["revision_year"] : $prospect_contr->get_latest_prospectus($_GET["course_id"]);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/general.css">
    <link rel="stylesheet" href="../public/css/prospectus.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Prospectus</title>
</head>

<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <!-- ADD NEW PROSPECTUS MODAL -->
                <div class="modal_container">
                    <form action="" method="POST" class="add_prospectus">
                        <h3>Adding New Prospectus</h3>
                        <section>
                            <div class="year_picker">
                                <span>Effectivity: AY </span>
                                <select name="year1">
                                    <?php
                                    $currentYear = date('Y');
                                    foreach (range(2017, $currentYear+1) as $value) {
                                        echo "<option>" . $value . "</option > ";
                                    }
                                    ?>
                                </select>
                                -
                                <select name="year2">
                                    <?php
                                    $currentYear = date('Y');
                                    foreach (range(2018, $currentYear+2) as $value) {
                                        echo "<option>" . $value . "</option > ";
                                    }
                                    ?>
                                </select>
                            </div>
                            <input type="submit" name="add_prospectus_now" value="Add Now">
                        </section>
                    </form>
                </div>

                <?php
                $course = $course_contr->get_course_by_ID($_GET["course_id"]);

                // IF THE REVISION YEAR IS BEING SET THEN GET PROPECTUS BY REVISION YEAR ATHOERWISE GET THE LATEST PROSPECTUS
                if(isset($_GET["revision_year"]))
                    $prospectus = $prospect_contr->get_prospectus_by_rev_year($_GET["course_id"], $_GET["revision_year"]);
                else
                    $prospectus = $prospect_contr->get_prospectus($_GET["course_id"]);
                ?>
                <div class="prospectus_actions">
                    <!-- <div class="select_revision_year">
                        <span>Effectivity: AY </span>
                        <select name="" id="select_revision_year" onchange="changeProspectus(`<?php echo $_GET['course_id']; ?>`, event);">
                        <?php
                            // $all_prospectus = $prospect_contr->get_all_prospectus($_GET["course_id"]);
                            // if(count($all_prospectus) > 0){
                            //     foreach($all_prospectus as $prospec){
                            //         if($prospec["revision_year"] == $prospectus["revision_year"]){
                            //             echo '<option value="'.$prospec["revision_year"].'" selected="true" >
                            //                 '.$prospec["revision_year"].'
                            //             </option>';
                            //         }else{
                            //             echo '<option value="'.$prospec["revision_year"].'">
                            //                 '.$prospec["revision_year"].'
                            //             </option>';
                            //         }
                            //     }
                            // }else{
                            //     echo '<option value="">None</option>';
                            // }
                        ?>
                        </select>
                    </div> -->

                    <?php
                    if($_SESSION["user"]["user_type"] === 'admin' || $_SESSION["user"]["user_type"] === 'staff'){
                        echo '<button class="add_new_btn">Add New Prospectus</button>';
                    }
                    ?>
                </div>
                <?php

                if($prospectus){
                    ?>
                    <div class="prospectus">
                        <div class="prospectus_header">
                            <img class="univ_logo" src="../public/img/NEMSU.png" alt="">
                            <section>
                                <span>Republic of The Philippines</span>
                                <h3>North Eastern Mindanao State University</h3>
                                <h4>LIANGA CAMPUS</h4>
                                <h4>Lianga Surigao del Sur, 8307</h4><br>
                                <h4><?php echo ucwords($course["coll_desc"]); ?></h4>
                                <h4><?php echo ucwords($course["crs_desc"]); ?></h4><br>
                                <h4>Field of Specialization/Major: <?php echo $course["major"]; ?></h4>
                                <h4 id="revision_year_header">Effectivity: AY 
                                    <?php echo $prospectus["revision_year"];?>
                                </h4>
                            </section>
                            <img src="../public/img/ISO.jpg" alt="">
                        </div>

                        <section>
                            <select name="" id="prospectus_details_year">
                                <option value="first">1st year</option>
                                <option value="second">2nd year</option>
                                <option value="third">3rd year</option>
                                <option value="fourth">4th year</option>
                            </select>
                            <select name="" id="prospectus_details_sem">
                                <option value="first">1st sem</option>
                                <option value="second">2nd sem</option>
                                <option value="summer">summer</option>
                            </select>
                        </select>

                        <div class="prospectus_details_con">
                            <?php 
                                foreach($prospectus["details"] as $details){
                                    $details_id = $details["year"]."year_".$details["sem"]."sem";
                                    ?>

                                    <div class="prospectus_details" id="<?php echo 'prospectus_details_' . $details["year"]."_year_".$details["sem"]."_sem"; ?>">
                                        <section>
                                            <h4><?php echo strtoupper($details["year"])." YEAR, ". strtoupper($details["sem"])." SEMESTER";?></h4>
                                            <div>
                                            <?php 
                                            if($_SESSION["user"]["user_type"] === 'admin' || $_SESSION["user"]["user_type"] === 'staff'){
                                                ?>
                                                <button class="add_subject_btn" onclick="displayAddSubjectInputs(`<?php echo $details_id;?>`);">
                                                    <i class="fas fa-plus"></i>
                                                    Add Subject
                                                </button>
                                                <?php
                                            }
                                            ?>
                                            <a class="create_schedule_btn" href="./scheduling_area.php?<?php echo 'coll_id='.$course["coll_id"].'&course_id='.$_GET["course_id"].'&revision_year='.$prospectus['revision_year'].'&year='.$details['year'].'&sem='.$details['sem'].'';?>">
                                                <i class="fas fa-calendar-plus"></i>
                                                Create / Modify Schedule
                                            </a>
                                            </div>
                                        </section>

                                        <table>
                                            <thead>
                                                <th>Descriptive Title</th>
                                                <th>Code</th>
                                                <th>Lec Hrs</th>
                                                <th>Lab Hrs</th>
                                                <th>Units</th>
                                                <th>Pre-req.</th>
                                                <?php echo $_SESSION["user"]["user_type"] === 'admin' || $_SESSION["user"]["user_type"] === 'staff' ? "<th>Action</th>" : "";?>
                                            </thead>

                                            <tbody id="<?php echo $details_id;?>">
                                                <?php
                                                foreach($details["subjects"] as $subject){
                                                    ?>
                                                    <tr id="<?php echo str_replace(' ', '', $subject["subject_code"]); ?>">
                                                        <td><?php echo $subject["title"]; ?></td>
                                                        <td><?php echo $subject["subject_code"]; ?></td>
                                                        <td><?php echo $subject["lec_hr"]; ?></td>
                                                        <td><?php echo $subject["lab_hr"]; ?></td>
                                                        <td><?php echo $subject["units"]; ?></td>
                                                        <td><?php echo $subject["pre_requisites"]; ?></td>
                                                        <?php 
                                                        if($_SESSION["user"]["user_type"] === 'admin' || $_SESSION["user"]["user_type"] === 'staff'){
                                                            ?>
                                                            <td class="subject_action">
                                                                <button onclick='handleSubjectEdit(`<?php echo json_encode($subject); ?>`);'>
                                                                    <i class="fas fa-pencil"></i>
                                                                </button>
                                                                <button onclick='deleteSubject(
                                                                    `<?php echo $_GET["course_id"]; ?>`, 
                                                                    `<?php echo$prospectus["revision_year"]; ?>`, 
                                                                    `<?php echo$subject["subject_code"]; ?>`)'>
                                                                    <i class="fas fa-trash"></i>
                                                                </button>
                                                            </td>
                                                            <?php
                                                        }
                                                        ?>
                                                    </tr>
                                                    <?php
                                                }
                                                ?>
                                            </tbody>
                                        </table>

                                        <div class="add_subject_actions" id="<?php echo $details_id;?>">
                                            <button class="save_btn" 
                                                onclick="saveSubject(`<?php echo $details_id;?>`, `<?php echo $prospectus['revision_year'];?>`, `<?php echo $details['year']?>`, `<?php echo $details['sem']?>`);">
                                                Save</button>

                                            <button class="cancel_btn" onclick="cancelSubject(`<?php echo $details_id;?>`);">Cancel</button>
                                        </div>
                                    </div>
                                    <?php
                                }
                            ?>
                        </div>
                    </div>
                    <?php
                }else{
                    ?>
                    <div class="prospectus_placeholder">
                        <h2>NO PROSPECTUS YET</h2>
                        <img src="../public/img/document.png" alt="">
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

    <script src="../public/js/prospectus.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>
