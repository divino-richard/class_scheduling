const positionList = document.getElementById("position_list");
const formTitle = document.querySelector(".form_title span");
const formSubmit = document.getElementById("form_submit");
const formInputs = document.querySelectorAll("form input");
const formSelect = document.querySelectorAll("form select");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

// MODAL
let modalCon = document.querySelector(".modal_container");
modalCon.addEventListener("click", (event) => {
    if(event.target == modalCon){
        location.reload();
    }
})
document.getElementById("add_position").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handlePositionEdit(data){
    const positionData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Position";
    formSubmit.innerHTML = `<input type="button" value="Edit Now" onclick="editPositionNow('${positionData.position_id}');">`

    // FILL OUT THE BY THE CURRENT DATA
    // For input tag
    formInputs.forEach(input => {
        if(input.name === "position_title") input.value = positionData.position_title;
        if(input.name === "min_load") input.value = positionData.min_load;
        if(input.name === "max_load") input.value = positionData.max_load;
    })
    // For select tag
    formSelect.forEach(select => {
        if(select.name === "status") select.value = positionData.status;
    })
}
function editPositionNow(positionId){
    // INITIALIZE POSITION DATA
    let positionData = {
        "position_id" : positionId,
        "position_title": "",
        "min_load": "",
        "max_load": "",
        "status": ""
    }

    // STORE THE  NEW VALUES TO THE INITIALIZED positionData
    formInputs.forEach(input => {
        if(input.name === "position_title") positionData.position_title = input.value;
        if(input.name === "min_load") positionData.min_load = input.value;
        if(input.name === "max_load") positionData.max_load = input.value;
    })
    formSelect.forEach(select => {
        if(select.name === "status") positionData.status = select.value;
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
    xhttp.send(`action=EDIT_POSITION&position_data=${JSON.stringify(positionData)}`);
}

function searchPosition(e){
    const searchTerm = e.target.value;

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const positions = JSON.parse(this.responseText);
                let row = '';
                positions.forEach(position => {
                    row += `
                    <tr>
                        <td>${position.position_title}</td>
                        <td>${position.min_load} units</td>
                        <td>${position.max_load} units</td>
                        <td>${position.status}</td>
                        <td>
                            <button class="tb_action_item" onclick="handlePositionEdit('${JSON.stringify(position).split('"').join("&quot;")}');" title="edit">
                                <i class="fas fa-pencil"></i>
                            </button>

                            <button class="tb_action_item" title="delete">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                    `
                });
                positionList.innerHTML = row;
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=SEARCH_POSITION&search_term=${searchTerm}`, true);
    xhttp.send();
}

function handleDeletePosition(positionId){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete position!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deletePositionNow('${positionId}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deletePositionNow(positionId){
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
    xhttp.send(`action=DELETE_POSITION&position_id=${positionId}`);
}

