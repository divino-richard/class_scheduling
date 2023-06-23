const currentLocation = new URL(location);
const facultyIdPharam = currentLocation.searchParams.get("fac_id");
const courseIdPharam = currentLocation.searchParams.get("course_id");
const selectAcademicYear = document.getElementById("select_academic_year");
const selectSemester = document.getElementById("select_semester");
const selectLoadType = document.getElementById("select_load_type");
const loadTypeInfo = document.querySelector(".load_type_info");
const schedTableBody =  document.querySelector("tbody");
const academicYear = document.getElementById("academic_year");
const semester = document.getElementById("semster");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

if(selectAcademicYear != null && selectSemester != null && selectLoadType != null){
    displayFacultyLoads(facultyIdPharam, selectAcademicYear.value, selectSemester.value, selectLoadType.value);

    selectAcademicYear.addEventListener("change", (e) => {
        resetTableBody();
        displayFacultyLoads(facultyIdPharam, e.target.value, selectSemester.value, selectLoadType.value);
    })

    selectSemester.addEventListener("change", (e) => {
        resetTableBody();
        displayFacultyLoads(facultyIdPharam, selectAcademicYear.value, e.target.value, selectLoadType.value);
    })

    selectLoadType.addEventListener("change", (e) => {
        resetTableBody();
        displayFacultyLoads(facultyIdPharam, selectAcademicYear.value, selectSemester.value, e.target.value);
    })
}

function displayFacultyLoads(facultyId, academic_year, sem, loadType){
    academicYear.innerHTML = `AY: ${academic_year}`;
    semester.innerHTML = `${sem.toUpperCase()} SEMESTER`
    loadTypeInfo.innerText = selectLoadType.value.toUpperCase() + " LOAD";

    let currentProgramCodes = new Array();
    let unitsSubTotal_1 = 0;
    let unitsSubTotal_2 = 0;
    let totalUnits = 0;
    let primaryDesignation = {"deloading": 0, "designation_title": ""};
    let preparation = [];

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const schedules = JSON.parse(this.response); 
            // SORT THE SCHEDULE
            const sortedSchedules = sortSchedules(schedules);

            // GET FACULTY DESIGNATIONS
            getFacultyDesignations(facultyId, (designations) => {
                // FIND THE MAXIMUM DELOADING
                designations.forEach(designation => {
                    if(designation.deloading > primaryDesignation.deloading){
                        primaryDesignation = designation;
                    }
                })

                sortedSchedules.forEach(schedule => {
                    const day = schedule.sched_day;
                    const meridiem = schedule.sched_time.slice(-2)
                    const time = schedule.sched_time.split("-")[0].slice(0, -2) + "-" + schedule.sched_time.split("-")[1].slice(0, -2);
                    const units = parseFloat(schedule.type == "lab" ? (schedule.lab_hr*3)*.75 : schedule.lec_hr);

                    if(currentProgramCodes.includes(schedule.program_code)) return; // AVOID SCHEDULE TO POPUP TWICE
                    
                    // INCREMENT TOTAL UNITS
                    unitsSubTotal_1 += units;
    
                    // THE NUMBER OF PREPARATIONS ARE THE NUMBER OF HANDLES SUBJECTS
                    if(!preparation.includes(schedule.subject_code)){
                        preparation.push(schedule.subject_code);
                    }
    
                    let rowData = `
                        <td class="left_text">${time}</td>
                        <td>${schedule.program_code}</td>
                        <td>${schedule.subject_code}</td>
                        <td class="desc_title">${schedule.lab_hr == 0 ? schedule.title : schedule.title + " - " + schedule.type}</td>
                        <td>${units}</td>
                        <td>${schedule.building}</td>
                    `;
                    let row = document.createElement("tr");
                    row.innerHTML = rowData;
                    currentProgramCodes.push(schedule.program_code);
    
                    let target;
                    switch(schedule.format){
                        case "format1":
                            if(day == "Mon" || day == "Thu"){
                                target = `MTh_${meridiem == "AM" ? "morning" : "afternoon"}`;
                                
                            }else if(day == "Tue" || day == "Fri"){
                                target = `TF_${meridiem == "AM" ? "morning" : "afternoon"}`;
    
                            }else if(day == "Wed"){
                                target = `Wed_${meridiem == "AM" ? "morning" : "afternoon"}`;
    
                            }else if(day == "Sat"){
                                target = `Sat_${meridiem == "AM" ? "morning" : "afternoon"}`;
                            }
                            break;
                        case "format2":
                            if(day == "Mon" || day == "Wed" || day == "Fri"){
                                target = `MWF_${meridiem == "AM" ? "morning" : "afternoon"}`;
    
                            }else if(day == "Tue" || day == "Thu"){
                                target = `TTh_${meridiem == "AM" ? "morning" : "afternoon"}`;
    
                            }else if(day == "Sat"){
                                target = `Sat_${meridiem == "AM" ? "morning" : "afternoon"}`;
                            }
                            break;
                    }
    
                    let tbody = document.getElementById(target);
                    if(document.querySelector(`#${target} .placeholder`) != null)
                        tbody.innerHTML = "";
                    tbody.appendChild(row);
                })

                const specialAssignment = 0;

                if(selectLoadType.value === "regular"){
                    unitsSubTotal_2 = parseFloat(unitsSubTotal_1) + parseFloat(primaryDesignation.deloading);
                }else{
                    unitsSubTotal_2 = parseFloat(unitsSubTotal_1);
                }
                
                totalUnits = unitsSubTotal_2 + specialAssignment;

                document.getElementById("unitsSubTotal_1").innerText = unitsSubTotal_1;
                document.getElementById("number_of_preparation").innerText = preparation.length;
                document.getElementById("unitsSubTotal_2").innerText = unitsSubTotal_2;
                document.getElementById("total_units").innerText = totalUnits;

                if(selectLoadType.value === "regular"){
                    document.getElementById("designation").innerText = primaryDesignation.designation_title.toUpperCase();
                    document.getElementById("deloading").innerText = primaryDesignation.deloading;
                }else{
                    document.getElementById("designation").innerText = "";
                    document.getElementById("deloading").innerText = "";
                }
            })
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_FACULTY_LOADS&faculty_id=${facultyId}&acad_year=${academic_year}&semester=${sem}&load_type=${loadType}`, true);
    xhttp.send();
    
    getSignees(signees => {
        let recommending = document.querySelector(".recom_approval");
        let approved = document.querySelector(".approved");
        let recommendingStr = "";
        let approvedStr = "";

        signees.forEach(signee => {
            if(loadType === "emergency"){
                if(signee.designation.toUpperCase() === "CAMPUS DIRECTOR" ||
                signee.designation.toUpperCase() === "VICE PRESIDENT FOR ACADEMIC AFFAIRS"){
                    recommendingStr += `
                    <div class="name">
                        <h4>${signee.name}, ${signee.degree}</h4>
                        <span>${signee.designation}</span>
                    </div>
                    `
                }
                if(signee.designation.toUpperCase() === "SUC PRESIDENT III"){
                    approvedStr += `
                    <div class="name">
                        <h4>${signee.name}, ${signee.degree}</h4>
                        <span>${signee.designation}</span>
                    </div>
                    `
                }
            }else{
                if(signee.designation.toUpperCase() === "CAMPUS DIRECTOR"){
                    recommendingStr += `
                    <div class="name">
                        <h4>${signee.name}, ${signee.degree}</h4>
                        <span>${signee.designation}</span>
                    </div>
                    `
                }
                if(signee.designation.toUpperCase() === "VICE PRESIDENT FOR ACADEMIC AFFAIRS"){
                    approvedStr += `
                    <div class="name">
                        <h4>${signee.name}, ${signee.degree}</h4>
                        <span>${signee.designation}</span>
                    </div>
                    `
                }
            }
        })

        recommending.innerHTML = recommendingStr;
        approved.innerHTML = approvedStr;
    })

    
}

function getSignees(callback){
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const signees = JSON.parse(this.response); 
            callback(signees);
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_SINGEES`, true);
    xhttp.send();
}



function getFacultyDesignations(facultyId, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const designations = JSON.parse(this.response);
                callback(designations);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?faculty_id=${facultyId}&action=GET_FACULTY_DESIGNATIONS`, true);
    xhttp.send();
}

// INSERTION SORT BASED ALGORITHM
function sortSchedules(schedules){
    let n = schedules.length
    for(let i = 1; i < n; i++){
        j = i
        while(j > 0 && getTimeMin(schedules[j-1]) >= getTimeMin(schedules[j])){
            let temp = schedules[j];
            schedules[j] = schedules[j-1];
            schedules[j-1] = temp;
            j = j - 1
        }
    }
    return schedules;
}
function getTimeMin(schedule){
    const hour = parseInt(schedule.sched_time.split(":")[0]);
    const min = parseInt(schedule.sched_time.split(":")[1].substring(0,2));
    const meridiem = schedule.sched_time.split(":")[1].substring(2,4);
    if(meridiem == "PM") return (hour + 12) * 60 + min;
    else return hour * 60 + min;
}

function resetTableBody(){
    document.querySelectorAll("tbody").forEach(tbody => {
        const meridiem = tbody.id.split("_")[1];
        let placeholder = `
            <tr class="placeholder">
                <td class="left_text">${meridiem == 'morning' ? '7:30-12:00' : '1:00-8:00'}</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr
        `;
        tbody.innerHTML = placeholder;
    })
}



