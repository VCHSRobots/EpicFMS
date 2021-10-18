// scoreboard.js -- Script behind the main scoreboard page. 
var last_update = window.performance.now();
var blink_count = 0;


// Load status data in the background.
function loadStatusData() {
    fetch("rawstatus")
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            fill_admin_status(data);
        })
        .catch(function (err) {
            console.log('error: ' + err);
            return
        });
}

// Called on page load of the score board.  Sets up a
// repeating timer that calls load score once per second.
function init_loading() {
    setInterval(loadStatusData, 1000)
}

function vis_off(id) {
    e = document.getElementById(id)
    e.style.visibility = "hidden";
}

function vis_on(id) { 
    e = document.getElementById(id)
    e.style.visibility = "visible";
}

function set_value(id, v) {
    document.getElementById(id).innerHTML = v
}

// Called about once per second to fill status info on admin page
function fill_admin_status(data) {
    if (!data["LoggedIn"]) {
        vis_off("mainarea")
        vis_on("loginarea")
        return 
    }
    vis_on("mainarea")
    vis_off("loginarea")
    var nhits = data["Hits"]
    set_value("hitsvalue", nhits)
}

function sendpassword() {
    var text = document.getElementById("passwordbox").value
    var url = "admin?pw=" + text
    fetch(url)
        .then(function (data) { console.log("pw sent to server.")})
        .catch(function (err) { console.log("Unable to send password. Error: " + err)});
}

function setmotor(enable) {
    var url = "admin?motor=" + enable
    fetch(url)
        .then(function (data) { console.log("Motor request sent to server.")})
        .catch(function (err) { console.log("Unable to send motor request. Error: " + err)});
}
