<?php 
    session_start();

    if(!isset($_SESSION["user"])){
        header("Location: ./login.php");
        exit();
    }
    $user = $_SESSION["user"];

    // HANDLE ACCESS LOG
    $user_id = $user["user_id"];
    $ip_address = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
    $ip_address = inet_ntop(inet_pton($ip_address));
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    $url = $_SERVER['REQUEST_URI'];

    require_once "../models/HistoryLogModel.php";
    $hl_model = new HistoryLogModel();
    $hl_model->create_acces_log(["user_id" => $user_id, "ip" => $ip_address, "user_agent" => $user_agent, "url" => $url]);
    
    require_once "../models/CourseModel.php";
    $course_model = new CourseModel();
    $course = $course_model->read_course_by_fac_ID($user["fac_id"]);

    $page_path = explode("/", $_SERVER["PHP_SELF"]);
    $page_filename = $page_path[count($page_path)-1];

    // ACCESS CONTROL
    if($page_filename == "account.php" || $page_filename == "staff.php" || 
        $page_filename == "history_log.php"){
        if($_SESSION["user"]["user_type"] != "admin"){
            header("HTTP/1.1 403 Forbidden");
            echo "Access to this resource is forbidden.";
            exit();
        }
    }else if( $page_filename == "college.php" || $page_filename == "course.php" ||
            $page_filename == "designation.php" || $page_filename == "position.php"){
        if($_SESSION["user"]["user_type"] != "admin" && $_SESSION["user"]["user_type"] != "staff"){
            header("HTTP/1.1 403 Forbidden");
            echo "Access to this resource is forbidden.";
            exit();
        }
    }else if($page_filename == "schedules.php"){
        if($_SESSION["user"]["user_type"] != "Program coordinator"){
            header("HTTP/1.1 403 Forbidden");
            echo "Access to this resource is forbidden.";
            exit();
        }
    }
?>


<div class="sidebar">
    <div class="hide_sidebar">
        <i class="fa-solid fa-angles-left"></i>
    </div>
    
    <div class="sidebar_top">
        <?php
            if($user["user_type"] == "admin"){
                echo '
                <img src="../public/img/admin_white.png" alt="">
                <span>Administrator</span>
                ';
            }else if($user["user_type"] == 'Program coordinator'){
                echo '
                <img src="../public/img/calendar.png" alt="">
                <span>Program coordinator</span>
                ';
            }else if($user["user_type"] == 'staff'){
                echo '
                <img src="../public/img/id-card.png" alt="">
                <span>Staff</span>
                ';
            }
        ?>
    </div>

    <div class="menus">
        
        <a href="./" class="menu_item <?php echo $page_filename == "index.php" ? "active" : ""; ?>">
            <i class="fa-sharp fa-solid fa-house"></i>
            <span>Home</span>
        </a>

        <?php
            /**
             * SHOW COLLEGES AND COURSES IF USERTYPE IS ADMIN 
             * SHOW PROSPECTUS IF USERTYPE IS COORDINATOR
             *  */ 
            if($user["user_type"] == 'admin'){
                ?>
                <a href="./college.php" class="menu_item <?php echo $page_filename == "college.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-users-rectangle"></i>
                    <span>Colleges</span>
                </a>
                <a href="./course.php" class="menu_item <?php echo $page_filename == "course.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-graduation-cap"></i>
                    <span>Courses</span>
                </a>
                <a href="./designation.php" class="menu_item <?php echo $page_filename == "designation.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-user-tie"></i>
                    <span>Designation</span>
                </a>
                <a href="./signatory.php" class="menu_item <?php echo $page_filename == "signatory.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-file-signature"></i>
                    <span>Signatory</span>
                </a>
                <a href="./faculties.php" class="menu_item <?php echo $page_filename == "faculties.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-chalkboard-user"></i>
                    <span>Faculties</span>
                </a>
                <a href="./staff.php" class="menu_item <?php echo $page_filename == "staff.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-clipboard-user"></i>
                    <span>Staff</span>
                </a>
                <a href="./rooms.php" class="menu_item <?php echo $page_filename == "rooms.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-chalkboard"></i>
                    <span>Rooms</span>
                </a>
                <a href="./account.php" class="menu_item <?php echo $page_filename == "account.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-users"></i>
                    <span>Accounts</span>
                </a>
                <a href="./history_log.php" class="menu_item <?php echo $page_filename == "history_log.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-clock-rotate-left"></i>
                    <span>History Log</span>
                </a>
                <?php
            }else if ($user["user_type"] == 'Program coordinator'){
                ?>
                <a href="./prospectus.php?course_id=<?php echo $course["course_id"]; ?>" class="menu_item <?php echo $page_filename == "prospectus.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-user-clock"></i>
                    <span>Scheduling</span>
                </a>
                <a href="./schedules.php?course_id=<?php echo $course["course_id"]; ?>" class="menu_item <?php echo $page_filename == "schedules.php" ? "active" : ""; ?>">
                    <i class="fas fa-table-cells"></i>
                    <span>Schedules</span>
                </a>
                <a href="./faculties.php?course_id=<?php echo $course["course_id"]; ?>" class="menu_item <?php echo $page_filename == "faculties.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-chalkboard-user"></i>
                    <span>Faculties</span>
                </a>
                <a href="./rooms.php" class="menu_item <?php echo $page_filename == "rooms.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-chalkboard"></i>
                    <span>Rooms</span>
                </a>
                <?php
            }else if($user["user_type"] == 'staff'){
                ?>
                <a href="./college.php" class="menu_item <?php echo $page_filename == "college.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-users-rectangle"></i>
                    <span>Colleges</span>
                </a>
                <a href="./course.php" class="menu_item <?php echo $page_filename == "course.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-graduation-cap"></i>
                    <span>Courses</span>
                </a>
                <a href="./designation.php" class="menu_item <?php echo $page_filename == "designation.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-user-tie"></i>
                    <span>Designation</span>
                </a>
                <a href="./signatory.php" class="menu_item <?php echo $page_filename == "signatory.php" ? "active" : ""; ?>">
                    <i class="fa-solid fa-file-signature"></i>
                    <span>Signatory</span>
                </a>
                <a href="./faculties.php" class="menu_item <?php echo $page_filename == "faculties.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-chalkboard-user"></i>
                    <span>Faculties</span>
                </a>
                <a href="./rooms.php" class="menu_item <?php echo $page_filename == "rooms.php" ? "active" : ""; ?>">
                    <i class="fa-sharp fa-solid fa-chalkboard"></i>
                    <span>Rooms</span>
                </a>
                <?php
            }
        ?>
        
        <a href="../logout.php" class="menu_item">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </a>
    </div>
</div>

