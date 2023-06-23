<?php 
    require_once "../controllers/CollegeContr.php";
    $college_contr = new CollegeContr(); // CONTROLLER INSTANCE
    require_once "../controllers/CourseContr.php";
    $course_contr = new CourseContr(); // CONTROLLER INSTANCE

    // SUBMIT COLLEGE
    if(isset($_POST["submit_college"])){
        $college_contr->add_college();
        header("Location: ./college.php");
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
    <link rel="stylesheet" href="../public/css/college.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Colleges</title>
</head>
<body>
    <div class="container">
        <?php 
            include '../includes/sidebar.php'; 
        ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
               
                <div class="table_container">
                    <section>
                        <h3>Colleges</h3>
                        <button class="add_btn" id="add_college">Add College</button>
                    </section>
                    <table>
                        <tr>
                            <th>Code</th>
                            <th>Description</th>
                            <th>Dean</th>
                            <th>Actions</th>
                        </tr>
                        <?php 
                            foreach ($college_contr->get_colleges() as $college){
                                ?>
                                    <tr>
                                        <td><?php echo $college["coll_code"]; ?></td>
                                        <td><?php echo $college["coll_desc"]; ?></td>
                                        <td><?php echo !empty($college["name"]) ? $college["name"] : "-";?></td>
                                        <td>
                                            <div class="actions_con">
                                                <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                                <div class="actions">
                                                    <button class="tb_action_item" onclick='handleCollegeEdit(`<?php echo json_encode($college); ?>`);' title="edit">
                                                        <i class="fas fa-pencil"></i>
                                                    </button>

                                                    <button class="tb_action_item" onclick="handleCollegeDelete(`<?php echo $college['coll_id']; ?>`)" title="delete">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
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

            <!-- ADD INSTRUCTOR MODAL -->
            <div class="modal_container">
                    <form action="" method="POST" class="modal_content" style="height:max-content">
                        <div class="form_title">
                            <span>Add College</span>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Code:</label>
                            <input type="text" name="coll_code" placeholder="required*" required>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Description:</label>
                            <input type="text" name="coll_desc" placeholder="required*" required>
                        </div>
                                             
                        <div class="dean_info">
                            <span>College Dean</span>
                            <div class="input_wrapper">
                                <label for="">Name</label>
                                <input type="text" name="name" placeholder="required" required>
                            </div>
                            <div class="input_wrapper">
                                <label for="">Degree</label>
                                <input type="text" name="degree" placeholder="required" required>
                            </div>
                        </div>

                        <div id="form_submit">
                            <input type="submit" name="submit_college" value="Add College">
                        </div> 
                    </form>
                </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/college.js"> </script>
    <script src="../public/js/general.js"></script>
</body>
</html>