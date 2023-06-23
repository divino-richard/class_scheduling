<?php 
    require_once "../controllers/SignatoryContr.php";
    $signatory_contr = new SignatoryContr(); // CONTROLLER INSTANCE

    // SUBMIT SIGNATORY
    if(isset($_POST["submit_signatory"])){
        $signatory_contr->add_signatory();
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
    <title>Signatories</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <div class="table_container">
                    <section>
                        <h3>Signatories</h3>
                        <button class="add_btn" id="add_signatory">Add Signatory</button>
                    </section>
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Degree</th>
                            <th>Designation</th>
                            <th>Actions</th>
                        </tr>
                        
                        <?php 
                            foreach($signatory_contr->get_signatories() as $signatory){
                                ?>
                                <tr>
                                    <td><?php echo $signatory["name"]; ?></td>
                                    <td><?php echo $signatory["degree"]; ?></td>
                                    <td><?php echo $signatory["designation"]; ?></td>
                                    <td>
                                        <button class="tb_action_item" title="edit" onclick='handleSignatoryEdit(`<?php echo json_encode($signatory); ?>`);'>
                                            <i class="fas fa-pencil"></i>
                                        </button>

                                        <button class="tb_action_item" title="delete" onclick="handleSignatoryDelete(`<?php echo $signatory['id']; ?>`);">
                                            <i class="fas fa-trash"></i>
                                        </button>
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
                            <span>Add Signatory</span>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Name</label>
                            <input type="text" name="name" placeholder="required*" required>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Degree</label>
                            <input type="text" name="degree" placeholder="required*" required>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Designation</label>
                            <select name="designation" required>
                                <option value="Vice President for Academic Affairs">Vice President for Academic Affairs</option>
                                <option value="SUC President III">SUC President III</option>
                                <option value="Campus Director">Campus Director</option>
                                <option value="Asst. Campus Director">Asst. Campus Director</option>
                            </select>
                        </div>
                        <div id="form_submit">
                            <input type="submit" name="submit_signatory" value="Add Signatory">
                        </div> 
                    </form>
                </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/signatory.js"> </script>
    <script src="../public/js/general.js"></script>
</body>
</html>