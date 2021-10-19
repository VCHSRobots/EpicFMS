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
    document.getElementById("gametab").style.display = "block"
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

function changetab(evt, tabname) {
    var i, tabcontentdivs, tabbuttons;
    // Turn off all divs under the tab bar
    tabcontentdivs = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontentdivs.length; i++) {
        tabcontentdivs[i].style.display = "none";
    }
    // Set all tab buttons to inactive by manipulating the classes they belong to
    tabbuttons = document.getElementsByClassName("tabbutton");
    for (i = 0; i < tabbuttons.length; i++) {
        tabbuttons[i].className = tabbuttons[i].className.replace(" active", "");
    }
    // Turn on the tab button and content div for that button
    document.getElementById(tabname).style.display = "block";
    evt.currentTarget.className += " active";
}

function sendpassword() {
    var text = document.getElementById("passwordbox").value
    var url = "admin?pw=" + text
    fetch(url)
        .then(function (data) { console.log("pw sent to server.")})
        .catch(function (err) { console.log("Unable to send password. Error: " + err)});
}

// Functions for the basket tab
function setmotor(enable) {
    var url = "admin?motor=" + enable
    fetch(url)
        .then(function (data) { console.log("Motor request sent to server.")})
        .catch(function (err) { console.log("Unable to send motor request. Error: " + err)});
}

function setbasketmode() {
    var sel = document.getElementById("basketgamemode");
    var url = "admin?basketmode=" + sel.value 
    fetch(url)
        .then(function (data) { console.log("Basket mode request sent to server.")})
        .catch(function (err) { console.log("Unable to send basket mode request. Error: " + err)});
}
