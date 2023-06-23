
const header = document.querySelector(".header");
const zoomContainer = document.getElementById("zoom_container");
const zoomIn = document.getElementById("zoom_in");
const zoomOut = document.getElementById("zoom_out");
let scheduleContainer = document.getElementById('schedule_container');
const selectCourse = document.getElementById("select_course");
const selectYear = document.getElementById("select_year");
const selectSem = document.getElementById("select_sem");
const selectSection = document.getElementById("select_section");
const courseHead = document.querySelector(".course_head");
const majorHead = document.querySelector(".major_head");
const semesterHead = document.querySelector(".semester_head");
const yearHead = document.querySelector(".year_head");
const sectionHead = document.querySelector(".section_head");
const schedTable = document.getElementById("table");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

const dayFormat1 = [{"day": "MTh", "meridiem":["morning", "afternoon"]},
                    {"day": "Wed", "meridiem": ["morning", "afternoon"]},
                    {"day": "TF", "meridiem": ["morning", "afternoon"]},
                    {"day": "Sat", "meridiem": ["morning", "afternoon"]}];

const dayFormat2 = [{"day": "MWF", "meridiem":["morning", "afternoon"]},
                    {"day": "TTh", "meridiem": ["morning", "afternoon"]},
                    {"day": "Sat", "meridiem": ["morning", "afternoon"]}];

if(selectCourse != null && selectYear != null && selectSem != null && selectSection != null){
    displayStudentSchedule(selectCourse.value, selectYear.value, selectSem.value, selectSection.value);
}

selectCourse.addEventListener("change", (e) => {
    if(selectCourse.value != '' && selectYear.value != '' && selectSem.value != '' && selectSection.value != ''){
        resetTableBody();
        displayStudentSchedule(selectCourse.value, selectYear.value, selectSem.value, selectSection.value);
    }
})

selectYear.addEventListener("change", (e) => {
    if(selectCourse.value != '' && selectYear.value != '' && selectSem.value != '' && selectSection.value != ''){
        resetTableBody();
        displayStudentSchedule(selectCourse.value, selectYear.value, selectSem.value, selectSection.value);
    }
})

selectSem.addEventListener("change", (e) => {
    if(selectCourse.value != '' && selectYear.value != '' && selectSem.value != '' && selectSection.value != ''){
        resetTableBody();
        displayStudentSchedule(selectCourse.value, selectYear.value, selectSem.value, selectSection.value);
    }
})

selectSection.addEventListener("change", (e) => {
    if(selectCourse.value != '' && selectYear.value != '' && selectSem.value != '' && selectSection.value != ''){
        resetTableBody();
        displayStudentSchedule(selectCourse.value, selectYear.value, selectSem.value, selectSection.value);
    }
})

function displayStudentSchedule(course_id, year, sem, section){
    semesterHead.innerHTML = sem.toUpperCase();
    getCourse(course_id, (course) => {
        courseHead.innerHTML = course.crs_desc.toUpperCase();
        majorHead.innerHTML = course.major;
    })

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.response)
            const schedules = JSON.parse(this.response); 
            const sortedSchedules = sortSchedules(schedules);

            // GET THE FORMAT
            let format;
            sortedSchedules.forEach(schedule => {
                format = schedule.format
            })
            displaySchedTemplate(format, year.toUpperCase(), section);

            let currentProgramCodes = new Array();
            let totalUnits = 0;
            sortedSchedules.forEach(schedule => {
                const day = schedule.sched_day;
                const meridiem = schedule.sched_time.slice(-2)
                const time = schedule.sched_time.split("-")[0].slice(0, -2) + "-" + schedule.sched_time.split("-")[1].slice(0, -2);
                const units = parseFloat(schedule.type == "lab" ? schedule.lab_hr : schedule.lec_hr);

                if(currentProgramCodes.includes(schedule.program_code)) return; // AVOID SCHEDULE TO POPUP TWICE

                // INCREMENT TOTAL UNITS
                totalUnits += units
                
                let rowData = `
                    <td class="left_text">${time}</td>
                    <td></td>
                    <td>${schedule.program_code}</td>
                    <td>${schedule.subject_code}</td>
                    <td class="desc_title">${schedule.lab_hr == 0 ? schedule.title : schedule.title + " - " + schedule.type}</td>
                    <td>${units}</td>
                    <td class="${schedule.room_status == 'unusable' ? 'unusable_room' : ''}">${schedule.building}</td>
                    <td>${schedule.fname[0] + " " + schedule.lname}</td>
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
                if(document.querySelector(`#${target} .placeholder`) != null) tbody.innerHTML = "";
                tbody.appendChild(row);
            })

            document.getElementById("total_units").innerText = totalUnits;
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_CURRERNT_STUDENT_SCHEDULE&course_id=${course_id}&year=${year}&sem=${sem}&section=${section}`, true);
    xhttp.send();
}

function displaySchedTemplate(format, year, section){
    let tbodyStr = `
        <thead>
            <th>
                <span>${year}</span>
                YEAR
                <span>${section}</span>
            </th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </thead>
        <thead>
            <th>TIME</th>
            <th>DAY</th>
            <th>PROGRAM CODE</th>
            <th>COURSE CODE</th>
            <th>DESCRIPTIVE TITLE</th>
            <th>UNITS</th>
            <th>ROOM</th>
            <th>INSTRUCTOR</th>
        </thead>
    `

    switch(format){
        case "format1":
            dayFormat1.forEach(data => {
                data.meridiem.forEach(mer => {
                    tbodyStr += `
                        <thead id="${data.day}_${mer}_head">
                            <th class="left_text">${mer.toUpperCase()}</th>
                            <th>${mer == "morning" ? data["day"]: ""}</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </thead>
                        <tbody id="${data.day}_${mer}">
                            <tr class="placeholder">
                                <td class="left_text">${mer == "morning" ? "7:30-12:00" : "1:00-8:00"}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    `;
                })
            })
            break;
        case "format2":
            dayFormat2.forEach(data => {
                data.meridiem.forEach(mer => {
                    tbodyStr += `
                        <thead id="${data.day}_${mer}_head">
                            <th class="left_text">${mer.toUpperCase()}</th>
                            <th>${mer == "morning" ? data["day"]: ""}</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </thead>
                        <tbody id="${data.day}_${mer}">
                            <tr class="placeholder">
                                <td class="left_text">${mer == "morning" ? "7:30-12:00" : "1:00-8:00"}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    `;
                })
            })
            break;
        default:
            tbodyStr += `
                <tbody>
                    <tr>
                        <td colspan=8 style="padding:5px 0;">EMPTY</td>
                    </tr>
                </tbody>
            `;
    }

    tbodyStr += `
        <thead>
            <th class="left_text" colspan="5">TOTAL UNITS</th>
            <th id="total_units"></th>
            <th></th>
            <th></th>
        </thead>
    `
    schedTable.innerHTML = tbodyStr;
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
                <td></td>
                <td></td>
            </tr
        `;
        tbody.innerHTML = placeholder;
    })
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

function downloadClassSchedule(){
    scheduleContainer.style.transform = 'scale(1)'
    var opt = {
        margin:       0,
        filename:     'STUDENT-CLASS-SCHEDULE.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 2 },
        jsPDF:        { unit: 'in', format: 'legal', orientation: 'landscape' }
    };

    // New Promise-based usage:
    html2pdf().set(opt).from(scheduleContainer).save();
}

let currentZoomTool = 'zoom_in';
function changeZoomTool(tool){
    if(tool === 'zoom_in'){
        zoomIn.style.display = "flex";
        zoomOut.style.display = "none";
        scheduleContainer.style.cursor = "zoom-in";
    }else if(tool === 'zoom_out'){
        zoomIn.style.display = "none";
        zoomOut.style.display = "flex";
        scheduleContainer.style.cursor = "zoom-out";
    }
    currentZoomTool = tool;
}

let zoom = 1;
function zoomSchedule(){
    zoom = currentZoomTool === 'zoom_in' ? zoom+=.1 : zoom-=.1;
    transformOrigin = [0,0];
    scheduleContainer = scheduleContainer || instance.getContainer();
    var p = ["webkit", "moz", "ms", "o"],
        scale = "scale(" + zoom + ")",
        oString = (transformOrigin[0] * 50) + "% " + (transformOrigin[1] * 50) + "%";

    for (var i = 0; i < p.length; i++) {
        scheduleContainer.style[p[i] + "Transform"] = scale;
        scheduleContainer.style[p[i] + "TransformOrigin"] = oString;
    }

    scheduleContainer.style["transform"] = scale;
    scheduleContainer.style["transformOrigin"] = oString;
}
let touchtime = 0;
scheduleContainer.addEventListener("click", () => {
    // CREATE A CUSTOM DOUBLE CLICK FOR MOBILE FUNCTIONALITY
    if (touchtime == 0) {
        // set first click
        touchtime = new Date().getTime();
    } else {
        // compare first click to this click and see if they occurred within double click threshold
        if (((new Date().getTime()) - touchtime) < 800) {
            // double click occurred
            // RUN ZOOM FUNCTIONALITY
            zoomSchedule();
            touchtime = 0;
        } else {
            // not a double click so set as a new first click
            touchtime = new Date().getTime();
        }
    }
})

const showHeaderBtn = document.getElementById("show_header_btn");
const hideHeaderBtn = document.getElementById("hide_header_btn");
showHeaderBtn.addEventListener("click", () => {
    header.style.top = 0;
})
hideHeaderBtn.addEventListener("click", () => {
    header.style.top = "-100%";
})

function getCourse(courseId, callback){
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const course = JSON.parse(this.response);
            callback(course)
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_COURSE_BY_ID&course_id=${courseId}`, true);
    xhttp.send();
}

