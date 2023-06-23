
<div class="header">
    <div class="show_sidebar">
        <i class="fa-solid fa-bars"></i>
    </div>
    <h3>Class Scheduling System</h3>
    <section>
        <span class="user_fullname">
            <?php 
                echo $_SESSION["user"]["fname"] ." ". $_SESSION["user"]["mname"]. " " .$_SESSION["user"]["lname"]; 
            ?>
        </span>
        <div class="avatar" onclick="showUserAccount();">
            <i class="fa-solid fa-user-tie"></i>
        </div>
    </section>

    <!-- ACCOUNT MODAL -->
    <div class="account_modal">
        <div class="account_content">
            <h3><?php echo strtoupper($_SESSION["user"]["user_type"]); ?></h3>
            <span>
                <?php 
                echo $_SESSION["user"]["fname"] ." ". $_SESSION["user"]["mname"]. " " .$_SESSION["user"]["lname"]; 
                ?>
            </span>
            <span>username: <?php echo $_SESSION["user"]["username"]; ?></span>

            <div class="account_action">
                <button onclick="handleChangePassword(`<?php echo $_SESSION['user']['username']; ?>`);">Change Password</button>
            </div>
        </div>

        <!-- <form action="" method="POST">
        </form> -->
    </div>

    <script>
        const accountModal = document.querySelector(".account_modal");
        const accountContent = document.querySelector(".account_content");
        const accountAction = document.querySelector(".account_action");

        function showUserAccount(){
            accountModal.style.display = "flex";
        }
        accountModal.addEventListener("click", (e) => {
            if(e.target === accountModal)
                accountModal.style.display = "none";
        })
        function handleChangePassword(username){
            accountAction.innerHTML = `
                <div class="verify_password">
                    <input type="password" id="current_password" placeholder="Currrent Password">
                    <button onclick="verifyPassword('${username}');">Verify</button>
                </div>
            `;
        }
        function verifyPassword(username){
            const currentPassword = document.getElementById("current_password").value;
            if(currentPassword.trim() == "") return alert("Please provide your current password");

            const data = {
                "username": username,
                "password": currentPassword
            }

            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    const response = JSON.parse(this.responseText);
                    if(response.type === "success"){
                        accountAction.innerHTML = `
                            <input type="password" id="new_password" placeholder="New Password">
                            <input type="password" id="confirm_new_password" placeholder="Confirm Password">
                            <button onclick="changePasswordNow('${username}');">Submit</button>
                        `;
                    }else if(response.type === "error"){
                        alert(response.msg);
                    }
                }
            };
            xhttp.open("POST", "../controllers/ajax_handler.php", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send(`action=VERIFY_PASSWORD&user=${JSON.stringify(data)}`);
        }
        function changePasswordNow(username){
            const newPassword = document.getElementById("new_password").value;
            const confirmNewPassword = document.getElementById("confirm_new_password").value;

            // INPUT CHECKING
            if(newPassword.trim() === "") return alert("Please provide your new password!");
            if(confirmNewPassword.trim() === "") return alert("Please confirm your password!");
            if(newPassword.trim() !== confirmNewPassword.trim()) return alert("Password not the same!")

            const data = {
                "username": username.trim(),
                "password": newPassword.trim()
            }

            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                    const response = JSON.parse(this.responseText);
                    alert(response.msg);
                    location.reload();
                }
            };
            xhttp.open("POST", "../controllers/ajax_handler.php", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send(`action=CHANGE_PASSWORD&user=${JSON.stringify(data)}`);
        }

    </script>
</div>


