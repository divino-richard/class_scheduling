const currentLocation = new URL(location);
const courseIdPharam = currentLocation.searchParams.get("course_id");
const yearPharam = currentLocation.searchParams.get("year");
const semPharam = currentLocation.searchParams.get("sem");
const sectionPharam = currentLocation.searchParams.get("section");
const academicYearPharam = currentLocation.searchParams.get("acad_year");
const schedTable = document.querySelector(".sched_table");
const selectSection = document.getElementById("select_section");
const sectionHead = document.querySelector(".section_head");
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

if(selectSection != null){
    displayStudentSchedule();
    selectSection.addEventListener("change", (e) => {
        resetTableBody();
        displayStudentSchedule();
    })
}

function displayStudentSchedule(){
    getStudentSchedules((schedules) => {
        let currentProgramCodes = new Array();
        let totalUnits = 0;

        // GET THE FORMAT
        let format;
        schedules.forEach(schedule => {
            format = schedule.format
        })
        displaySchedTemplate(format);

        schedules.forEach(schedule => {
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
    })
}

function displaySchedTemplate(format){
    let tbodyStr = `
        <thead>
            <th>${yearPharam.toUpperCase()} YEAR <span class="section_head"></span></th>
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

function getStudentSchedules(callback){
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const schedules = JSON.parse(this.response); 
            const sortedSchedules = sortSchedules(schedules);
            callback(sortedSchedules);
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_SCHEDULE_BY_SECTION&course_id=${courseIdPharam}&year=${yearPharam}&sem=${semPharam}&section=${selectSection.value}&acad_year=${academicYearPharam}`, true);
    xhttp.send();
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


