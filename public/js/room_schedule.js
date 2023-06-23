
const selectAcadYear = document.getElementById("select_acad_year")
const selectSem = document.getElementById("select_semester")
const currentLocation = new URL(location);
const roomId = currentLocation.searchParams.get("room_id");
const monMorning = document.getElementById("monday_morning");
const monAfternoon = document.getElementById("monday_afternoon");
const tueMorning = document.getElementById("teusday_morning");
const tueAfternoon = document.getElementById("teusday_afternoon");
const acadYearTag = document.getElementById("academic_year");
const semesterTag = document.getElementById("semester");

// TERMINATE THE LOADER
const loader = document.querySelector(".loader_container");
window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

// HANDLE THE ROOM SCHEDULES
if(selectAcadYear.value != "" && selectSem.value != ""){
    handleRoomSchedules(roomId, selectAcadYear.value, selectSem.value);

    selectAcadYear.addEventListener("change", (e) => {
        handleRoomSchedules(roomId, e.target.value, selectSem.value);
    })
    
    selectSem.addEventListener("change", (e) => {
        handleRoomSchedules(roomId, selectAcadYear.value, e.target.value);
    })
}

function handleRoomSchedules(roomId, academicYear, sem){
    acadYearTag.innerText = "AY: " + academicYear;
    semesterTag.innerText = sem.toUpperCase()+ " SEM";
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.responseText == "") return callback(this.responseText);
            const roomSchedules = JSON.parse(this.response);
            
            // DEFINE AN EMPTY ARRAY FOREACH DAY
            const monday =  [];
            const teusday =  [];
            const wednesday =  [];
            const thursday =  [];
            const friday =  [];
            const saturday =  [];

            // ARRANGE THE SCHEDULES ACCORDING TO THE DAYS
            roomSchedules.forEach(schedule => {
                switch(schedule.sched_day){
                    case "Mon":
                        monday.push(schedule);
                        break;
                    case "Tue":
                        teusday.push(schedule);
                        break;
                    case "Wed":
                        wednesday.push(schedule);
                        break;
                    case "Thu":
                        thursday.push(schedule);
                        break;
                    case "Fri":
                        friday.push(schedule);
                        break;
                    case "Sat":
                        saturday.push(schedule);
                        break;
                }
            })

            // UTILIZE EACH DAY'S SCHEDULES
            const utlMonday = utilizeRoomSchedule(monday);
            const utlTuesday = utilizeRoomSchedule(teusday);
            const utlWednesday = utilizeRoomSchedule(wednesday);
            const utlThursday = utilizeRoomSchedule(thursday);
            const utlFriday = utilizeRoomSchedule(friday);
            const utlSaturday = utilizeRoomSchedule(saturday);

            // DISPLAY THE UTILIZED SCHEDULES
            displayUtilizedSchedules(utlMonday, "monday")
            displayUtilizedSchedules(utlTuesday, "tuesday")
            displayUtilizedSchedules(utlWednesday, "wednesday")
            displayUtilizedSchedules(utlThursday, "thursday")
            displayUtilizedSchedules(utlFriday, "friday")
            displayUtilizedSchedules(utlSaturday, "saturday")
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_ROOM_SCHEDULES&room_id=${roomId}&acad_year=${academicYear}&sem=${sem}`, true);
    xhttp.send();
}

/**
 * WILL UTILIZED THE ROOM SCHEDULE
 * RETURN AN ARRAY CONTAINING THE OCCUPIED AND VACANT TIME OF THE ROOM
 *  */ 
function utilizeRoomSchedule(schedules){
    // SORT FIRST THE SCHEDULE AS ITS IS REQUIRED
    const sortedSchedules = sortSchedules(schedules);
    const timeFrame = [
        "7:30AM", "7:40AM", "7:50AM",
        "8:00AM", "8:10AM", "8:20AM", "8:30AM", "8:40AM", "8:50AM",
        "9:00AM", "9:10AM", "9:20AM", "9:30AM", "9:40AM", "9:50AM",
        "10:00AM", "10:10AM", "10:20AM", "10:30AM", "10:40AM", "10:50AM",
        "11:00AM", "11:10AM", "11:20AM", "11:30AM", "11:40AM", "11:50AM",
        "12:00AM", "1:00PM", "1:10PM", "1:20PM", "1:30PM", "1:40PM", "1:50PM",
        "2:00PM", "2:10PM", "2:20PM", "2:30PM", "2:40PM", "2:50PM", 
        "3:00PM", "3:10PM", "3:20PM", "3:30PM", "3:40PM", "3:50PM",
        "4:00PM", "4:10PM", "4:20PM", "4:30PM", "4:40PM", "4:50PM", 
        "5:00PM", "5:10PM", "5:20PM", "5:30PM", "5:40PM", "5:50PM", 
        "6:00PM", "6:10PM", "6:20PM", "6:30PM", "6:40PM", "6:50PM",
        "7:00PM", "7:10PM", "7:20PM", "7:30PM", "7:40PM", "7:50PM",
        "8:00PM"
    ];
    let utilizedSched = [];
    let pivot = 0; // TRACKER OF THE CURRRENT POSISTION IN THE TIME FRAME
    for(let i=0; i<sortedSchedules.length; i++){
        var startTime = sortedSchedules[i].sched_time.split("-")[0];
        var endTime = sortedSchedules[i].sched_time.split("-")[1];
        for(let j=pivot; j<timeFrame.length; j++){
            if(timeFrame[j] === startTime){
                // INSERT A VACANT TIME IF THE PIVOT IS NOT EQUAL TO THE CURRENT POSITION IN TIME FRAME
                if(j != pivot){
                    utilizedSched.push({
                        "time": timeFrame[pivot] + "-" + timeFrame[j],
                        "status": "vacant"
                    })
                }
                
                utilizedSched.push({
                    "time": sortedSchedules[i].sched_time,
                    "status": "occupied",
                    "schedule_info": sortedSchedules[i]
                })

                // RESET THE CURRENT POSITION IN THE TIME FRAME BASED ON THE END TIME OF THE EXISTING SCHEDULE
                pivot = timeFrame.indexOf(endTime); 
                break;
            }
        }
    }
    // PUSH THE REMAINING TIME FRAME
    if(pivot != timeFrame.length-1){
        utilizedSched.push({
            "time": timeFrame[pivot] + "-" + timeFrame[timeFrame.length-1],
            "status": "vacant"
        })
    }
    

    return utilizedSched;
}

function displayUtilizedSchedules(utilizedSched, day){
    const element = document.getElementById(day);
    let string = '';
    utilizedSched.forEach(schedule => {
        if(schedule.status === 'occupied'){
            string += `
                <div class="occupied">
                    OCCUPIED
                    <p>${schedule.time}</p>
                    <p>${schedule.schedule_info.crs_code}</p>
                    <p>${schedule.schedule_info.year.toUpperCase()} YEAR ${schedule.schedule_info.section}</p>
                    <p>${schedule.schedule_info.fname} ${schedule.schedule_info.lname}</p>
                </div>
            `
        }else if(schedule.status === 'vacant'){
            string += `
                <div class="vacant">
                    VACANT
                    <p>${schedule.time}</p>
                </div>
            `
        }
    })
    element.innerHTML = string;
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

