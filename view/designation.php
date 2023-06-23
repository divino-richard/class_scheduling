<?php
    require_once "../controllers/DesignationContr.php";
    $designation_contr = new DesignationContr();

    if(isset($_POST["add_designation"])){
        $designation_contr->add_designation();
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
    <title>Faculty Designations</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <div class="table_container">
                    <section>
                        <h3>Faculty designation</h3>

                        <input type="text" class="search_box" onkeyup="searchDesignation(event);" placeholder="Search Designation by Title">
                        
                        <button class="add_btn" id="add_designation">
                            <span>Add Designation</span>
                        </button>
                    </section>

                    <table>
                        <thead>
                            <th>Designation Title</th>
                            <th>Deloading</th>
                            <th>Actions</th>
                        </thead>

                        <tbody id="designation_list">
                            <?php 
                            foreach($designation_contr->get_designations() as $designation){
                                ?>
                                <tr>
                                    <td><?php echo $designation["designation_title"]; ?></td>
                                    <td><?php echo $designation["deloading"] . " units"; ?></td>
                                    <td>
                                        <div class="actions_con">
                                            <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                            <div class="actions">
                                                <button class="tb_action_item" onclick='handleDesignationEdit(`<?php echo json_encode($designation); ?>`);' title="edit">
                                                    <i class="fas fa-pencil"></i>
                                                </button>

                                                <button class="tb_action_item" title="delete" onclick="handleDesignationDelete(`<?php echo $designation['designation_id']; ?>`);">
                                                    <i class="fas fa-trash"></i>
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
        </div>
    </div>

   <!-- ADD MODAL -->
   <div class="modal_container">
        <form action="" method="POST" class="modal_content" style="height:max-content">
            <div class="form_title">
                <span>Add Faculty Designation</span>
            </div>
            <div class="input_wrapper">
                <label for="">Designation Title</label>
                <input type="text" name="designation_title" placeholder="required*" required>
            </div>
            <div class="input_wrapper">
                <label for="">Deloading:</label>
                <input type="number" name="deloading" id="" placeholder="Units" min="1">
            </div>
            <div id="form_submit">
                <input type="submit" name="add_designation" value="Add Designation">
            </div>
        </form>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/designation.js"></script>  
    <script src="../public/js/general.js"></script>
</body>
</html>