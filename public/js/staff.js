const modalCon = document.querySelector(".modal_container");
const formTitle = document.querySelector(".form_title span");
const formSubmit = document.getElementById("form_submit");
const formInputs = document.querySelectorAll("form input");
const formSelect = document.querySelectorAll("form select");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

// MODAL
modalCon.addEventListener("click", (event) => {
    if(event.target == modalCon){
        location.reload();
    }
})
document.getElementById("add_staff").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleStaffEdit(data){
    const staffData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Staff";
    formSubmit.innerHTML = `<input type="button" value="Edit Staff" onclick="editStaffNow('${staffData.user_id}');">`

    // FILL OUT USING THE CURRENT DATA
    formInputs.forEach(input => {
        if(input.name === "fname") input.value = staffData.fname;
        if(input.name === "mname") input.value = staffData.mname;
        if(input.name === "lname") input.value = staffData.lname;
        if(input.name === "ext") input.value = staffData.ext;
    })
}

function editStaffNow(user_id){
    // INITIALIZE POSITION DATA
    let staffData = {
        "user_id" : user_id,
        "fname" : "",
        "mname" : "",
        "lname" : "",
        "ext" : ""
    }

    // STORE THE  NEW VALUES TO THE INITIALIZED positionData
    formInputs.forEach(input => {
        if(input.name === "fname") staffData.fname = input.value;
        if(input.name === "mname") staffData.mname = input.value;
        if(input.name === "lname") staffData.lname = input.value;
        if(input.name === "ext") staffData.ext = input.value;
    })

    // SEND THE DATA THROUGH AJAX
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            const response = JSON.parse(this.responseText);
            if(response.type == "success"){
                alert(response.msg);
                modalCon.style.display = "none";
                location.reload();
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=EDIT_STAFF&staff_data=${JSON.stringify(staffData)}`);
}

function handleDeleteStaff(id){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete staff!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteStaffNow('${id}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteStaffNow(id){
    // SEND THE DATA THROUGH AJAX
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            const response = JSON.parse(this.responseText);
            if(response.type !== ""){
                alert(response.msg);
                modalCon.style.display = "none";
                location.href = "staff.php";
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=DELETE_STAFF&staff_id=${id}`);
}


