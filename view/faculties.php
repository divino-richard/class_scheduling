<?php
    require_once "../controllers/FacultiesContr.php";
    require_once "../controllers/CourseContr.php";
    require_once "../controllers/DesignationContr.php";
    $faculties_contr = new FacultiesContr(); // CONTROLLER INSTANCE
    $course_contr = new CourseContr(); // CONTROLLER INSTANCE
    $designation_contr = new DesignationContr();

    // IF THE COURSE ID IS PRESENT THEN GET FACULTIES BASED ON COURSE ID
    // OTHERWISE GET FACULTIES OF ALL COURSES
    if(isset($_GET["course_id"])){
        $faculties = $faculties_contr->get_fac_by_crsID($_GET["course_id"]);
    }else{
        $faculties = $faculties_contr->get_faculties();
    }
    if(isset($_POST["add_faculty"])){
        // CALLING THE FUNCTION
        $faculties_contr->add_faculty();
        // print_r($_POST);
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
    <style>
        .modal_content h3{
            margin: 1rem 3rem;
            padding: 1rem 0;
            border-bottom: 1px solid #000000;
        }
        .modal_content ul{
            padding: 1rem 3rem;
            list-style: none;
        }
        .modal_content li{
            padding: .5rem 0;
        }
    </style>
    <title>Faculties</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                
                <div class="table_container">
                    <section>
                        <h3>Faculties</h3>

                        <input type="text" class="search_box" onkeyup="searchFaculty(event, `<?php echo $_SESSION['user']['user_type'];?>`);" placeholder="Search Faculty by Name or ID">

                        <?php 
                        if($_SESSION["user"]["user_type"] == "admin" || $_SESSION["user"]["user_type"] == "staff"){
                            ?>
                            <button class="add_btn" id="add_faculty">
                                <span>Add Faculty</span>
                            </button>
                            <?php
                        }
                        ?>
                    </section>

                    <table>
                        <tr>
                            <th>Faculty ID</th>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Designation</th>
                            <th>Actions</th>
                        </tr>

                        <tbody id="faculty_list">
                            <?php
                            foreach($faculties as $faculty){
                                ?>
                                <tr>
                                    <td><?php echo $faculty["fac_id"]; ?></td>
                                    <td><?php echo $faculty["fname"].' '.$faculty["mname"].' '.$faculty["lname"]; ?></td>
                                    <td><?php echo $faculty["position"]; ?></td>
                                    <td>
                                        <?php 
                                        $fac_designations = $designation_contr->get_faculty_designations($faculty["fac_id"]);
                                        if(count($fac_designations) > 0){
                                            foreach($fac_designations as $designation){
                                                echo "<span>".$designation["designation_title"]."</span><br>";
                                            }
                                        }else {
                                            echo '-';
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <div class="actions_con">
                                            <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                            <div class="actions">
                                                <?php
                                                // ONLY SHOW THE DELETE AND EDIT ACTION TO THE ADMIN 
                                                if($_SESSION["user"]["user_type"] == "admin"){
                                                    ?>
                                                    <button class="tb_action_item" onclick='handleFacultyEdit(`<?php echo json_encode($faculty); ?>`);' title="edit">
                                                        <i class="fas fa-pencil"></i>
                                                    </button>

                                                    <button class="tb_action_item" title="delete" onclick="handleDeleteFaculty(`<?php echo $faculty['fac_id']; ?>`, `<?php echo $faculty['course_id']; ?>`);">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                    <?php
                                                }
                                                ?>
                                                <button class="tb_action_item" onclick='showMoreFacultyInfo(`<?php echo json_encode($faculty); ?>`);' title="view">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="tb_action_item" title="schedule">
                                                    <a href="./instructor_load.php?<?php echo 'fac_id='.$faculty["fac_id"].'&course_id='.$faculty["course_id"]; ?>">
                                                        <i class="fas fa-table-cells"></i>
                                                    </a>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- ADD INSTRUCTOR MODAL -->
            <div class="modal_container">
                <form action="" method="POST" class="modal_content">
                    <div class="form_title">
                        <span>Register Faculty</span>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Faculty ID:</label>
                        <input type="text" name="fac_id" placeholder="required*" required>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Course:</label>
                        <select name="course_id" id="select_course" required>
                            <option value="">--Select course--</option>
                            <?php 
                            foreach($course_contr->get_courses() as $course){
                                echo '
                                    <option value="'.$course["course_id"].'">'.$course["crs_code"].'</option>
                                ';
                            }
                            ?>
                        </select>
                    </div>
                    <div class="input_wrapper">
                        <label for="">First name:</label>
                        <input type="text" name="fname" placeholder="required*" required>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Middle name:</label>
                        <input type="text" name="mname" placeholder="optional">
                    </div>
                    <div class="input_wrapper">
                        <label for="">Last name:</label>
                        <input type="text" name="lname" placeholder="required*" required>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Address:</label>
                        <textarea name="address" placeholder="required*" required></textarea>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Sex:</label>
                        <div class="radio_group">
                            <input type="radio" name="sex" value="male" checked> <span>Male</span>
                            <input type="radio" name="sex" value="female"> <span>Female</span>
                        </div>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Status:</label>
                        <select name="marital_stat" required>
                            <option value="">--Select status--</option>
                            <option value="single">Single</option>
                            <option value="married">Married</option>
                            <option value="widowed">Widowed</option>
                            <option value="separated">Separated</option>
                        </select>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Contact:</label>
                        <input type="number" name="contact" min="0" placeholder="required*" required>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Is vaccinated:</label>
                        <div class="radio_group">
                            <input type="radio" name="vaccinated" value="true" checked> <span>Yes</span>
                            <input type="radio" name="vaccinated" value="false"> <span>No</span>
                        </div>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Educ. Qualification:</label>
                        <input type="text" name="educ_qualification" placeholder="required*" required>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Major:</label>
                        <input type="text" name="qual_major" placeholder="optional">
                    </div>
                    <div class="input_wrapper">
                        <label for="">Eligibility/PRC:</label>
                        <input type="text" name="eligibility_prc" placeholder="optional">
                    </div>
                    <div class="input_wrapper">
                        <label for="">Position:</label>
                        <select name="position" required>
                            <option value="Instructor I">Instructor I</option>
                            <option value="Instructor II">Instructor II</option>
                            <option value="Instructor III">Instructor III</option>
                            <option value="Instructor IV">Instructor IV</option>
                            <option value="Instructor V">Instructor V</option>

                            <option value="Asst. Professor I">Asst. Professor I</option>
                            <option value="Asst. Professor II">Asst. Professor II</option>
                            <option value="Asst. Professor III">Asst. Professor III</option>
                            <option value="Asst. Professor IV">Asst. Professor IV</option>
                            <option value="Asst. Professor V">Asst. Professor V</option>
                            
                            <option value="Professor I">Professor I</option>
                            <option value="Professor II">Professor II</option>
                            <option value="Professor III">Professor III</option>
                            <option value="Professor IV">Professor IV</option>
                            <option value="Professor V">Professor V</option>

                            <option value="Contructual">Contructual</option>

                            <option value="Part-time">Part-time</option>
                        </select>
                    </div>
                    <div class="input_wrapper">
                        <label for="">Designation:</label>
                        <div class="checkboxes">
                            <?php 
                            foreach($designation_contr->get_designations() as $designation){
                                echo '
                                    <div class="checkbox_wrapper">
                                        <input type="checkbox" name="designation[]" id="'.$designation["designation_id"].'" value="'.$designation["designation_id"].'">
                                        <span>'.$designation["designation_title"].'</span>
                                    </div>
                                ';
                            }
                            ?>
                        </div>
                    </div>
                    <div id="form_submit">
                        <input type="submit" name="add_faculty" value="Add Faculty">
                    </div>
                </form>
            </div>
        </div>
    </div>  
    
    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/faculties.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>