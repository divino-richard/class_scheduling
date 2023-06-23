const loader = document.querySelector(".loader_container");
const scheduleCon = document.querySelector(".schedules");
const modalCon = document.querySelector(".modal_container");
const selectedEmptyYear = document.getElementById("selected_empty_year");
const selectAcadYear = document.getElementById("select_acad_year");
const currentLocation = new URL(location);
const courseId = currentLocation.searchParams.get("course_id");
const popupMsgCon = document.querySelector(".popup_msg_con");
const popupMsgContent = document.querySelector(".popup_msg_content");
const popupMsg = document.querySelector(".popup_msg");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [500])
});

if(selectAcadYear.value != "") displaySchedules(selectAcadYear.value);

selectAcadYear.addEventListener("change", (e) => {
    displaySchedules(e.target.value);
})

function displaySchedules(academicYear){
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const schedules = JSON.parse(this.response);
                let str = '';
                schedules.forEach(sched => {
                    str += `<a href="./class_schedule.php?course_id=${courseId}&acad_year=${academicYear}&year=${sched.year}&sem=${sched.sem}">
                                <i class="fas fa-table-cells"></i>
                                <section>
                                    <span>${sched.year.toUpperCase()} YEAR</span>
                                    <span>${sched.sem.toUpperCase()} SEM</span>
                                    <span>AY: ${selectAcadYear.value}</span>
                                </section>
                            </a>`;
                });
                scheduleCon.innerHTML = str;
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=GET_SCHED_SEM_AND_YEAR&course_id=${courseId}&acad_year=${academicYear}`, true);
    xhttp.send();
}

function handleReuseSchedules(){
    if(!courseId) return alert("No defined course")
    // if(!selectAcadYear || selectAcadYear.value === "") return alert("Can't find any schedules");

    const response = confirm(`Are you sure to reuse schedules from AY: ${selectAcadYear.value} ?`);

    if(response === true){
        modalCon.style.display = "flex";
    }
}

document.getElementById("reuse_now").addEventListener("click", () => {
    loader.style.display = "flex";
    
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            loader.style.display = "none";
            const response = JSON.parse(this.responseText);
            if(response.status){
                showMessage(response.msg, "SUCCESS");
                modalCon.style.display = "none";
            }else{
                showMessage(response.msg, "ERROR");
            }
        }
    };
    xhttp.open("POST", "../controllers/ajax_handler.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(`action=REUSE_SCHEDULES&course_id=${courseId}&acad_year=${selectAcadYear.value}&reused_in=${selectedEmptyYear.value}`);
})

document.getElementById("cancel").addEventListener("click", () => {
    modalCon.style.display = "none";
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
