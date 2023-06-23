const roomList = document.getElementById("room_list");
const modalCon = document.querySelector(".modal_container");
const formTitle = document.querySelector(".form_title span");
const formInputs = document.querySelectorAll("form input");
const formSelects = document.querySelectorAll("form select");
const formSubmit = document.getElementById("form_submit");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

modalCon.addEventListener("click", (event) => {
    if(event.target == modalCon){
        location.reload();
    }
})
document.getElementById("add_room").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleRoomEdit(data){
    console.log(data)
    const roomData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Room";
    formSubmit.innerHTML = `<input type="button" value="Edit Now" onclick="editRoomNow();">`

    formInputs.forEach(input => {
        if(input.name === "room_id"){
            input.value = roomData.rm_id;
            input.disabled = true;
        }
        if(input.name === "building") input.value = roomData.building;
    })

    formSelects.forEach(select => {
        if(select.name === "type") select.value = roomData.type;
        if(select.name === "status") select.value = roomData.status;
    })
}
function editRoomNow(){
    let roomData = {};
    formInputs.forEach(input => {
        if(input.name === "room_id") roomData.room_id = input.value;
        if(input.name === "building") roomData.building = input.value;
    })

    formSelects.forEach(select => {
        if(select.name === "type") roomData.type = select.value;
        if(select.name === "status") roomData.status = select.value;
    })

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.response);
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
    xhttp.send(`action=EDIT_ROOM&room_data=${JSON.stringify(roomData)}`);
}

function searchRoom(e, userType){
    const searchTerm = e.target.value;

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const rooms = JSON.parse(this.responseText);
                let row = '';
                rooms.forEach(room => {
                    row += `
                        <tr>
                            <td>${room.rm_id}</td>
                            <td>${room.building}</td>
                            <td>${room.type}</td>
                            <td>
                                ${ room.status == "usable" ? `<span class='usable_room'>${room.status.toUpperCase()}</span>`
                                : `<span class='unusable_room'>${room.status.toUpperCase()}</span>`}
                            </td>
                            <td> 
                                ${userType == 'admin' ? `
                                    <button class="tb_action_item" onclick="handleRoomEdit('${JSON.stringify(room).split('"').join("&quot;")}');" title="edit">
                                        <i class="fas fa-pencil"></i>
                                    </button>

                                    <button class="tb_action_item" title="delete" onclick="handleRoomDelete('${room.rm_id}');">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                ` : ``}
                                <button class="tb_action_item" title="schedule">
                                    <a href="./room_schedule.php?room_id=${room.rm_id}">
                                        <i class="fas fa-table-cells"></i>
                                    </a>
                                </button> 
                            </td>
                        </tr>
                    `
                });
                roomList.innerHTML = row;
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=SEARCH_ROOM&search_term=${searchTerm}`, true);
    xhttp.send();
}

function handleRoomDelete(roomId){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete room!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteRoomNow('${roomId}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteRoomNow(roomId){
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
    xhttp.send(`action=DELETE_ROOM&room_id=${roomId}`);
}

