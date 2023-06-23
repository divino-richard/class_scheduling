const designationList = document.getElementById("designation_list");
const formTitle = document.querySelector(".form_title span");
const formInputs = document.querySelectorAll("form input");
const formSubmit = document.getElementById("form_submit");
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
document.getElementById("add_designation").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleDesignationEdit(data){
    const designationData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Designation";
    formSubmit.innerHTML = `<input type="button" value="Edit Now" onclick="editDesignationNow('${designationData.designation_id}');">`

    formInputs.forEach(input => {
        if(input.name === "designation_title") input.value = designationData.designation_title;
        if(input.name === "deloading") input.value = designationData.deloading;
    })
}
function editDesignationNow(designationId){
    let designationData = {
        "designation_id" : designationId,
        "designation_title": "",
        "deloading": ""
    }

    formInputs.forEach(input => {
        if(input.name === "designation_title") designationData.designation_title = input.value;
        if(input.name === "deloading") designationData.deloading = input.value;
    })

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
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
    xhttp.send(`action=EDIT_DESIGNATION&designation_data=${JSON.stringify(designationData)}`);
}

function searchDesignation(e){
    const searchTerm = e.target.value;

    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.response != ""){
                const designations = JSON.parse(this.responseText);
                let row = '';
                designations.forEach(designation => {
                    row += `
                    <tr>
                        <td>${designation.designation_title}</td>
                        <td>${designation.deloading} units</td>
                        <td>
                            <button class="tb_action_item" onclick="handleDesignationEdit('${JSON.stringify(designation).split('"').join("&quot;")}');" title="edit">
                                <i class="fas fa-pencil"></i>
                            </button>

                            <button class="tb_action_item" title="delete" onclick="handleDesignationDelete('${designation.designation_id}');">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                    `
                });
                designationList.innerHTML = row;
            }
        }
    };
    xhttp.open("GET", `../controllers/ajax_handler.php?action=SEARCH_DESIGNATION&search_term=${searchTerm}`, true);
    xhttp.send();
}

function handleDesignationDelete(designationId){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete designation!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteDesignationNow('${designationId}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteDesignationNow(designationId){
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
    xhttp.send(`action=DELETE_DESIGNATION&designation_id=${designationId}`);
}

