
const modalCon = document.querySelector(".modal_container");
const formTitle = document.querySelector(".form_title span");
const formSubmit = document.getElementById("form_submit");
const formInputs = document.querySelectorAll("form input");
const formSelect = document.querySelectorAll("form select");
const loader = document.querySelector(".loader_container");

window.addEventListener('load', function() {
    this.setTimeout(() => {loader.style.display = "none"}, [1000])
});

// MODAL
modalCon.addEventListener("click", (event) => {
    if(event.target == modalCon){
        location.reload();
    }
})
document.getElementById("add_signatory").addEventListener("click", () => {
    modalCon.style.display = "flex";
})

function handleSignatoryEdit(data){
    const signatoryData = JSON.parse(data);
    modalCon.style.display = "flex";
    formTitle.innerText = "Edit Signatory";
    formSubmit.innerHTML = `<input type="button" value="Edit Signatory" onclick="editSignatoryNow('${signatoryData.id}');">`

    // FILL OUT THE BY THE CURRENT DATA
    formInputs.forEach(input => {
        if(input.name === "name") input.value = signatoryData.name;
        if(input.name === "degree") input.value = signatoryData.degree;
    })

    // For select tag
    formSelect.forEach(select => {
        if(select.name === "designation") select.value = signatoryData.designation;
    })
}

function editSignatoryNow(id){
    // INITIALIZE POSITION DATA
    let signatoryData = {
        "id" : id,
        "name" : "",
        "degree" : "",
        "designation" : ""
    }

    // STORE THE  NEW VALUES TO THE INITIALIZED positionData
    formInputs.forEach(input => {
        if(input.name === "name") signatoryData.name = input.value;
        if(input.name === "degree") signatoryData.degree = input.value;
    })

    // For select tag
    formSelect.forEach(select => {
        if(select.name === "designation") signatoryData.designation = select.value;
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
    xhttp.send(`action=EDIT_SIGNATORY&signatory_data=${JSON.stringify(signatoryData)}`);
}

function handleSignatoryDelete(id){
    modalCon.style.display = "flex";
    modalCon.innerHTML = `
        <div class="delete_modal">
            <h3>Please confirm to delete signatory!</h3>
            <div class="delete_actions">
                <button id="confirm_delete" onclick="deleteSignatoryNow('${id}')">Delete</button>
                <button id="cancel_delete" onclick="location.reload()">Cancel</button>
            </div>
        </div>
    `
}

function deleteSignatoryNow(id){
    // SEND THE DATA THROUGH AJAX
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
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
    xhttp.send(`action=DELETE_SIGNATORY&id=${id}`);
}




