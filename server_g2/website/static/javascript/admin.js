// scoreboard.js -- Script behind the main scoreboard page. 
var last_update = window.performance.now();
var blink_count = 0;
var config_data = null;  // Configuration data
var game_config = null   // Game configuration 
var game_config_dirty = true; 

// Load status data in the background.
function loadStatusData() {
    fetch("rawstatus")
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            fill_admin_status(data);
            fill_slider_status(data);
        })
        .catch(function (err) {
            console.log('error: ' + err);
            return
        });
}

// Called on page load of the admin page.  Sets up a
// repeating timer that calls for info once per second.
function init_loading() {
    setInterval(loadStatusData, 1000)
}

// Called about once per second to fill status info on admin page
function fill_admin_status(data) {
    if (!data["LoggedIn"]) {
        vis_off("mainarea");
        vis_on("loginarea");
        return;
    }
    vis_on("mainarea");
    vis_off("loginarea");
    set_value("mainscore", data["mainscore"].toString().padStart(4, ""));
    set_value("gamestatusmsg", data["gamestatusmsg"]);
    set_value("gamemodediv", data["gamemode"]);
    set_value("clockdiv", data["clock"]);
}

function fill_slider_status(data) {
    for (i = 0; i < 6; i++) {
        sliderdata = data["sliders"][i]
        iis = (i + 1).toString()
        document.getElementById("slidernamevalue" + iis).innerHTML = sliderdata["name"];
        document.getElementById("slideripvalue" + iis).innerHTML = sliderdata["ip"];
        document.getElementById("sliderstatusvalue" + iis).innerHTML = sliderdata["status"];
        document.getElementById("sliderhitsvalue" + iis).innerHTML = sliderdata["hits"].toString().padStart(3, " ");
    }
}

function sendpassword() {
    var text = document.getElementById("passwordbox").value
    var url = "admin?pw=" + text
    fetch(url)
        .then(function () { console.log("pw sent to server.")})
        .catch(function (err) { console.log("Unable to send password. Error: " + err)});
}

function send_game_button(btn) {
    sched = document.getElementById("sliderschedule").value
    var url = "admin?gamecommand=1&button=" + btn + "&schedule=" + sched.toString()
    fetch(url)
        .then(function () { console.log("Game command sent to server.");})
        .catch(function (err) { console.log("Unable to send button cmd. Error: " + err)});
}

function update_slider_report(num) {
    var url = "/unitstatus?unittype=sliders&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function (data) { set_textbox("sliderstatus", data); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_report(num) {
    update_slider_report(num - 1);   
}

function slider_selftest(num) {
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&selftest=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_test(num) {
    slider_selftest(num - 1);
}

function slider_resethits(num) {
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&resethits=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_reset(num) {
    slider_resethits(num - 1);
}

function slider_set_pwm(num) {
    if (num < 0) return;
    var open_pwm = get_textbox_value("slideropenpwm");
    var close_pwm = get_textbox_value("sliderclosepwm");
    var baseurl = "/admin?unittype=sliders&unitnum=" + num
    var url1 = baseurl + "&openpwm=" + open_pwm
    var url2 = baseurl + "&closepwm=" + close_pwm
    fetch(url1)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
    fetch(url2)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_save_pwm(num) {
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&saveconfig=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function move_slider(num, place) {
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    if (place == -1) url = url + "&center=1";
    if (place == 0) url = url + "&close=1";
    if (place== 1) url = url + "&open=1";
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_open(num) {
    move_slider(num - 1, 1)
}

function slider_close(num) {
    move_slider(num - 1, 0)
}

function slider_center(num) {
    move_slider(num - 1, -1)
}

function set_slider_mode() {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var sel = document.getElementById("slidergamemode");
    var url = "/admin?unittype=sliders&unitnum=" + num + "&gamemode=" + sel.value
    fetch(url)
        .then(function () { console.log("Slider game mode request sent to server.")})
        .catch(function (err) { console.log("Unable to send basket mode request. Error: " + err)});
}

function blink(unit) {
    var url="/admin?blink=" + unit 
    fetch(url)
        .then(function () { console.log("blink request sent to server.")})
        .catch(function (err) { console.log("Unable to blink request. Error: " + err)});  
}


