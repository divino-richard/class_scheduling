
<?php 
    require_once "../controllers/UserContr.php";
    $user_contr = new UserContr();

    if(isset($_POST["add_staff"])){
        $user_contr->add_staff();
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
    <title>Staff</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <div class="table_container">
                    <section>
                        <h3>Staff</h3>
                        <button class="add_btn" id="add_staff">
                            <span>Add Staff</span>
                        </button>
                    </section>

                    <table>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Default password</th>
                        <th>Actions</th>

                        <tbody id="position_list">
                            <?php 
                            if(count($user_contr->get_staff()) > 0){
                                foreach($user_contr->get_staff() as $staff){
                                    ?>
                                    <tr>
                                        <td><?php echo $staff["fname"] . " " . $staff["mname"] . " " . $staff["lname"] . " " . $staff["ext"]; ?></td>
                                        <td><?php echo $staff["username"];?></td>
                                        <td><?php echo $staff["user_id"]; ?></td>
                                        <td>
                                            <div class="actions_con">
                                                <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                                <div class="actions">
                                                    <button class="tb_action_item" onclick='handleStaffEdit(`<?php echo json_encode($staff); ?>`);' title="edit">
                                                        <i class="fas fa-pencil"></i>
                                                    </button>
    
                                                    <button class="tb_action_item" title="delete" onclick="handleDeleteStaff(`<?php echo $staff['user_id']?>`);">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div> 
    
    <!-- MODAL -->
    <div class="modal_container">
        <form action="" method="POST" class="modal_content" style="height:max-content">
            <div class="form_title">
                <span>Add Staff</span>
            </div>
            <div class="input_wrapper">
                <label for="">First name
                </label>
                <input type="text" name="fname" placeholder="required*" required>
            </div>
            <div class="input_wrapper">
                <label for="">Middle name
                </label>
                <input type="text" name="mname" placeholder="optional" >
            </div>
            <div class="input_wrapper">
                <label for="">Last name</label>
                <input type="text" name="lname" placeholder="required" required>
            </div>
            <div class="input_wrapper">
                <label for="">Extension (Jr, II)</label>
                <input type="text" name="ext" placeholder="optional" required>
            </div>
            <div id="form_submit">
                <input type="submit" name="add_staff" value="Add Staff">
            </div>
        </form>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/staff.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>