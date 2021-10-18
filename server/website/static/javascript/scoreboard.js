// scoreboard.js -- Script behind the main scoreboard page. 
var last_update = window.performance.now();
var blink_count = 0;


// Loads the score in the main scoreboard -- should be called 
// once a second.
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
    
    // Put up the Team Names...
    document.getElementById("blueteamname").innerHTML = data["Blue"]["TeamName"];
    document.getElementById("redteamname").innerHTML = data["Red"]["TeamName"];
    // Put up the score
    document.getElementById("blueteamscore").innerHTML = data["Blue"]["Score"];
    document.getElementById("redteamscore").innerHTML = data["Red"]["Score"];
    
      // Indicate the error status of the six game elements
    var ediv = document.getElementById("bluebasketerr");
    if (data["Blue"]["GameElement"]["Basket"]) vis_off(ediv); 
    else                                       vis_on(ediv);
    ediv = document.getElementById("bluemovingerr");
    if (data["Blue"]["GameElement"]["Moving"]) vis_off(ediv); 
    else                                       vis_on(ediv);
    ediv = document.getElementById("blueslidingerr");
    if (data["Blue"]["GameElement"]["Sliders"]) vis_off(ediv); 
    else                                        vis_on(ediv); 
    ediv = document.getElementById("redbasketerr");
    if (data["Red"]["GameElement"]["Basket"])   vis_off(ediv); 
    else                                        vis_on(ediv); 
    ediv = document.getElementById("redmovingerr");
    if (data["Red"]["GameElement"]["Moving"])   vis_off(ediv); 
    else                                        vis_on(ediv); 
    ediv = document.getElementById("redslidingerr");
    if (data["Red"]["GameElement"]["Sliders"])  vis_off(ediv); 
    else                                        vis_on(ediv); 

    // Set up Score for Auto Path Finding
    var ecm = document.getElementById("blueautocm");
    var exx = document.getElementById("blueautofail");
    var sc  = document.getElementById("blueautorunscore")
    if (data["Blue"]["AutoScore"]["Checkmark"]) vis_on(ecm);
    else                                        vis_off(ecm);
    if (data["Blue"]["AutoScore"]["XMark"])     vis_on(exx);
    else                                        vis_off(exx);
    if (data["Blue"]["AutoScore"]["ShowScore"]) vis_on(sc);
    else                                        vis_off(sc);
    sc.innerHTML = data["Blue"]["AutoScore"]["Score"] 
    ecm = document.getElementById("redautocm");
    exx = document.getElementById("redautofail");
    sc  = document.getElementById("redautorunscore")
    if (data["Red"]["AutoScore"]["Checkmark"]) vis_on(ecm);
    else                                        vis_off(ecm);
    if (data["Red"]["AutoScore"]["XMark"])     vis_on(exx);
    else                                        vis_off(exx);
    if (data["Red"]["AutoScore"]["ShowScore"]) vis_on(sc);
    else                                        vis_off(sc);
    sc.innerHTML = data["Red"]["AutoScore"]["Score"] 

    // Indicate Field Elements that have errors
    ecm = document.getElementById("bluebasketcm");
    if (data["Blue"]["CheckMarks"]["Basket"])   vis_on(ecm);
    else                                        vis_off(ecm);
    ecm = document.getElementById("bluemovingcm");
    if (data["Blue"]["CheckMarks"]["Moving"])   vis_on(ecm);
    else                                        vis_off(ecm);
    ecm = document.getElementById("bluesliding1cm");
    if (data["Blue"]["CheckMarks"]["Slider1"])  vis_on(ecm);
    else                                        vis_off(ecm);
    ecm = document.getElementById("bluesliding2cm");
    if (data["Blue"]["CheckMarks"]["Slider2"])  vis_on(ecm);
    else                                        vis_off(ecm);
    ecm = document.getElementById("bluesliding3cm");
    if (data["Blue"]["CheckMarks"]["Slider3"])  vis_on(ecm);
    else                                        vis_off(ecm);
    ecm = document.getElementById("redbasketcm");
    if (data["Red"]["CheckMarks"]["Basket"])  vis_on(ecm);
    else                                       vis_off(ecm);
    ecm = document.getElementById("redmovingcm");
    if (data["Red"]["CheckMarks"]["Moving"])  vis_on(ecm);
    else                                       vis_off(ecm);
    ecm = document.getElementById("redsliding1cm");
    if (data["Red"]["CheckMarks"]["Slider1"]) vis_on(ecm);
    else                                       vis_off(ecm);
    ecm = document.getElementById("redsliding2cm");
    if (data["Red"]["CheckMarks"]["Slider2"]) vis_on(ecm);
    else                                       vis_off(ecm);
    ecm = document.getElementById("redsliding3cm");
    if (data["Red"]["CheckMarks"]["Slider3"]) vis_on(ecm);
    else                                       vis_off(ecm);

    // Put up the win-tie-lose banners
    blue_banner = document.getElementById("bluewinframe");
    if (data["Blue"]["ShowWinBanner"] == false) {
        blue_banner.style.borderColor = "#491818";
        blue_banner.style.borderStyle = "solid";
    } else {
        blue_banner.style.borderColor = "white";  
        blue_banner.style.borderStyle = "dotted";
    }
    red_banner = document.getElementById("redwinframe");
    if (data["Red"]["ShowWinBanner"] == false) {
        red_banner.style.borderStyle = "solid";
        red_banner.style.borderColor = "#491818";
    } else {
        red_banner.style.borderStyle = "dotted";
        red_banner.style.borderColor =  "white";   
    }
} 