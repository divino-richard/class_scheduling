
<?php 
    require_once "../controllers/PositionContr.php";
    $position_contr = new PositionContr();

    if(isset($_POST["add_position"])){
        $position_contr->add_position();
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
    <title>Faculty Positions</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>

            <div class="content">
                <div class="table_container">
                    <section>
                        <h3>Faculty Positions</h3>
                        <input type="text" class="search_box" onkeyup="searchPosition(event);" placeholder="Search Position by Title">
                        <button class="add_btn" id="add_position">
                            <span>Add Position</span>
                        </button>
                    </section>

                    <table>
                        <th>Position Title</th>
                        <th>Min Load</th>
                        <th>Max Load</th>
                        <th>Status</th> 
                        <th>Actions</th>

                        <tbody id="position_list">
                            <?php 
                            foreach($position_contr->get_positions() as $position){
                                ?>
                                <tr>
                                    <td><?php echo $position["position_title"]; ?></td>
                                    <td><?php echo $position["min_load"] . " units"; ?></td>
                                    <td><?php echo $position["max_load"] . " units"; ?></td>
                                    <td><?php echo $position["status"]; ?></td>
                                    <td>
                                        <div class="actions_con">
                                            <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                            <div class="actions">
                                                <button class="tb_action_item" onclick='handlePositionEdit(`<?php echo json_encode($position); ?>`);' title="edit">
                                                    <i class="fas fa-pencil"></i>
                                                </button>

                                                <button class="tb_action_item" title="delete" onclick="handleDeletePosition(`<?php echo $position['position_id']?>`);">
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
    
    <!-- MODAL -->
    <div class="modal_container">
        <form action="" method="POST" class="modal_content" style="height:max-content">
            <div class="form_title">
                <span>Add Faculty Position</span>
            </div>
            <div class="input_wrapper">
                <label for="">Position Title</label>
                <input type="text" name="position_title" placeholder="required*" required>
            </div>
            <div class="input_wrapper">
                <label for="">Min Load:</label>
                <input type="number" name="min_load" id="" placeholder="Units" min="1">
            </div>
            <div class="input_wrapper">
                <label for="">Max Load:</label>
                <input type="number" name="max_load" id="" placeholder="Units" min="1">
            </div>
            <div class="input_wrapper">
                <label for="">Status</label>
                <select name="status" id="">
                    <option value="">--Select Status--</option>
                    <option value="permanent">Permanent</option>
                    <option value="contructual">Contructual</option>
                    <option value="part-time">Part-time</option>
                </select>
            </div>
            
            <div id="form_submit">
                <input type="submit" name="add_position" value="Add Position">
            </div>
        </form>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>
    
    <script src="../public/js/position.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>