const sidebar = document.querySelector(".sidebar")
const showSideBar = document.querySelector(".show_sidebar")
const hideSideBar = document.querySelector(".hide_sidebar")

///////////////////////////////////////////////////////////////////////////////////////
/**
 * LOGOUT THE USER IF THERE IS NO INTERACTION WITH IN SPECIFIC SECONDS
 */
// var time = 60000; // Set a timer for 1 min
// var inactivityTimer = setTimeout(logoutUser, time);

// // Reset the timer on user activity
// document.addEventListener("mousemove", resetTimer);
// document.addEventListener("keypress", resetTimer);

// // Function to reset the inactivity timer
// function resetTimer() {
//     clearTimeout(inactivityTimer);
//     inactivityTimer = setTimeout(logoutUser, time);
// }

// // Function to logout the user
// function logoutUser() {
//     // Redirect the user to the logout page
//     window.location.href = "../logout.php";
// }

///////////////////////////////////////////////////////////////////////
showSideBar.addEventListener("click", () => {
    sidebar.style.left = 0;
})

hideSideBar.addEventListener("click", () => {
    sidebar.style.left = "-100%";
})

