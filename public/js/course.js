
const formTitle = document.querySelector(".form_title span");
const formSubmit = document.getElementById("form_submit");
const formInputs = document.querySelectorAll("form input");
const formSelect = document.querySelectorAll("form select");
const modalCon = document.querySelector(".modal_container");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});


modalCon.addEventListener("click", (event) => {
    if(event.target == modalCon){
        location.reload();
    }
})
document.getElementById("add_course").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleCourseEdit(data){
    const courseData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Course";
    formSubmit.innerHTML = `<input type="button" value="Edit Now" onclick="editCourseNow('${courseData.course_id}');">`

    // FILL OUT THE BY THE CURRENT DATA
    // For input tag
    formInputs.forEach(input => {
        if(input.name === "crs_code") input.value = courseData.crs_code;
        if(input.name === "crs_desc") input.value = courseData.crs_desc;
        if(input.name === "major") input.value = courseData.major;
    })
    // For select tag
    formSelect.forEach(select => {
        if(select.name === "coll_id") select.value = courseData.coll_id;
    })
}
function editCourseNow(courseId){
    // INITIALIZE POSITION DATA
    let courseData = {
        "course_id" : courseId,
        "coll_id": "",
        "crs_code": "",
        "crs_desc": "",
        "major": ""
    }

    // STORE THE  NEW VALUES TO THE INITIALIZED positionData
    formInputs.forEach(input => {
        if(input.name === "crs_code") courseData.crs_code = input.value;
        if(input.name === "crs_desc") courseData.crs_desc = input.value;
        if(input.name === "major") courseData.major = input.value;
    })
    formSelect.forEach(select => {
        if(select.name === "coll_id") courseData.coll_id = select.value;
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
    xhttp.send(`action=EDIT_COURSE&course_data=${JSON.stringify(courseData)}`);
}

function handleDeleteCourse(courseId){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete course!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteCourseNow('${courseId}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteCourseNow(courseId){
    // SEND THE DATA THROUGH AJAX
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
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
    xhttp.send(`action=DELETE_COURSE&course_id=${courseId}`);
}

