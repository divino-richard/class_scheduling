
const prospectusStatus =document.getElementById("prospectus_status");
const addProspectusForm = document.querySelector(".add_prospectus_form");
const addProspectusBtn = document.getElementById("add_prospectus");
const prospectusDetailsYear = document.getElementById("prospectus_details_year");
const prospectusDetailsSem = document.getElementById("prospectus_details_sem");
const loader = document.querySelector(".loader_container");
const currentLocationPharams = new URL(location);
const courseIdPharam = currentLocationPharams.searchParams.get("course_id");
let unsavedSubject = 0;
let year = prospectusDetailsYear ? prospectusDetailsYear.value : '';
let sem = prospectusDetailsSem ? prospectusDetailsSem.value : '';
let presentProspectusDetails;

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

if(prospectusDetailsYear && prospectusDetailsSem)
    displayProspectusDetails(year, sem);
    
if(prospectusDetailsYear){
    prospectusDetailsYear.addEventListener("change", (e) => {
        year = e.target.value;
        presentProspectusDetails.style.display = "none"; // HIDE THE PRESENT DISPLAYED PROSPECTUS DETAILS
        displayProspectusDetails(year, sem);
    })
}

if(prospectusDetailsSem){
    prospectusDetailsSem.addEventListener("change", (e) => {
        sem = e.target.value;
        presentProspectusDetails.style.display = "none"; // HIDE THE PRESENT DISPLAYED PROSPECTUS DETAILS
        displayProspectusDetails(year, sem);
    })
}

function displayProspectusDetails(year, sem){
    let id = `prospectus_details_${year}_year_${sem}_sem`;
    var prospectusDetails = document.getElementById(id);
    prospectusDetails.style.display = "block";
    presentProspectusDetails = prospectusDetails; // SET PRESENTLY DISPLAYED PROSPECTUS DETAILS
}

function displayAddSubjectInputs(details_id){
    // IF THERE IS UNSAVED SUBJECT THEN PREVENT ADDING INPUT ROW
    if(unsavedSubject > 0) return alert("Please save the subject");

    // ADDING TABLE ROW WITH INPUTS
    let tBody = document.querySelector("tbody#" + details_id);
    let tRow = document.createElement("tr");
    tRow.innerHTML = `
        <td>
            <input type="text" id="subject_title_input" placeholder="required" onkeydown="resetInputBg(this);"/>
        </td>
        <td>
            <input type="text" id="subject_code_input" placeholder="required" onkeydown="resetInputBg(this);"/>
        </td>  
        <td>
            <input type="number" id="subject_lecHr_input" placeholder="required" value="0"min="0" onkeydown="resetInputBg(this);"/>
        </td>  
        <td>
            <input type="number" id="subject_labHr_input" placeholder="optional" value="0" min="0"/>
        </td>  
        <td>
            <input type="number" id="subject_units_input" placeholder="required" value="0" min="0" onkeydown="resetInputBg(this);"/>
        </td>  
        <td>
            <input type="text" id="subject_preReq_input" placeholder="optional"/>
        </td> 
    `;
    tBody.appendChild(tRow);

    // SHOW THE SUBJECT ACTIONS
    document.querySelector("div#" + details_id).style.display = "flex";

    // WILL INDECATE THAT THERE IS NO UNSAVED INOUT SUBJECT
    unsavedSubject++;
}

function resetInputBg(e){
    e.style.backgroundColor = "#e1effa";
}

function saveSubject(details_id, revision_year, year, sem){
    // GET ALL THE SUBJECT INFO FROM THE INPUT VALUES
    const title = document.getElementById("subject_title_input");
    const code = document.getElementById("subject_code_input");
    const lecHr = document.getElementById("subject_lecHr_input");
    const labHr = document.getElementById("subject_labHr_input");
    const units = document.getElementById("subject_units_input");
    const preReq = document.getElementById("subject_preReq_input");

    const errorColor = "#ffb3b3";
    if(title.value == "") return title.style.backgroundColor = errorColor;
    if(code.value == "") return code.style.backgroundColor = errorColor;
    if(lecHr.value <= 0) {
        alert("Lecture hours should be greater than 0");
        lecHr.style.backgroundColor = errorColor;
        return;
    }
    if(units.value <= 0) {
        alert("Units should be greater than 0");
        units.style.backgroundColor = errorColor;
        return;
    }

    // VALIDATE INPUT DATA (AVOID SPECIAL CHARACTERS)
    if(!isValid(title.value)){
        const str = "(!/[~`!#$%\^&*+=-[]';,/{}|\":<>?]<>)";
        return alert(`Please Avoid Special Characters ${str}`);
    }

    const subject = {
        'subject_code': code.value, 
        'course_id': courseIdPharam, 
        'title': title.value, 
        'lec_hr': lecHr.value, 
        'lab_hr': labHr.value, 
        'units': units.value, 
        'pre_requisites': preReq.value
    }  
    
    const prospectus_details = {
        'course_id'     : courseIdPharam, 
        'revision_year' : revision_year, 
        'subject_code'  : code.value, 
        'year'          : year, 
        'sem'           : sem
    }

    // POST THE SUBJECT
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            response = JSON.parse(this.response);
            if(response.type === "error"){
                alert(response.text);
                return;
            }

            // APPEND THE INPUT VALUE TO ITS RSPECTIVE TABLE IN ORDER TO SHOW THE NEW SUBJECT THAT IS BEING ADDED
            let tBody = document.querySelector("tbody#" + details_id);
            // REMOVE THE LASTCHILD OR THE INPUT ELEMENTS OF THE TARGET TABLE 
            tBody.lastChild.remove(); 
            let tRow = document.createElement("tr");
            tRow.innerHTML = `
                <td>${title.value}</td>
                <td>${code.value}</td>  
                <td>${lecHr.value}</td>  
                <td>${labHr.value}</td>  
                <td>${units.value}</td>  
                <td>${preReq.value}</td>  
            `;
            tBody.appendChild(tRow);
            
            // WILL INDECATE THAT THERE IS NO UNSAVED INOUT SUBJECT
            unsavedSubject--;

            // ADD NEW INPUT FIELDS
            displayAddSubjectInputs(details_id);
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=ADD_SUBJECT&subject=${JSON.stringify(subject)}&prospectus_details=${JSON.stringify(prospectus_details)}`);
}

function isValid(str){
    return !/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(str);
}

function cancelSubject(details_id){
    // REMOVE THE LAST CHILD ELEMENT OF THE TABLE BODY
    let tBody = document.querySelector("tbody#" + details_id);
    tBody.lastChild.remove();

    // HIDE THE SUBJECT ACTIONS
    document.querySelector("div#" + details_id).style.display = "none";

    unsavedSubject--;
}

function createSchedule(collegeId, revisionYear, year, sem){
    location.href = `./scheduling_area.php?coll_id=${collegeId}&course_id=${courseIdPharam}&revision_year=${revisionYear}&year=${year}&sem=${sem}`;
}

function handleSubjectEdit(subjectData){
    const subject = JSON.parse(subjectData);
    const subjectRow = document.getElementById(subject.subject_code.replace(/\s/g, ""));
    let str = `
        <td><input value="${subject.title}" name="title"/></td>
        <td><input value="${subject.subject_code}" name="subject_code" disabled="true"/></td>
        <td><input type="number" value="${subject.lec_hr}" name="lec_hr"/></td>
        <td><input type="number" value="${subject.lab_hr}" name="lab_hr"/></td>
        <td><input type="number" value="${subject.units}" name="units"/></td>
        <td><input value="${subject.pre_requisites}" name="pre_requisites"/></td>
        <td class="subject_action">
            <button onclick='editSubjectNow("${subject.subject_code}", "${subject.course_id}");'>
                <i class="fas fa-save"></i>
            </button>
            <button onclick="location.reload();"><i class="fas fa-close"></i></button>
        </td>
    `;
    subjectRow.innerHTML = str;
}

function editSubjectNow(subjectCode, courseId){
    const inputs = document.querySelectorAll("#" + subjectCode.replace(/\s/g, "") + " input");
    let newSubjectData = {"course_id": courseId, "title": "", "subject_code": subjectCode, "lec_hr": "", "lab_hr": "", "units": "", "pre_requisites": ""};
    inputs.forEach(input => {
        switch(input.name){
            case "title":
                newSubjectData.title = input.value
                break;
            case "lec_hr":
                newSubjectData.lec_hr = input.value
                break;
            case "lab_hr":
                newSubjectData.lab_hr = input.value
                break;
            case "units":
                newSubjectData.units = input.value
                break;
            case "pre_requisites":
                newSubjectData.pre_requisites = input.value
                break;
        }
    })

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            $response = JSON.parse(this.response);
            alert($response.msg);
            location.reload()
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=EDIT_SUBJECT&subject_data=${JSON.stringify(newSubjectData)}`);
}

const modalCon = document.querySelector(".modal_container");
document.querySelector(".add_new_btn").addEventListener("click", () => {
    modalCon.style.display = "flex";
    modalCon.addEventListener("click", (event)=> {
        if(event.target == modalCon){
            modalCon.style.display = "none";
        }
    })
})

function changeProspectus(course_id, e){
    const revision_year = e.target.value;
    location.href = `./prospectus.php?course_id=${course_id}&revision_year=${revision_year}`;
}

function deleteSubject(course_id, revision_year, subject_code){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            $response = JSON.parse(this.response);
            alert($response.msg);
            location.reload()
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=DELETE_SUBJECT&course_id=${course_id}&revision_year=${revision_year}&subject_code=${subject_code}`);
}

