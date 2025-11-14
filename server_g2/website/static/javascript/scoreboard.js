// scoreboard.js -- Script behind the main scoreboard page. 
// dlb, Oct 2021
// Updated for SideQuest, Nov 2025

var last_update = window.performance.now();
var blink_count = 0;


// Loads the score in the main scoreboard -- should be called 
// at least once a second.
function loadScore() {
    fetch("rawscore")
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            fill_score_board(data);
        })
        .catch(function (err) {
            console.log('error: ' + err);
            return
        });
}

// Called on page load of the score board.  Sets up a
// repeating timer that calls load score once per second.
function init_loading() {
    setInterval(loadScore, 1000)
}

function vis_off(element) {
    element.style.visibility = "hidden";
}

function vis_on(element) { 
    element.style.visibility = "visible";
}

function load_grid_data_element(id, value) {
    document.getElementById(id).innerHTML = value;
}

// Fills the entire scoreboard, including turning on and off features.  All
// this is based on the json data prepared by score_manager.py in the server.
function fill_score_board(data) {
    // Should be called about 10 Hz.  Use this knowledge to create blinking effect
    var tnow = window.performance.now();
    var telp = tnow - last_update;
    if (telp > 0.)
    last_update = tnow 
    if (telp)

    var timerstr = data["Timer"];
    // Put up the title and gamemode
    document.getElementById("maintitle").innerHTML = data["Title"];
    document.getElementById("gamemode").innerHTML = data["GameMode"];
    // Put up the timmer stuff
    document.getElementById("timerlabel").innerHTML = data["TimerLabel"];
    document.getElementById("timervalue").innerHTML = data["Timer"];
    // Put up the main score
    document.getElementById("scoreplace").innerHTML = data["Score"].toString();
    // Put up the hits for each target
    document.getElementById("slidervalue1").innerHTML = data["Hits"][0].toString().padStart(3, " ");
    document.getElementById("slidervalue2").innerHTML = data["Hits"][1].toString().padStart(3, " ");
    document.getElementById("slidervalue3").innerHTML = data["Hits"][2].toString().padStart(3, " ");
    document.getElementById("slidervalue4").innerHTML = data["Hits"][3].toString().padStart(3, " ");
    document.getElementById("slidervalue5").innerHTML = data["Hits"][4].toString().padStart(3, " ");
    document.getElementById("slidervalue6").innerHTML = data["Hits"][5].toString().padStart(3, " ");
    // Put up the status of the doors for each target
    document.getElementById("sliderstatus1").innerHTML = data["Doors"][0];
    document.getElementById("sliderstatus2").innerHTML = data["Doors"][1];
    document.getElementById("sliderstatus3").innerHTML = data["Doors"][2];
    document.getElementById("sliderstatus4").innerHTML = data["Doors"][3];
    document.getElementById("sliderstatus5").innerHTML = data["Doors"][4];
    document.getElementById("sliderstatus6").innerHTML = data["Doors"][5];
    // Put up the links
    document.getElementById("linkvalue0").innerHTML = data["Links"][0].toString().padStart(3, " ");
    document.getElementById("linkvalue1").innerHTML = data["Links"][1].toString().padStart(3, " ");
    document.getElementById("linkvalue2").innerHTML = data["Links"][2].toString().padStart(3, " ");
    document.getElementById("linkvalue3").innerHTML = data["Links"][3].toString().padStart(3, " ");
    document.getElementById("linkvalue4").innerHTML = data["Links"][4].toString().padStart(3, " ");
    document.getElementById("linkvalue5").innerHTML = data["Links"][5].toString().padStart(3, " ");
    document.getElementById("linkvalue6").innerHTML = data["Links"][6].toString().padStart(3, " ");
    document.getElementById("linkvalue7").innerHTML = data["Links"][7].toString().padStart(3, " ");
    document.getElementById("linkvalue8").innerHTML = data["Links"][8].toString().padStart(3, " ");
    document.getElementById("linkvalue9").innerHTML = data["Links"][9].toString().padStart(3, " ");
    document.getElementById("linkvalue10").innerHTML = data["Links"][10].toString().padStart(3, " ");
    document.getElementById("linkvalue11").innerHTML = data["Links"][11].toString().padStart(3, " ");
    document.getElementById("linkvalue12").innerHTML = data["Links"][12].toString().padStart(3, " ");
    document.getElementById("linkvalue13").innerHTML = data["Links"][13].toString().padStart(3, " ");
    document.getElementById("linkvalue14").innerHTML = data["Links"][14].toString().padStart(3, " ");
    // Put up the total hits and total links
    document.getElementById("totalhitsvalue").innerHTML = data["TotalHits"].toString().padStart(4, " ");
    document.getElementById("totallinksvalue").innerHTML = data["TotalLinks"].toString().padStart(4, " ");
} 