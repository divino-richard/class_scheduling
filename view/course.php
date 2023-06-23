<?php
    require_once "../controllers/CourseContr.php";
    $course_contr = new CourseContr(); // CONTROLLER INSTANCE
    
    require_once "../controllers/CollegeContr.php";
    $coll_contr = new CollegeContr(); // CONTROLLER INSTANCE

    require_once "../controllers/FacultiesContr.php";
    $fac_contr = new FacultiesContr(); // CONTROLLER INSTANCE

    if(isset($_POST["submit_course"])){
        // CALLING THE FUNCTION
        $course_contr->add_course();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/NEMSU.png">
    <link rel="stylesheet" href="../public/css/general.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Courses</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <div class="table_container">
                    <section>
                        <h3>Courses</h3>
                        <button class="add_btn" id="add_course">Add Course</button>
                    </section>

                    <table>
                        <tr>
                            <th>Code</th>
                            <th>Description</th>
                            <th>Coordinator</th>
                            <th>Major</th>
                            <th>College</th>
                            <th>Actions</th>
                        </tr>

                        <?php
                        foreach($course_contr->get_courses() as $course){
                            $program_coordinator = $course_contr->get_program_coordinator($course["course_id"]);
                            ?>
                            <tr>
                                <td><?php echo $course["crs_code"]; ?></td>
                                <td><?php echo $course["crs_desc"]; ?></td>
                                <td>
                                    <?php 
                                    if(!empty($program_coordinator)){
                                        echo $program_coordinator["fname"]. " " .$program_coordinator["lname"]; 
                                    }else{
                                        echo "-";
                                    }
                                    ?>
                                </td>
                                <td><?php echo !empty($course["major"]) ? $course["major"] : '-'; ?></td>
                                <td><?php echo $course["coll_code"]; ?></td>
                                <td>
                                    <div class="actions_con">
                                        <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                        <div class="actions">
                                            <button class="tb_action_item" onclick='handleCourseEdit(`<?php echo json_encode($course); ?>`);' title="edit">
                                                <i class="fas fa-pencil"></i>
                                            </button>

                                            <button class="tb_action_item" title="delete" onclick="handleDeleteCourse(`<?php echo $course['course_id']; ?>`);">
                                                <i class="fas fa-trash"></i>
                                            </button>

                                            <a class="tb_action_item" href="./prospectus.php?course_id=<?php echo $course["course_id"]; ?>" title="prospectus" style="font-size:1.3rem; color:#1c0ed7;">
                                                <i class="fa-solid fa-file"></i>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                    </table>
                </div>
            </div>

            <!-- ADD COURSE MODAL -->
            <div class="modal_container">
                <form action="" method="POST" class="modal_content" style="height:fit-content">
                    <div class="form_title">
                        <span>Add Course</span>
                    </div>

                    <div class="input_wrapper">
                        <label for="">College:</label>
                        <select name="coll_id" id="" required>
                            <option value="">--Select college--</option>
                            <!-- TODO - Get all college -->
                            <?php 
                                foreach($coll_contr->get_colleges() as $college){
                                    echo '<option value="'.$college["coll_id"].'">'.$college["coll_code"].'</option>';
                                }
                            ?>
                        </select>
                    </div>

                    <div class="input_wrapper">
                        <label for="">Code:</label>
                        <input type="text" name="crs_code" placeholder="required*" required>
                    </div>

                    <div class="input_wrapper">
                        <label for="">Description:</label>
                        <input type="text" name="crs_desc" placeholder="required*" required>
                    </div>

                    <div class="input_wrapper">
                        <label for="">Major:</label>
                        <input type="text" name="major" placeholder="optional" >
                    </div>

                    <div id="form_submit">
                        <input type="submit" name="submit_course" value="Add Course">
                    </div>
                </form>
            </div>
        </div>
    </div>     

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/course.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>