
const subjectsCon = document.querySelector(".subjects"); 
const subjects = document.querySelectorAll(".subject");
const dropZones = document.querySelectorAll(".drop-zone");
const cells = document.querySelectorAll(".cell");
const popupMsgCon = document.querySelector(".popup_msg_con");
const popupMsgContent = document.querySelector(".popup_msg_content");
const popupMsg = document.querySelector(".popup_msg");
const selectFormat = document.getElementById("select_format");
const selectAcademicYear = document.getElementById("select_academic_year");
const selectRoom = document.getElementById("select_room");
const selectSection = document.getElementById("select_section");
const viewScheduleBtn = document.getElementById("view_schedule_btn");
const modalContainer = document.querySelector(".modal_container");
const modal = document.querySelector(".modal"),
modalHeader = modal.querySelector("header");
const instructorSchedulesPopup = document.querySelector(".instructor_schedules_popup");
const closeInstructorSchedulesPopup = document.getElementById("close_instructor_schedules_popup");
const modalContent = document.querySelector(".modal_content");
const modalActions = document.querySelector(".modal_actions");
const schedDayFormat = document.querySelector(".sched_day_format section");
const loader = document.querySelector(".loader_container");
const currentLocation = new URL(location);
const collegeId = currentLocation.searchParams.get("coll_id");
const courseId = currentLocation.searchParams.get("course_id");
const yearParam = currentLocation.searchParams.get("year");
const semParam = currentLocation.searchParams.get("sem");
const timeFrameInterval = 10;

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

let subjectBG;
let currDragedElem;
let subjData;
let schedFormat = selectFormat.value;
let section = selectSection.value;
let newSchedules = new Array();
let displayedRoomCells = new Array();
let displayedStudentCells = new Array();
let draggableElem;
let academicYear = selectAcademicYear.value;

// CREATE A TOP BORDER OF THE SUBJECT WITH RANDOM COLOR
for(let subject of subjects){
    hex = Math.floor(Math.random() * 0xFFFFFF)
    randomColor = "#" + hex.toString(16);
    subject.style.borderTop = ".5rem solid " + randomColor;
}

// SHOW THE SCHEDULING FORMAT AT THE TOP OF THE SCHEDULING/PLOTTING TABLE
function displaySchedulingFormat(schedFormat){
    switch(schedFormat){
        case "format1":
            schedDayFormat.innerHTML = `
                <span>MTH</span>
                <span>TF</span>
                <span>W</span>
                <span>S</span> 
            `
            break;
        case "format2":
            schedDayFormat.innerHTML = `
                <span>MWF</span>
                <span>TTH</span>
                <span>S</span>  
            `
            break;   
    }
}
displaySchedulingFormat(schedFormat);

selectAcademicYear.addEventListener("change", (e) => {
    academicYear = e.target.value;
    reloadPlottingArea();
})

selectFormat.addEventListener("change", (e) => {
    schedFormat = e.target.value;
    displaySchedulingFormat(schedFormat);
})

/**
 * SHOW EXISTING ROOM SCHEDULES EVERYTIME IF ROOM ID EXIST IN THE LOCALSTORAGE 
 * THIS HAPPENS EVERYTIME THE PAGE IS RELOADED
 */
if(localStorage.getItem("room_id")){
    displayRoomSchedules(localStorage.getItem("room_id"));
    selectRoom.value = localStorage.getItem("room_id");
}

// SET THE SECTION EVERY PAGE RELOAD
if(localStorage.getItem("section")){
    // SET THE VALUE OF SECTION SELECT 
    selectSection.value = localStorage.getItem("section");
    section = selectSection.value;
    filterOfferedSubjects(localStorage.getItem("section"));
    setTimeout(() => {
        displayStudentSchedules(localStorage.getItem("section"));
    }, [1000]);
}

/**
 * LISTEN WHEN THE ROOM SELECTION CHANGED AND
 * SHOW EXISTING SCHEDULES OF THAT SELECTED ROOM  
 */
selectRoom.addEventListener("change", (e) => {
    /**ADD ROOM ID TO THE LOCAL STORAGE
     * THIS WILL BE USED EVERYTIME THE PAGE RELOADED
     */
    localStorage.setItem("room_id", e.target.value);

    // location.reload()
    reloadPlottingArea();
})

selectSection.addEventListener("change", (e) => {
    /**ADD SECTION TO THE LOCAL STORAGE
     * THIS WILL BE USED EVERYTIME THE PAGE RELOADED
     */
    localStorage.setItem("section", e.target.value);
    section = e.target.value;
    // // RE-RENDER THE SUBJECTS 
    // filterOfferedSubjects(e.target.value);

    // location.reload()
    // // RE-RENDER THE PLOTTING AREA
    reloadPlottingArea();
})

// PREVIEW SCHEDULE
viewScheduleBtn.addEventListener("click", () => {
    location.href = `./class_schedule.php?course_id=${courseId}&acad_year=${academicYear}&year=${yearParam}&sem=${semParam}`;
})

function dragStart(e, data) {
    e.dataTransfer.setData("text", e.target.id);
    subjData = JSON.parse(data);
    subjectBG = e.target.style.backgroundColor;
    currDragedElem = e.target.className;
}

dropZones.forEach(dzn => {
    dzn.addEventListener('dragover', dragOver, false);
    dzn.addEventListener('dragleave', dragLeave, false);
    dzn.addEventListener('drop', drop, false);
});

function dragEnter(e){
    if(!e.target.classList.contains("drop-zone")) return;
    if(currDragedElem !== 'subject') return;

    // GET THE DAY FROM THE ID
    const day = e.target.id.split("_")[1];
    const time = e.target.id.split("_")[0];

    switch(schedFormat){
        case "format1":
            if(day == "Mon" || day == "Thu"){
                handleDragEnter(e.target, ["Mon", "Thu"], time);
            }else if(day == "Tue" || day == "Fri"){
                handleDragEnter(e.target, ["Tue", "Fri"], time);
            }else{
                handleDragEnter(e.target, [day], time);
            }
            break;
 
        case "format2":
            if(day == "Mon" || day == "Wed" || day == "Fri"){
                handleDragEnter(e.target, ["Mon", "Wed", "Fri"], time);
            }else if(day == "Tue" || day == "Thu"){
                handleDragEnter(e.target, ["Tue", "Thu"], time);
            }else{
                handleDragEnter(e.target, [day], time);
            }
            break;
    }
}

/**
 * WILL SHOW A BLUE DROP PLACEHOLDER IF THE TARGETS ARE GOOD/NO EXISTING SCHEDULE
 * ELSE IT WILL SHOW A RED DROP PLACEHOLDER
 * PLACEHOLDER IS AN INDICATOR DURING DRAG ENTER
 *  */ 
function handleDragEnter(target, days, time){
    let style = `
        width:${target.clientWidth}px; 
        height:${target.clientHeight}px;
        top:${target.clientHeight}px;
        position: absolute;
        left: 0;
        z-index: 1;
    `;

    let hasSchedExist = 0;
    for(let i=0; i<days.length; i++){
        const element = document.getElementById(`${time}_${days[i]}_start`);
        if( !element.classList.contains("drop-zone"))
            hasSchedExist++;
    }

    if(hasSchedExist > 0){
        style += 'border: 2px dashed #d64d4d;';
        target.style.backgroundColor = "#d64d4d";
        target.innerHTML = `<div style="${style}"></div>`;
        return;
    }else{
        for(let i=0; i<days.length; i++){
            const element = document.getElementById(`${time}_${days[i]}_start`);
            style += 'border: 2px dashed #7BA7FF;';
            element.style.backgroundColor = "#7BA7FF";
            element.innerHTML = `<div style="${style}"></div>`;
        }
    }
}

function dragOver(e){
    if(!e.target.classList.contains("drop-zone")) return;
    e.preventDefault();
}

function dragLeave(e){
    if(!e.target.classList.contains("drop-zone")) return;

    // GET THE DAY FROM THE ID
    const day = e.target.id.split("_")[1];
    const time = e.target.id.split("_")[0];

    switch(schedFormat){
        case "format1":
            if(day == "Mon" || day == "Thu"){
                handleDragLeave(e.target, ["Mon", "Thu"], time);
            }
            if(day == "Tue" || day == "Fri"){
                handleDragLeave(e.target, ["Tue", "Fri"], time);
            }else{
                handleDragLeave(e.target, [day], time);
            }
            break;

        case "format2":
            if(day == "Mon" || day == "Wed" || day == "Fri"){
                handleDragLeave(e.target, ["Mon", "Wed", "Fri"], time);
            }
            if(day == "Tue" || day == "Thu"){
                handleDragLeave(e.target, ["Tue", "Thu"], time);
            }else{
                handleDragLeave(e.target, [day], time);
            }
            break;
        
    }
}

/**
 * WILL REMOVE THE DROP PLACEHOLDER DURING DRAG LEAVES
 *  */ 
function handleDragLeave(target, days, time){
    for(let i=0; i<days.length; i++){
        const element = document.getElementById(`${time}_${days[i]}_start`);
        if( !element.classList.contains("drop-zone")){
            target.style.backgroundColor = "#e5e5e5";
            target.innerHTML = "";
            return;
        }
        element.innerHTML = "";
        element.style.backgroundColor = "#e5e5e5";
    }
}

function drop(e){
    loader.style.display = "flex";
    e.preventDefault();
    e.target.style.backgroundColor = "#e5e5e5";
    const draggableID = e.dataTransfer.getData("text");
    draggableElem = document.getElementById(draggableID);
    e.target.innerHTML = "";
    
    if(draggableElem == null) return; //PREVENT ELEMENT THAT IS NOT SUBJECT 

    // DON'T PROCED IF THE ROOM AND SECTION IS NONE
    if(selectRoom.value == "" || section == ""){
        showMessage("Please select room and section!", "WARNING");
        reloadPlottingArea();
        loader.style.display = 'none';
        e.target.innerHTML = "";
        e.target.style.backgroundColor = "#e5e5e5"; 
        return;
    }
    
    const programCode = subjData.partialProgCode + section; // CREATE FINAL PROGRAM CODE
    const cellsInColumn = e.target.parentElement.children;
    const startTime = e.target.id.split("_")[0];
    const day = e.target.id.split("_")[1];
    let subjectTimeDuration;
    
    // SUBJECT TIME DURATION PARTITIONING BASED IN SCHEDULING FORMAT
    switch(schedFormat){
        case "format1":
            if(day == "Mon" || day == "Thu" || day == "Tue" || day == "Fri"){
                subjectTimeDuration = subjData.subjDuration / 2;
            }else{
                subjectTimeDuration = subjData.subjDuration;
            }
            break;

        case "format2":
            if(day == "Mon" || day == "Wed" || day == "Fri"){
                subjectTimeDuration = subjData.subjDuration / 3;
            }else if(day == "Tue" || day == "Thu"){
                subjectTimeDuration = subjData.subjDuration / 2;
            }else{
                subjectTimeDuration = subjData.subjDuration;
            }
            break;
    }

    let endTime;
    // CHECK FOR TIME OVERFLOW
    for(let i=0; i<cellsInColumn.length; i++){
        if(cellsInColumn[i] == e.target){
            for(let j=i; j<= i+((subjectTimeDuration*60/timeFrameInterval)*2); j++){
                if(cellsInColumn[j] == cellsInColumn[cellsInColumn.length]){
                    showMessage("Time is unavailable due to duration overflow", "ERROR");// SHOW AN ERROR POPUP MESSAGE
                    reloadPlottingArea()
                    return;
                }
                // SET END TIME
                endTime = cellsInColumn[j].id.split("_")[0]; 
            }
            break;
        }
    }

    // GET THE TEXT OR BUILDING NAME OF THE SELECTED ROOM
    const buildingName = selectRoom.options[selectRoom.selectedIndex].text;
    const selectedTime = startTime + "-" + endTime;

    // DROPPED ELEMENT CONTENT
    const content = `
        <span class="ellipsis_text">${subjData.subjTitle}</span>
        <span>${programCode} - ${subjData.subjType}</span>
        <span>${selectedTime}</span>
        <span>${buildingName}</span>
        <span>${subjData.instructorLoad} Units to Load</span>
    `;

    let schedDays = [];
    switch(schedFormat){
        case "format1":
            if(day == "Mon" || day == "Thu"){
                schedDays = ["Mon", "Thu"];
            }else if(day == "Tue" || day == "Fri"){
                schedDays = ["Tue", "Fri"];
            }else{
                schedDays = [day];
            }
            break;

        case "format2":
            if(day == "Mon" || day == "Wed" || day == "Fri"){
                schedDays = ["Mon", "Wed", "Fri"];
            }else if(day == "Tue" || day == "Thu"){
                schedDays = ["Tue", "Thu"];
            }else{
                schedDays = [day];
            }
            break;
    }

    // PROCESS THE NEW SCHEDULE THAT SHOULD NOT CAUSE CONFLICT IN ROOM, STUDENT, INSTRUCTOR
    checkRoomAvailability(selectRoom.value, subjData.sem, schedDays, academicYear, selectedTime, (response) => {
        if(response.status != true){
            showMessage(response.msg, "ERROR");
            return reloadPlottingArea();
        }

        // CHECK THE STUDENT CONFLICT
        checkStudentPerSectionConflict(courseId, yearParam, semParam, section, schedDays, academicYear, selectedTime, (response) => {
            if(response.status != true){
                showMessage(response.msg, "ERROR");
                return reloadPlottingArea();
            }

            instructorSelection("ASSIGN_INSTRUCTOR", selectedTime, schedDays, subjData.year,
                                subjData.sem, programCode, subjData.subjType, subjData.instructorLoad);
            // HIDE DRAGGABLE ELEMENT
            draggableElem.style.display = "none";
        })
    })

    for(let i=0; i<schedDays.length; i++) {
        // DISPLAY DROPPED SCHEDULE
        displayDroppedElem(selectedTime, schedDays[i], content, programCode);
        // INIT SCHEDULE DETAILS
        let scheduleDetails = {
            "programCode": programCode,
            "subjectCode": subjData.subjCode,
            "acad_year": academicYear,
            "courseId": courseId,
            "faculty_id": "",
            "year": subjData.year,
            "sem": subjData.sem,
            "section": section,
            "rm_id": selectRoom.value,
            "sched_time": startTime + "-" + endTime,
            "sched_day": schedDays[i],
            "type": subjData.subjType,
            "format": schedFormat,
            "load_type": ""
        };
        /**
         * ADDING AN ITEM OF THE NEW SCHEDULE
         * ITEM WILL BE BASED ON EACH DAY SELECTED
         */
        newSchedules.push(scheduleDetails);
    }
}

function checkRoomAvailability(roomId, sem, days, acadYear, time, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.responseText);
            callback(response);
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=CHECK_ROOM_AVAILABILITY&room_id=${roomId}&sem=${sem}&days=${JSON.stringify(days)}&acad_year=${acadYear}&timeslot=${time}`);
}

function checkStudentPerSectionConflict(courseId, year, sem, section, days, acadYear, time, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.responseText);
            callback(response);
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=CHECK_STUDENT_PER_SECTION_CONFLICT&course_id=${courseId}&year=${year}&sem=${sem}&section=${section}&days=${JSON.stringify(days)}&acad_year=${acadYear}&timeslot=${time}`);
}

function checkInstructorConflict(facultyId, sem, days, acadYear, time, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.response);
            callback(response);
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=CHECK_INSTRUCTOR_CONFLICT&fac_id=${facultyId}&sem=${sem}&days=${JSON.stringify(days)}&acad_year=${acadYear}&timeslot=${time}`);
}

function instructorSelection(action, time, days, year, sem, program_code, type, unitsToLoad){
    // SHOW THE  MODAL
    modalContainer.style.display = "flex"; 
    if(action === "ASSIGN_INSTRUCTOR"){
        modalHeader.innerHTML = `
            <h3>ASSIGN INSTRUCTOR FOR ${program_code} - ${type.toUpperCase()}</h3><br>
        `;
        modalActions.innerHTML = `
            <button id="save_schedule" onclick="saveSchedule();">Save</button>
            <button id="cancel_schedule" onclick="reloadPlottingArea();">Cancel</button>
        `;
    }else if(action === "RE-ASSIGN_INSTRUCTOR"){
        modalHeader.innerHTML = `
            <h3>RE-ASSIGN INSTRUCTOR FOR ${program_code} - ${type.toUpperCase()}</h3><br>
        `;
        modalActions.innerHTML = `
            <button id="update_schedule" onclick="updateSchedule('${program_code}');">Update</button>
            <button id="cancel_schedule" onclick="reloadPlottingArea();">Cancel</button>
        `;
    }

    modalContent.innerHTML = `
        <div class="filter_college_wrapper">
            <select id="select_load_type" >
                <option value="regular">Regular Load</option>
                <option value="over">Over Load</option>
                <option value="emergency">Emergency Load</option>
                <option value="merge">Merge</option>
            </select>

            <span>Units to Load: ${unitsToLoad}</span>

            <div>
                <span>College: </span>
                <select id="select_college_filter">
                    <!-- OPTIONS WILL POPUP HERE... -->
                </select>
            </div>
        </div>

        <div class="suggested_instructors_box">
            <!-- SUGGESTIONS WILL SHOWN HERE THROUGH JS -->
        </div>

        <div class="load_info_wrapper">
            <h3>Current Loads</h3>
            <section>
                <span id="deloading_info">Deloading: - </span>
                <span id="regular_load_info">Regular: - </span>
                <span id="over_load_info">Over: - </span>
                <span id="emergency_load_info">Emergency: - </span>
            </section> 
        </div>
    `;

    const selectedLoadType = document.getElementById("select_load_type");

    // ADDING COURSE FILTER TO THE MODAL
    getAllColleges(colleges => {
        const selectCollegeFilter = document.getElementById("select_college_filter");
        colleges.forEach(college => {
            const option = document.createElement("option");
            if(college.coll_id == collegeId) option.selected = true;
            option.innerText = college.coll_code; 
            option.value = college.coll_id;
            selectCollegeFilter.appendChild(option);
        });
    })

    // SHOW THE INSTRUCTOR SELECTION
    suggestInstructors(collegeId, time, days, parseInt(unitsToLoad), selectedLoadType.value);

    /**
     * LISTEN WHEN COURSE FILTER CHANGED
     * THEN THE SUGGESTED INTRUCTORS WILL ALSO CHANGE BASED
     * ON THE SELECTED NEW COURSE
     */
    const selectCollegeFilter = document.getElementById("select_college_filter");
    selectCollegeFilter.addEventListener("change", (e) => {
        loader.style.display = "flex";
        suggestInstructors(e.target.value, time, days, parseInt(unitsToLoad), selectedLoadType.value);
    })

    selectedLoadType.addEventListener("change", (e) => {
        loader.style.display = "flex";
        suggestInstructors(selectCollegeFilter.value, time, days, parseInt(unitsToLoad), e.target.value);
    })
}


function suggestInstructors(collegeId, timeslot, days, unitsToLoad, loadType){
    const instructorSuggestionBox = document.querySelector(".suggested_instructors_box");
    instructorSuggestionBox.innerHTML = "";

    // FILTER INSTRUCTOR BY TIME
    getInstructorsByCollegeId(collegeId, (instructors) => {

        if(instructors.length == 0){
            instructorSuggestionBox.innerHTML = `<span>No available instructor.</span>`;
            loader.style.display = "none";
            return;
        }
        
        instructors.forEach(instructor => {
            checkInstructorConflict(instructor.fac_id, semParam, days, academicYear, timeslot, (conflictResponse) => {
                checkLoadAvailability(instructor.fac_id, instructor.position, semParam, academicYear, unitsToLoad, loadType, (loadResponse) => {
                    let radioSelect = document.createElement("div");
                    radioSelect.classList.add("radio_wrapper");

                    let radioStatus = '';
                    if(!conflictResponse.status || loadResponse.msg !== "AVAILABLE"){
                        radioStatus = 'disabled';
                    }
                    
                    if(loadType === 'merge'){
                        radioStatus = '';
                    }

                    radioSelect.innerHTML = `
                        <input type="radio" 
                            onchange="displayLoadInfo('${instructor.fac_id}', '${semParam}', '${academicYear}', '${unitsToLoad}')" 
                            name="selected_instructor" id="${instructor.fac_id}" 
                            value="${instructor.fac_id}" ${radioStatus}>

                        <section>
                            <h3>${instructor.fname} ${instructor.lname}</h3>

                            ${ loadType === 'merge' ? `
                                    <span style="background-color: #00a143;">Available </span>
                                ` : `
                                    ${!conflictResponse.status ? `
                                        <span style="background-color: #a10000;">Conflict</span>
                                    `
                                    : '<span style="background-color: #00a143;">Available </span>'}
                                    ${
                                        loadResponse.msg !== "AVAILABLE" ? `
                                        <span style="background-color: #a86e01;">${loadResponse.msg}</span>
                                        <span style="color: #000">Current Load: ${loadResponse.currentLoad}</span>
                                        ` : ''
                                    }
                                `
                            }
                        </section>
                        
                        <button id="view_instructor_schedule" onclick="showInstructorSchedules('${instructor.fac_id}');">
                            <i class="fas fa-table-cells"></i>
                        </button>
                    `;

                    // APPEND TO THE INSTRUCTOR SUGGESTION BOX
                    instructorSuggestionBox.appendChild(radioSelect);
                    loader.style.display = "none";
                })
            })
        });
    });
}


closeInstructorSchedulesPopup.addEventListener("click", () => {
    instructorSchedulesPopup.style.display = "none";
})
function showInstructorSchedules(facultyId){
    instructorSchedulesPopup.style.display = "block";
    let schedulesStr = '';
    getInstructorSchedules(facultyId, (schedules) => {
        const content = document.querySelector(".instructor_schedules")
        
        if(schedules.length == 0) return content.innerHTML = "<span>Empty</span>"

        schedules.forEach(schedule => {
            schedulesStr += `<span>${schedule.program_code} ${schedule.sched_day} ${schedule.sched_time}</span><br>`
        })

        content.innerHTML = schedulesStr;
    })
}

function displayLoadInfo(facultyId, sem, acadYear, unitsToLoad){
    const selectedLoadType = document.getElementById("select_load_type");
    const deloadingInfo = document.getElementById("deloading_info");
    const regularLoadsInfo = document.getElementById("regular_load_info");
    const overLoadsInfo = document.getElementById("over_load_info");
    const emergencyLoadsInfo = document.getElementById("emergency_load_info");
    getSchedulesByFacultyId(facultyId, sem, acadYear, (schedules) => {
        getFacultyDesignations(facultyId, (designations) => {
            // GET THE GREATER DELOADING UNITS
            let deloading = 0;
            designations.forEach(designation => {
                if(designation.deloading > deloading){
                    deloading = parseInt(designation.deloading);
                }
            })

            let regularLoad = deloading; // SET THE INITIAL VALUE OF REGULAR LOAD TO THE DELOADING UNITS
            let overLoad = 0;
            let emergencyLoad = 0;
            let schedTracker = []; // USE TO TRACE THE SCHEDULE WITH MULTIPLE DAYS

            schedules.forEach(schedule => {
                // CLASIFY THE LOAD ACCORDING TO ITS TYPE
                if(!schedTracker.includes(schedule.program_code)){
                    let units = schedule.type == "lab" ? (parseInt(schedule.lab_hr) * 3) * .75 : parseInt(schedule.lec_hr);
                    switch(schedule.load_type){
                        case "regular":
                            regularLoad += units;
                            break;
                        case "over":
                            overLoad += units;
                            break;
                        case "emergency":
                            emergencyLoad += units;
                            break;
                    }

                    schedTracker.push(schedule.program_code);
                }
            }) 

            // DISPLAY TO THE MODAL
            deloadingInfo.innerText = "Deloading: " + deloading;
            regularLoadsInfo.innerText = "Regular: " + regularLoad;
            overLoadsInfo.innerText = "Over: " + overLoad;
            emergencyLoadsInfo.innerText = "Emergency: " + emergencyLoad;
        })
    })
}

function checkLoadAvailability(facultyId, position, sem, acadYear, unitsToLoad, loadType, callback){
    getSchedulesByFacultyId(facultyId, sem, acadYear, (schedules) => {
        getFacultyDesignations(facultyId, (designations) => {
            // GET THE GREATER DELOADING UNITS
            let deloading = 0;
            designations.forEach(designation => {
                if(designation.deloading > deloading){
                    deloading = parseInt(designation.deloading);
                }
            })

            let regularLoad = deloading; // SET THE INITIAL VALUE OF REGULAR LOAD TO THE DELOADING UNITS
            let overLoad = 0;
            let emergencyLoad = 0;
            let schedTracker = []; // USE TO TRACE THE SCHEDULE WITH MULTIPLE DAYS

            schedules.forEach(schedule => {
                // CLASIFY THE LOAD ACCORDING TO ITS TYPE
                if(!schedTracker.includes(schedule.program_code)){
                    let units = schedule.type == "lab" ? (parseInt(schedule.lab_hr) * 3) * .75 : parseInt(schedule.lec_hr);
                    switch(schedule.load_type){
                        case "regular":
                            regularLoad += units;
                            break;
                        case "over":
                            overLoad += units;
                            break;
                        case "emergency":
                            emergencyLoad += units;
                            break;
                    }

                    schedTracker.push(schedule.program_code);
                }
            })
            // DETECT THE MAXIMUM LOAD
            if(position.toUpperCase() === "PART-TIME"){
                if((regularLoad + unitsToLoad) > 9){ // 9 UNITS IS THE MAX LOAD OF THE PART-TIME
                    return callback({msg:"MAXLOAD EXCEED", currentLoad: regularLoad});
                }
            }else{
                var currentLoad = regularLoad + overLoad + emergencyLoad;
                if((currentLoad + unitsToLoad) > 33){ // 33 UNITS IS THE MAXIMUM LOAD OF PERMANENT AND CONTRUCTUAL
                    return callback({msg:"MAXLOAD EXCEED", currentLoad: currentLoad});
                }
            }

            // EVALUATE WHAT TYPE OF LOAD THE NEW SCHEDULE SHOULD BE
            if(loadType === "regular" && (regularLoad + unitsToLoad) > 21){
                return callback({msg:"REGULAR LOAD EXCEED", currentLoad: regularLoad});

            }else if(loadType === "over" && (overLoad + unitsToLoad) > 9){
                return callback({msg:"OVER LOAD EXCEED", currentLoad: overLoad});

            }else if(loadType === "emergency" && (emergencyLoad + unitsToLoad) > 3){
                return callback({msg:"EMERGENCY LOAD EXCEED", currentLoad: emergencyLoad});
            }else{
                return callback({msg:"AVAILABLE"});
            }
        })
    })
}

// ADDING OR POSTING THE NEW SCHEDULE
function saveSchedule(){
    const selectedInstructor = document.querySelector('input[name="selected_instructor"]:checked');
    const selectedLoadType = document.getElementById("select_load_type");

    if(newSchedules.length == 0) return;
    if(!selectedInstructor) return alert("Please select instructor!");

    // APPEND FACULTY ID AND LOAD TYPE TO THE NEW SCHEDULE OBJECT
    newSchedules.forEach( schedule => {
        schedule.faculty_id = selectedInstructor.value;
        schedule.load_type =  selectedLoadType.value;
    })

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.responseText);
            if(response.type == "success"){
                newSchedules = new Array(); // RESET THE DATA
                showMessage(response.msg, "SUCCESS");
                modalContainer.style.display = "none"; 
                displayStudentSchedules(section);
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=INSERT_OFFERED_SEM&payload=${JSON.stringify(newSchedules)}`);
}

function displayDroppedElem(selectedTime, day, content, programCode){
    const schedTime = selectedTime.split("-");
    const timeSeries = generateTimeSeries(schedTime[0], schedTime[1], timeFrameInterval);
    for(let i=0; i<timeSeries.length; i++){
        if(i == 0 || i == timeSeries.length-1){
            const cellType = i == 0 ? "start" : "end";
            const cell = document.getElementById(timeSeries[i]+"_"+day+"_"+cellType);
            cell.style.backgroundColor = "#b9d7fa";
            cell.classList.remove("drop-zone");
            continue;
        }
        const startCell = document.getElementById(timeSeries[i]+"_"+day+"_start");
        const endCell = document.getElementById(timeSeries[i]+"_"+day+"_end");
        startCell.style.backgroundColor = "#b9d7fa";
        endCell.style.backgroundColor = "#b9d7fa";
        startCell.classList.remove("drop-zone");
    }
    document.getElementById(timeSeries[0]+"_"+day+"_start").innerHTML = `
        <div class="schedule_info ${programCode}" >
            ${content}
        </div>
    `;
}

function getAllColleges(callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const colleges = JSON.parse(this.response);
                callback(colleges);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_ALL_COLLEGES`, true);
    xhttp.send();
}

// UPDATE INSTRUCTOR FOR EXISTING SCHEDULE
function updateSchedule(program_code){
    const selectedInstructor = document.querySelector('input[name="selected_instructor"]:checked');

    if(!selectedInstructor) return alert("Please select instructor!");

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.responseText);
            if(response.type == "success"){
                showMessage(response.msg, "SUCCESS");
                modalContainer.style.display = "none"; 
                setTimeout(() => {
                    reloadPlottingArea();
                }, [2500]);
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=CHANGE_INSTRUCTOR&program_code=${program_code}&faculty_id=${selectedInstructor.value}`);
}

// DELETE SCHEDULE
function deleteSchedule(program_code){
    modalContainer.style.display = "flex"; 
    modalHeader.innerHTML = `<h2>Please provide your password to delete ${program_code.toUpperCase()}?</h2>`;
    modalContent.innerHTML = `<input type="password" id="pass_to_delete" placeholder="password"/>`
    modalActions.innerHTML = `
        <button id="delete_schedule" onclick="confirmDeleteSchedule('${program_code}');">Delete</button>
        <button id="cancel_delete" onclick="modalContainer.style.display='none';">Cancel</button>
    `;
}
function confirmDeleteSchedule(program_code){
    const password = document.getElementById("pass_to_delete").value;
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.responseText);
            if(response.type == "success"){
                showMessage(response.msg, "SUCCESS");
                modalContainer.style.display = "none"; 
                setTimeout(() => {
                    reloadPlottingArea();
                }, [2500]);
            }else{
                showMessage(response.msg, "ERROR");
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=DELETE_SCHEDULE&program_code=${program_code}&password=${password}`);
}

function disableInstructorRadioBtn(e, id){
    var radio = document.getElementById(id);
    radio.disabled = !radio.disabled;
    if(radio.disabled) e.target.innerHTML = "Ignore";
    else e.target.innerHTML = "Undo";
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

function isInstructorAvailableToLoad(facultyId, maxInstructorLoad, unitsToLoad, callback){
    getSchedulesByFacultyId(facultyId, semParam, academicYear, schedules => {
        // CALCULATE THE CURRENT LOADED UNITS OF THE INSTRUCTOR
        let currentInstructorLoads = 0;
        // USE TO TRACK THE PREVIOUSE SUBJECT IN ORDER TO KNOW IF THE SUBJECT IS ALREADY COUNTED
        let prevProgramCode = "";  
        schedules.forEach( schedule => {
            // IF THE PREVIOUS PROGRAM CODE IS THE SAME TO THE SCHEDULE PROGRAM CODE 
            // IT MEANS THE CURRENT SCHEDULE IS THE SAME TO THE PREVIOUS SCHEDULE
            // IN THAT CASE THE PROCESS SHOULD STOP
            if(schedule.program_code == prevProgramCode) return; 
                
            if(schedule.type == "lab"){
                currentInstructorLoads += (parseInt(schedule.lab_hr) * 3) * .75;
            }else if(schedule.type == "lec"){
                currentInstructorLoads += parseInt(schedule.lec_hr);
            }

            prevProgramCode = schedule.program_code;
        });

        if(currentInstructorLoads + unitsToLoad <= maxInstructorLoad){
            callback(true, currentInstructorLoads, maxInstructorLoad, schedules);

        }else if(currentInstructorLoads + unitsToLoad  > maxInstructorLoad){
            callback(false, currentInstructorLoads, maxInstructorLoad, schedules);
        }
    })
}

function getRoomSchedules(roomId, sem, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.responseText == "") return callback(this.responseText);
            const roomSchedules = JSON.parse(this.response);
            callback(roomSchedules);
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_ROOM_SCHEDULES&room_id=${roomId}&sem=${sem}&acad_year=${academicYear}`, true);
    xhttp.send();
}
/**
 * SHOW ALL THE EXISTING SCHEDULES OF THE SELECTED SECTION
 * @param {*} section 
 */
function displayStudentSchedules(section){
    getStudentSchedule(courseId, section, yearParam, semParam, academicYear, function(schedules){
        if(schedules.length == 0) {
            selectFormat.disabled = false;
            loader.style.display = "none";
            return showMessage("Empty Schedule", "INFO");
        };
        let format;
        schedules.forEach(schedule => {
            format = schedule.format;
        })
        selectFormat.value = format;
        const event = new Event('change');
        selectFormat.dispatchEvent(event);
        selectFormat.disabled = true;
        
        schedules.forEach(schedule => {
            const schedTime = schedule.sched_time.split("-");
            const timeSeries = generateTimeSeries(schedTime[0], schedTime[1], timeFrameInterval);

            for(let i=0; i<timeSeries.length; i++){
                if(i == 0 || i == timeSeries.length-1){
                    const cellType = i == 0 ? "start" : "end";
                    const cell = document.getElementById(timeSeries[i]+"_"+schedule.sched_day+"_"+cellType);
                    cell.style.backgroundColor = "#b9d7fa";
                    cell.classList.remove("drop-zone");
                    continue;
                }
                const startCell = document.getElementById(timeSeries[i]+"_"+schedule.sched_day+"_start");
                const endCell = document.getElementById(timeSeries[i]+"_"+schedule.sched_day+"_end");
                startCell.style.backgroundColor = "#b9d7fa";
                endCell.style.backgroundColor = "#b9d7fa";
                startCell.classList.remove("drop-zone");
            }

            const sheduleID = schedule.program_code + Math.random().toString(16).slice(2);
            
            document.getElementById(timeSeries[0]+"_"+schedule.sched_day+"_start").innerHTML = `
                <div class="schedule_info" >
                    <header>
                        <i class="fas fa-eye" onmouseover="showMoreSchedInfo('${sheduleID}');" onmouseout="hideMoreSchedInfo('${sheduleID}');">
                            <div class="more_schedule_info" id=${sheduleID}>
                                <span>${schedule.subject_code}</span>
                                <span>${schedule.title} - ${schedule.type}</span>
                            </div>
                        </i>
                        <i class="fas fa-trash" id="" onclick="deleteSchedule('${schedule.program_code}');"></i>
                    </header>
                    <span class="inline_text">${schedule.program_code} - ${schedule.type}</span>
                    <span>${schedule.sched_time}</span>
                    <span class="${schedule.room_status == 'unusable' ? 'unusable_room' : ''}">${schedule.building}</span>
                    <span>${schedule.lname + " " + schedule.fname} 
                        <i class="fas fa-pencil" id="edit_instructor" onclick="editInstructor('${JSON.stringify(schedule).split('"').join("&quot;")}');"></i>
                    </span>
                </div>
            `;
        })
        loader.style.display = "none";
    });
}

function editInstructor(data){
    loader.style.display = "flex";
    const schedule = JSON.parse(data);
    const unitsToLoad =  schedule.type == "lec" ? schedule.lec_hr : (schedule.lab_hr * 3) * .75;
    let schedDays = [];
    switch(schedule.format){
        case "format1":
            if(schedule.sched_day == "Mon" || schedule.sched_day == "Thu"){
                schedDays = ["Mon", "Thu"];
            }else if(schedule.sched_day == "Tue" || schedule.sched_day == "Fri"){
                schedDays = ["Tue", "Fri"];
            }else{
                schedDays = [schedule.sched_day];
            }
            break;

        case "format2":
            if(schedule.sched_day == "Mon" || schedule.sched_day == "Wed" || schedule.sched_day == "Fri"){
                schedDays = ["Mon", "Wed", "Fri"];
            }else if(schedule.sched_day == "Tue" || schedule.sched_day == "Thu"){
                schedDays = ["Tue", "Thu"];
            }else{
                schedDays = [schedule.sched_day];
            }
            break;
    }
    instructorSelection(
        'RE-ASSIGN_INSTRUCTOR', schedule.sched_time, schedDays, schedule.year, 
        schedule.sem, schedule.program_code, schedule.type, unitsToLoad
    );
}

function showMoreSchedInfo(scheduleId){
    document.getElementById(`${scheduleId}`).style.display = "block";
}
function hideMoreSchedInfo(scheduleId){
    document.getElementById(`${scheduleId}`).style.display = "none";
}

/**
 * DISPLAY THE EXISTING SCHEDULES OF THE SELECTED ROOM
 * @param {*} room_id
 */
function displayRoomSchedules(room_id){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const schedules = JSON.parse(this.response);
            schedules.forEach(schedule => {
                const schedTime = schedule.sched_time.split("-");
                const timeSeries = generateTimeSeries(schedTime[0], schedTime[1], timeFrameInterval);
                
                for(let i=0; i<timeSeries.length; i++){
                    if(i == 0 || i == timeSeries.length-1){
                        const cellType = i == 0 ? "start" : "end";
                        const cell = document.getElementById(timeSeries[i]+"_"+schedule.sched_day+"_"+cellType);
                        cell.style.backgroundColor = "#ffd7d7";
                        cell.classList.remove("drop-zone");
                        continue;
                    }

                    const startCell = document.getElementById(timeSeries[i]+"_"+schedule.sched_day+"_start");
                    const endCell = document.getElementById(timeSeries[i]+"_"+schedule.sched_day+"_end");
                    
                    startCell.classList.remove("drop-zone");
                    // endCell.classList.remove("drop-zone");

                    startCell.style.backgroundColor = "#ffd7d7";
                    endCell.style.backgroundColor = "#ffd7d7";
                }
            })
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_ROOM_SCHEDULES&room_id=${room_id}&sem=${semParam}&acad_year=${academicYear}`, true); 
    xhttp.send();
}

function getStudentSchedule(courseId, section, year, sem, acad_year, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // PASSING THE RESPONSE TO THE CALLBACK FUNCTION
            const scheduleBySection = JSON.parse(this.response);
            callback(scheduleBySection);
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_SCHEDULE_BY_SECTION&course_id=${courseId}&year=${year}&sem=${sem}&section=${section}&acad_year=${acad_year}`, true);
    xhttp.send();
}

function getInstructorsByCollegeId(collegeId, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const instructors = JSON.parse(this.response);
                callback(instructors);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?coll_id=${collegeId}&action=GET_INSTRUCTORS_BY_COLLEGE`, true);
    xhttp.send();
}

function getInstructorSchedulesInDay(instructorId, scheduleDay, acad_year, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const schedules = JSON.parse(this.response);
                callback(schedules);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_INSTRUCTOR_SCHEDULES_IN_DAY&instructor_id=${instructorId}&schedule_day=${scheduleDay}&sem=${semParam}&acad_year=${acad_year}`, true);
    xhttp.send();
}

function getInstructorSchedules(instructorId, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const schedules = JSON.parse(this.response);
                callback(schedules);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_INSTRUCTOR_SCHEDULES&instructor_id=${instructorId}&sem=${semParam}&acad_year=${academicYear}`, true);
    xhttp.send();
}

function getSchedulesByFacultyId(facultyId, sem, acad_year, callback){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const schedules = JSON.parse(this.response);
                callback(schedules);
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_SCHEDULES_BY_FACULTY_ID&faculty_id=${facultyId}&sem=${sem}&acad_year=${acad_year}`, true);
    xhttp.send();
}

/**
 * FILTERING EACH SUBJECTS TO SHOW BASED ON THE SELECTED SECTION
 * @param {*} section 
 */
function filterOfferedSubjects(section){
    getStudentSchedule(courseId, section, yearParam, semParam, academicYear, (schedules) => {
        subjectsCon.innerHTML = '';
        for(let i=0; i<subjects.length; i++){
            // GET PROGRAM CODE FROM SUBJECTS
            const programCode =  subjects[i].id + section;
            let schedExist = false;
            for(let j=0; j<schedules.length; j++) {
                if(schedules[j].program_code === programCode){
                    // SHOW THE SUBJECT THAT IS NOT ALREADY SCHEDULED IN THE CURRENT SELECTED SECTION 
                    schedExist = true;
                    break;
                }
            }
            // ADD TO STRING OF NOT EXIST
            if(!schedExist) subjectsCon.appendChild(subjects[i]);
        }

        // subjectsCon.innerHTML = subjects;
        
        if(subjectsCon.children.length == 0) subjectsCon.innerHTML = `
            <h2>NO SUBJECT LEFT</h2>
            <div class="subjects_placeholder">
                <img src="../public/img/books.png">
            </div>
        `;
    })
}

/**
 * GENERATE AN ARRAY THAT COTAINS A TIME SERIES 
 * @param {*} startingTime 
 * @param {*} endingTime 
 * @param {*} interval 
 * @returns 
 */
function generateTimeSeries(startingTime, endingTime, interval){
    let timeSeries = new Array();

    // EXTRACTING START TIME
    const start_hr = parseInt(startingTime.split(":")[0]);
    const start_min = parseInt(startingTime.split(":")[1].substring(0, 2));

    // // EXTRACTING END TIME
    const end_hr = parseInt(endingTime.split(":")[0]);
    const end_min = parseInt(endingTime.split(":")[1].substring(0, 2));

    // GETTING THE MERIDIEM (EX. PM OR AM)
    const meridiem = startingTime.substring(startingTime.length-2, startingTime.length);

    // TOTAL MINUTES OF THE STARTING AND ENDING TIME
    let s_total_min = (start_hr*60)+start_min;
    let e_total_min = (end_hr*60)+end_min;

    // A BREAK POINT WHERE THE WIHLE LOOP ENDS
    const break_point = s_total_min;

    while(e_total_min >= break_point){
        const time = parseInt(s_total_min/60) + ":" + String(s_total_min%60).padStart(2, 0) + meridiem;
        timeSeries.push(time)
        s_total_min += interval;
        e_total_min -= interval;
    }

    return timeSeries;
}

// MOVE MODAL
function moveModal({movementX, movementY}){
    const modalStyles = getComputedStyle(modal);
    const top = parseInt(modalStyles.top) + movementY;
    const left = parseInt(modalStyles.left) + movementX;
    modal.style.top = `${top}px`;
    modal.style.left = `${left}px`;
}
modalHeader.addEventListener("mousedown", () => {
    modalHeader.addEventListener("mousemove", moveModal)
})
document.addEventListener("mouseup", () => {
    modalHeader.removeEventListener("mousemove", moveModal);
})

function showMessage(msg, type){
    popupMsgCon.style.display = "flex";

    switch(type){
        case "WARNING":
            popupMsg.innerHTML = `
                <img src="../public/img/warning.png" alt="warning">
                <span>${msg}</span>
            `
            break;
        case "ERROR":
            popupMsg.innerHTML = `
                <img src="../public/img/error.png" alt="error">
                <span>${msg}</span>
            `
            break;
        case "SUCCESS":
            popupMsg.innerHTML = `
                <img src="../public/img/success.png" alt="success">
                <span>${msg}</span>
            `
            break;
        case "INFO":
            popupMsg.innerHTML = `
                <img src="../public/img/info.png" alt="success">
                <span>${msg}</span>
            `
            break;
    }
    // HIDE THE POPUP MESSAGE
    setTimeout(() => {
        popupMsgCon.style.display = "none";
    }, [2500])
}

/**
 * THIS FUCNTION WILL RESET/CLEAR THE PLOTTING AREA OF SCHEDULES
 * THEN IT WILL RE-DISPLAY THE CLASS SCHEDULES AND THE ROOM OCCUPANCY
 */
function reloadPlottingArea(){
    modalContainer.style.display = "none"; 

    if(draggableElem)
        draggableElem.style.display = "flex"; // THE SUBJECT BEING dragged

    const collWithCells = document.querySelectorAll(".coll_with_cells");

    collWithCells.forEach(coll => {
        for(let i=0; i<coll.children.length-1; i++){
            // THIS IS FOR DROP POINT CELLS
            if(i % 2 == 1){
                // ADD A drop-zone CLASS IF NOT EXIST
                if(!coll.children[i].classList.contains("drop-zone")) {
                    coll.children[i].classList.add("drop-zone");
                }
                coll.children[i].style.backgroundColor = "#e4e5f1";
                coll.children[i].innerHTML = "";
            }else{
                coll.children[i].style.backgroundColor = "#FFF";
            }
        }
    })

    // RE-RENDER SUBJECTS 
    filterOfferedSubjects(section)

    // RE-DISPLAY ROOM SCHEDULE
    displayRoomSchedules(selectRoom.value);

    // RE-DISPLAY STUDENT SCHEDULES
    setTimeout(() => {
        displayStudentSchedules(section);
    }, [1000])

    // RESET THE NEW SCHEDULE
    newSchedules = [];
}
