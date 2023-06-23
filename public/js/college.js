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
document.getElementById("add_college").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleCollegeEdit(data){
    const collegeData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit College";
    formSubmit.innerHTML = `<input type="button" value="Edit Now" onclick="editCollegeNow('${collegeData.coll_id}');">`

    // FILL OUT THE BY THE CURRENT DATA
    formInputs.forEach(input => {
        if(input.name === "coll_code") input.value = collegeData.coll_code;
        if(input.name === "coll_desc") input.value = collegeData.coll_desc;
        if(input.name === "name") input.value = collegeData.name;
        if(input.name === "degree") input.value = collegeData.degree;
    })
}
function editCollegeNow(collegeId){
    // INITIALIZE POSITION DATA
    let collegeData = {
        "coll_id" : collegeId,
        "coll_code" : "",
        "coll_desc" : "",
        "name" : "",
        "degree" : ""
    }

    // STORE THE  NEW VALUES TO THE INITIALIZED positionData
    formInputs.forEach(input => {
        if(input.name === "coll_code") collegeData.coll_code = input.value;
        if(input.name === "coll_desc") collegeData.coll_desc = input.value;
        if(input.name === "name") collegeData.name = input.value;
        if(input.name === "degree") collegeData.degree = input.value;
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
    xhttp.send(`action=EDIT_COLLEGE&college_data=${JSON.stringify(collegeData)}`);
}

function handleCollegeDelete(college_id){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete college!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteCollegeNow('${college_id}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteCollegeNow(college_id){
    // SEND THE DATA THROUGH AJAX
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            const response = JSON.parse(this.responseText);
            if(response.type !== ""){
                alert(response.msg);
                modalCon.style.display = "none";
                location.reload();
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=DELETE_COLLEGE&college_id=${college_id}`);
}


