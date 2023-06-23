const modalCon = document.querySelector(".modal_container");
const facultyList = document.getElementById("faculty_list");
const formTitle = document.querySelector(".form_title span");
const formSubmit = document.getElementById("form_submit");
const formInputs = document.querySelectorAll("form input");
const formSelect = document.querySelectorAll("form select");
const formTextArea = document.querySelector("form textarea");
const sexRadioBtn = document.querySelectorAll("form input[name='sex']");
const vaccinatedRadioBtn = document.querySelectorAll("form input[name='vaccinated']");
const designationCheckBox = document.querySelectorAll("form input[name='designation[]']");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

// HIDE THE MODAL IF ITS IS BEING CLICKED
modalCon.addEventListener("click", (event) => {
    if(event.target == modalCon){
        location.reload();
    }
})
document.getElementById("add_faculty").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleFacultyEdit(facultyData){
    const data = JSON.parse(facultyData);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Faculty";
    formSubmit.innerHTML = `<input type="button" value="Edit Now" onclick="editFacultyNow('${data.fac_id}');">`

    // FILL OUT THE BY THE CURRENT DATA
    // For input tag
    formInputs.forEach(input => {
        if(input.name === "fac_id"){
            input.value = data.fac_id;
            input.disabled = true;
        }
        if(input.name === "fname") input.value = data.fname;
        if(input.name === "mname") input.value = data.mname;
        if(input.name === "lname") input.value = data.lname;
        if(input.name === "contact") input.value = data.contact;
        if(input.name === "educ_qualification") input.value = data.educ_qualification;
        if(input.name === "qual_major") input.value = data.qual_major;
        if(input.name === "eligibility_prc") input.value = data.eligibility_prc;
    })
    // For select tag
    formSelect.forEach(select => {
        if(select.name === "course_id") select.value = data.course_id;
        if(select.name === "marital_stat") select.value = data.marital_stat;
        if(select.name === "position") select.value = data.position;  
    })
    // For textarea tag
    if(formTextArea.name === "address")
        formTextArea.value = data.address
    // For sex radio input button
    sexRadioBtn.forEach(btn => {
        if(btn.value === data.sex) btn.checked = true;
        else btn.checked = false;
    })
    // For vaccinated radio input button
    vaccinatedRadioBtn.forEach(btn => {
        if(btn.value === data.vaccinated) btn.checked = true;
        else btn.checked = false;
    })
    // For faculty designation
    getFacultyDesigantions(data.fac_id, (designations) => {
        // RESET THE CHECK BOXES FIRST BEFORE THE PROCESS
        designationCheckBox.forEach(checkBox => {
            checkBox.checked = false;
        })

        designations.forEach(designation => {
            designationCheckBox.forEach(checkBox => {
                // IF THE VALUE OF THE CURREBT ITEM OF CHECKBOX IS EQUAL TO THE CURRENT DESIGNATION ID
                // THEN MARK THE CHECKBOX AS CHECKED 
                if(checkBox.value === designation.designation_id){
                    checkBox.checked = true;
                }
            })
        });
    });
}
function editFacultyNow(facultyId){
    // INITIALIZE FACULTY DATA
    let data = {
        "fac_id" : facultyId,
        "course_id": "",
        "fname": "",
        "mname": "",
        "lname": "",
        "address": "",
        "sex": "",
        "marital_stat": "",
        "contact": "",
        "vaccinated": "",
        "educ_qualification": "",
        "qual_major": "",
        "eligibility_prc": "",
        "position": "",
        "designations": []
    }

    // STORE THE  NEW VALUES TO THE INITIALIZED positionData
    formInputs.forEach(input => {
        if(input.name === "fname") data.fname = input.value;
        if(input.name === "mname") data.mname = input.value;
        if(input.name === "lname") data.lname = input.value;
        if(input.name === "sex" && input.checked === true) data.sex = input.value;
        if(input.name === "contact") data.contact = input.value;
        if(input.name === "vaccinated" && input.checked === true) data.vaccinated = input.value;
        if(input.name === "educ_qualification") data.educ_qualification = input.value;
        if(input.name === "qual_major") data.qual_major = input.value;
        if(input.name === "eligibility_prc") data.eligibility_prc = input.value;
    })
    formSelect.forEach(select => {
        if(select.name === "course_id") data.course_id = select.value;
        if(select.name === "marital_stat") data.marital_stat = select.value;
        if(select.name === "position") data.position = select.value;  
    })
    if(formTextArea.name === "address")
        data.address = formTextArea.value

    // GET ALL THE SELECTED DESIGNATIONS FROM THE DESIGANTION CHECKBOXES
    designationCheckBox.forEach(box => {
        if(box.checked === true) data.designations.push(box.value)
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
    xhttp.send(`action=EDIT_FACULTY&faculty_data=${JSON.stringify(data)}`);
}

function searchFaculty(e, userType){
    const searchTerm = e.target.value;

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                console.log(this.response)
                const faculties = JSON.parse(this.responseText);
                let row = '';
                faculties.forEach(faculty => {
                    row += `
                    <tr>
                        <td>${faculty.fac_id}</td>
                        <td>${faculty.fname} ${faculty.mname} ${faculty.lname}</td>
                        <td>${faculty.position}</td>
                        <td id="${faculty.fac_id}"></td>
                        <td>
                            ${
                                userType == "admin" ?  
                                    `<button class="tb_action_item" onclick="handleFacultyEdit('${JSON.stringify(faculty).split('"').join("&quot;")}');" title="edit">
                                        <i class="fas fa-pencil"></i>
                                    </button>
                                    <button class="tb_action_item" title="delete">
                                        <i class="fas fa-trash"></i>
                                    </button>`
                                : ''
                            }
                            
                            <button class="tb_action_item" onclick="showMoreFacultyInfo('${JSON.stringify(faculty).split('"').join("&quot;")}');" title="view">
                                <i class="fas fa-eye"></i>
                            </button>
                            <a href="./instructor_load.php?fac_id=${faculty.fac_id}&course_id=${faculty.course_id}">
                                <button class="tb_action_item" title="schedule">
                                    <i class="fas fa-calendar-alt"></i>
                                </button>
                            </a>
                        </td>
                    </tr>
                    `
                    // HANDLE FAULTY DESIGNATION
                    getFacultyDesigantions(faculty.fac_id, (designations) => {
                        let str = "";
                        designations.forEach(designation => {
                            str += designation.designation_title + "<br>"
                        });
                        document.getElementById(faculty.fac_id).innerHTML = str;
                    });
                });
                facultyList.innerHTML = row;
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=SEARCH_FACULTY&search_term=${searchTerm}`, true);
    xhttp.send();
}

function getFacultyDesigantions(faculty_id, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const designations = JSON.parse(this.responseText);
                callback(designations);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_FACULTY_DESIGNATIONS&faculty_id=${faculty_id}`, true);
    xhttp.send();
}

function showMoreFacultyInfo(faculty_info){
    const faculty = JSON.parse(faculty_info);
    console.log(faculty)
    modalCon.style.display = "flex";
    let content = `<div class="modal_content">
        <h3>Faculty Information</h3>
        <ul>
            <li>
                <span> <b>Faculty ID: </b> ${faculty.fac_id}</span>
            </li>
            <li>
                <span> <b>Name: </b> ${faculty.fname} ${faculty.mname} ${faculty.lname}</span>
            </li>
            <li>
                <span> <b>Marital Status: </b> ${faculty.marital_stat}</span>
            </li>
            <li>
                <span> <b>Address: </b> ${faculty.address}</span>
            </li>
            <li>
                <span> <b>Contact: </b> ${faculty.contact}</span>
            </li>
            <li>
                <span> <b>College: </b> (${faculty.coll_code}) ${faculty.coll_desc}</span>
            </li>
            <li>
                <span> <b>Course: </b> (${faculty.crs_code}) ${faculty.crs_desc}</span>
            </li>
            <li>
                <span> <b>Major: </b> ${faculty.major}</span>
            </li>
            <li>
                <span> <b>Sex: </b> ${faculty.sex}</span>
            </li>
            <li>
                <span> <b>Position: </b> ${faculty.position}</span>
            </li>
            <li>
                <span> <b>Load Units: </b> MaxLoad:${faculty.max_load} MinLoad:${faculty.min_load}</span>
            </li>
            <li>
                <span> <b>Status: </b> ${faculty.status}</span>
            </li>
            <li>
                <span> <b>Vaccinated: </b> ${faculty.vaccinated}</span>
            </li>
            <li>
                <span> <b>Educational Qualification: </b> ${faculty.educ_qualification}</span>
            </li>
            <li>
                <span> <b>Major: </b> ${faculty.qual_major}</span>
            </li>
            <li>
                <span> <b>Eligibility/PRC: </b> ${faculty.eligibility_prc}</span>
            </li>
        </ul>
    <div>`;
    modalCon.innerHTML = content;
}

document.getElementById("select_course").addEventListener("change", (e) => {
    getProgramCoordinator(e.target.value, (coordinator) => {
        if(coordinator){
            document.getElementById(coordinator.designation_id).disabled = true;
        }else{
            designationCheckBox.forEach(checkBox => {
                checkBox.disabled = false;
            })
        }
    })
})

function getProgramCoordinator(courseId, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const coordinator = JSON.parse(this.responseText);
                callback(coordinator);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_PROGRAM_COORDINATOR&course_id=${courseId}`, true);
    xhttp.send();
}

function handleDeleteFaculty(facultyId, courseId){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete faculty!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteFacultyNow('${facultyId}', '${courseId}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteFacultyNow(facultyId, courseId){
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
    xhttp.send(`action=DELETE_FACULTY&faculty_id=${facultyId}&course_id=${courseId}`);
}
