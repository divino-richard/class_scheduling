<?php 
    require_once "../controllers/RoomContr.php";
    $room_contr = new RoomContr();
    
    // ADD ROOM
    if(isset($_POST["add_room"])){
        $room_contr->set_room();
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
    <link rel="stylesheet" href="../public/css/rooms.css">
    <link rel="stylesheet" href="../public/css/all.css">
    <title>Rooms</title>
</head>
<body>
    <div class="container">
        <?php include '../includes/sidebar.php'; ?>

        <div class="main">
            <?php include '../includes/header.php'; ?>
             
            <div class="content">
                <div class="table_container">
                    <section>
                        <h3>Rooms</h3>

                        <input type="text" class="search_box" onkeyup="searchRoom(event, `<?php echo $_SESSION['user']['user_type'];?>`);" placeholder="Search Room by Building Name  or Room no.">
                        
                         <?php
                        if($_SESSION["user"]["user_type"] == "admin" || $_SESSION["user"]["user_type"] == "staff"){
                            ?>
                            <button class="add_btn" id="add_room">Add Room</button>
                            <?php
                        }
                        ?>
                    </section>

                    <table>
                        <tr>
                            <th>Room No.</th>
                            <th>Building</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>

                        <tbody id="room_list">
                            <?php
                            foreach($room_contr->get_rooms() as $room){
                                ?>
                                <tr>
                                    <td><?php echo $room["rm_id"]; ?></td>
                                    <td><?php echo $room["building"]; ?></td>
                                    <td><?php echo ucwords($room["type"]); ?></td>
                                    <td>
                                        <?php
                                            echo $room["status"] == "usable" ? "
                                                <span class='usable_room'>".strtoupper($room["status"])."</span>
                                            " : "
                                                <span class='unusable_room'>".strtoupper($room["status"])."</span>
                                            ";
                                        ?>
                                    </td>
                                    <td>
                                        <div class="actions_con">
                                            <span class="show_actions"><i class="fa-sharp fa-solid fa-angle-down"></i></span>
                                            <div class="actions">
                                                <?php
                                                    if($_SESSION["user"]["user_type"] == 'admin'){
                                                        ?>
                                                        <button class="tb_action_item" title="edit" onclick='handleRoomEdit(`<?php echo json_encode($room); ?>`);'>
                                                            <i class="fas fa-pencil"></i>
                                                        </button>

                                                        <button class="tb_action_item" title="delete" onclick="handleRoomDelete(`<?php echo $room['rm_id']; ?>`);">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                        <?php
                                                    }
                                                ?>
                                                <button class="tb_action_item" title="schedule">
                                                    <a href="./room_schedule.php?room_id=<?php echo $room["rm_id"]; ?>">
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

                <!-- ADD ROOM MODAL -->
                <div class="modal_container">
                    <form class="modal_content" action="" method="POST">
                        <div class="form_title">
                            <span>Add Room</span>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Room no.:</label>
                            <input type="number" name="room_id" placeholder="required*" required min="0">
                        </div>
                        <div class="input_wrapper">
                            <label for="">Building:</label>
                            <input type="text" name="building" placeholder="required*" required>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Room Type:</label>
                            <select name="type" required>
                                <option value="">-- Select type --</option>
                                <option value="lec">Lecturing room</option>
                                <option value="lab">Laboratory room</option>
                            </select>
                        </div>
                        <div class="input_wrapper">
                            <label for="">Room Status:</label>
                            <select name="status" required>
                                <option value="">-- Select status --</option>
                                <option value="usable">Usable</option>
                                <option value="unusable">Unusable</option>
                            </select>
                        </div>
                        
                        <div id="form_submit">
                            <input type="submit" name="add_room" value="Add Room" >
                        </div>
                    </form>
                </div>
                <!-- ADD ROOM MODAL -->
            </div>
        </div>
    </div>

    <!-- LOADING ANIMATION -->
    <div class="loader_container">
        <img src="../public/img/loader.svg" alt="loading">
    </div>

    <script src="../public/js/rooms.js"></script>
    <script src="../public/js/general.js"></script>
</body>
</html>




