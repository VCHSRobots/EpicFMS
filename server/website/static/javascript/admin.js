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
            load_slider_data();
            load_basket_data();
            load_mover_data();
            load_game_config();
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

// Called about once per second to fill status info on admin page
function fill_admin_status(data) {
    if (!data["LoggedIn"]) {
        vis_off("mainarea");
        vis_on("loginarea");
        return;
    }
    vis_on("mainarea");
    vis_off("loginarea");
    var nredhits = data["redhits"];
    var nbluehits = data["bluehits"];
    set_value("redscore", nredhits);
    set_value("bluescore", nbluehits);
    set_value("gamestatusmsg", data["gamestatusmsg"]);
    set_value("gamemodediv", data["gamemode"]);
    set_value("clockdiv", data["clock"]);
    set_indicator_color("mover1indicator", data["mover1"]);
    set_indicator_color("mover2indicator", data["mover2"]);
    set_indicator_color("slider1indicator", data["slider1"]);
    set_indicator_color("slider2indicator", data["slider2"]);
    set_indicator_color("slider3indicator", data["slider3"]);
    set_indicator_color("slider4indicator", data["slider4"]);
    set_indicator_color("slider5indicator", data["slider5"]);
    set_indicator_color("slider6indicator", data["slider6"]);
    set_indicator_color("basket2indicator", data["basket1"]);
    set_indicator_color("basket1indicator", data["basket2"]);
}

function change_tab(evt, tabname) {
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
    load_config();
}

function sendpassword() {
    var text = document.getElementById("passwordbox").value
    var url = "admin?pw=" + text
    fetch(url)
        .then(function () { console.log("pw sent to server.")})
        .catch(function (err) { console.log("Unable to send password. Error: " + err)});
}

function load_config() {
    var url = "getconfig";
    fetch(url)
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            config_data = JSON.parse(JSON.stringify(data))
            fill_config_elements();
        })
        .catch(function (err) {
            console.log('error: ' + err);
            return
        });
}

function load_game_config() {
    if (!game_config_dirty) return;
    var url = "getgameconfig";
    fetch(url)
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            game_config = JSON.parse(JSON.stringify(data))
            fill_game_config_elements();
            game_config_dirty = false;
        })
        .catch(function (err) {
            console.log('error: ' + err);
            return
        });
}

function fill_game_config_elements() {
    if (game_config === null) {
        console.log("game config data is null");
        set_textbox("blueteamname", "", true);
        set_textbox("redteamname", "", true);
        set_checkbox("testscoreboard", false, true);
        return;
    }
    set_textbox("blueteamname", game_config["teamnames"]["blue"], true);
    set_textbox("redteamname", game_config["teamnames"]["red"], true);
    set_checkbox("testscoreboard", game_config["runscoreboardtest"], true);

    var units = ["mover-1", "mover-2", "sider-1", "slider-2", "sider-3", "slider-4",
                 "sider-5", "slider-6", "basket-1", "basket-2"]; 

    if (game_config.hasOwnProperty("unitassignments")) {
        for(const unitname in game_config.unitassignments) {
            var i;
            for(i = 0; i < units.length; i++) {
                if (units[i] == unitname) {
                    var id = "unitselslot" + (i+1);
                    var v = game_config.unitassignments[unitname]
                    setSelectionBox(id, v)
                }
            }
        }
    }
}

function fill_config_elements() {
    fill_slider_config_elements();
    fill_basket_config_elements();
    fill_mover_config_elements();
}

function fill_slider_config_elements() {
    var sel = document.getElementById("sliderunitsel");
    var curindex = sel.value;
    clearSelBox(sel);
    if (config_data === null) {
        console.log("config data is null.")
        // Clear all the page elements
        set_textbox("slidername", "", true);
        set_textbox("sliderip", "", true);
        set_checkbox("sliderenablecb", false, true);
        return;
    }
    var nsliders = config_data["sliders"].length;
    var i;
    for(i = 0; i < nsliders; i++) {
        var si = (i+1).toString();
        addselection(sel, si, si, si)
    }
    var okay = setSelectionBox("sliderunitsel", curindex);
    if (!okay) setSelectionBox("sliderunitsel", "1");
    fill_slider_elements();
}

function fill_basket_config_elements() {
    var sel = document.getElementById("basketunitsel");
    var curindex = sel.value;
    clearSelBox(sel);
    if (config_data === null) {
        console.log("config data is null.")
        set_textbox("basketname", "", true);
        set_textbox("basketip", "", true);
        set_checkbox("basketenablecb", false, true);
        return;
    }
    var nbaskets = config_data["baskets"].length;
    var i;
    for(i = 0; i < nbaskets; i++) {
        var si = (i+1).toString();
        addselection(sel, si, si, si)
    }
    var okay = setSelectionBox("basketunitsel", curindex);
    if (!okay) setSelectionBox("basketunitsel", "1");
    fill_basket_elements();
}

function fill_mover_config_elements() {
    var sel = document.getElementById("moverunitsel");
    var curindex = sel.value;
    clearSelBox(sel);
    if (config_data === null) {
        console.log("config data is null.")
        set_textbox("movername", "", true);
        set_textbox("moverip", "", true);
        set_checkbox("moverenablecb", false, true);
        return;
    }
    var nmovers = config_data["movers"].length;
    var i;
    for(i = 0; i < nmovers; i++) {
        var si = (i+1).toString();
        addselection(sel, si, si, si)
    }
    var okay = setSelectionBox("moverunitsel", curindex);
    if (!okay) setSelectionBox("moverunitsel", "1");
    fill_mover_elements();
}

function get_current_slider_unit_index() {
    var indx = get_selectionbox_value("sliderunitsel");
    indx = indx - 1;
    var nsliders = config_data["sliders"].length;
    if (indx < 0 || indx >= nsliders) {
        console.log("Slider index out of range.");
        return -1;
    }
    return indx;
}

function get_current_basket_unit_index() {
    var indx = get_selectionbox_value("basketunitsel");
    indx = indx - 1;
    var nbaskets = config_data["baskets"].length;
    if (indx < 0 || indx >= nbaskets) {
        console.log("Basket index out of range.");
        return -1;
    }
    return indx;
}

function get_current_mover_unit_index() {
    var indx = get_selectionbox_value("moverunitsel");
    indx = indx - 1;
    var nmovers = config_data["movers"].length;
    if (indx < 0 || indx >= nmovers) {
        console.log("Mover index out of range.");
        return -1;
    }
    return indx;
}

function fill_slider_elements() {
    indx = get_current_slider_unit_index();
    if (indx < 0) {
        // Clear all the page elements
        set_textbox("slidername", "", true);
        set_textbox("sliderip", "", true);
        set_checkbox("sliderenablecb", false, true);
        return;
    }
    set_textbox("slidername", config_data["sliders"][indx]["name"], true);
    set_textbox("sliderip", config_data["sliders"][indx]["ip"], true);
    set_checkbox("sliderenablecb", config_data["sliders"][indx]["enabled"], true);
}

function fill_basket_elements() {
    indx = get_current_basket_unit_index();
    if (indx < 0) {
        // Clear all the page elements
        set_textbox("basketname", "", true);
        set_textbox("basketip", "", true);
        set_checkbox("basketenablecb", false, true);
        return;
    }
    set_textbox("basketname", config_data["baskets"][indx]["name"], true);
    set_textbox("basketip", config_data["baskets"][indx]["ip"], true);
    set_checkbox("basketenablecb", config_data["baskets"][indx]["enabled"], true);
}

function fill_mover_elements() {
    indx = get_current_mover_unit_index();
    if (indx < 0) {
        // Clear all the page elements
        set_textbox("movername", "", true);
        set_textbox("moverip", "", true);
        set_checkbox("moverenablecb", false, true);
        return;
    }
    set_textbox("movername", config_data["movers"][indx]["name"], true);
    set_textbox("moverip", config_data["movers"][indx]["ip"], true);
    set_checkbox("moverenablecb", config_data["movers"][indx]["enabled"], true);
}

function slider_configure() {
    var indx = get_current_slider_unit_index();
    if (indx < 0) return;
    var map = {};
    map["type"] = "sliders";
    map["unit"] = indx;
    map["ip"] = get_textbox_value("sliderip");
    map["name"] = get_textbox_value("slidername");
    map["enabled"] = get_checkbox_value("sliderenablecb");
    var ss = btoa(JSON.stringify(map));
    var url = "admin?config="+ss
    fetch(url)
        .then(function () { console.log("config change sent to server.");})
        .then(function() {load_config();})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function update_teamnames() {
    var map = {};
    var names = {"blue" : get_textbox_value("blueteamname"), "red": get_textbox_value("redteamname")}
    map["teamnames"] = names
    var ss = btoa(JSON.stringify(map));
    var url = "admin?gameconfig="+ss
    fetch(url)
        .then(function () { console.log("Game config change sent to server.");})
        .then(function() {game_config_dirty = true;})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function swap_teamnames() {
    var map = {};
    var names = {"red" : get_textbox_value("blueteamname"), "blue": get_textbox_value("redteamname")} 
    map["teamnames"] = names
    var ss = btoa(JSON.stringify(map));
    var url = "admin?gameconfig="+ss
    fetch(url)
        .then(function () { console.log("Game config change sent to server.");})
        .then(function() {game_config_dirty = true;})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});    
}

function update_scoreboare_test() {
    var cb = document.getElementById("testscoreboard");
    var map = {}
    map["runscoreboardtest"] = cb.checked
    var ss = btoa(JSON.stringify(map));
    var url = "admin?gameconfig="+ss
    fetch(url)
        .then(function () { console.log("Game config change sent to server.")})
        .then(function() {game_config_dirty = true;})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
  }

function unit_side_changed() {
    // Pass for now.
}

function send_game_button(btn) {
    var url = "admin?gamecommand=1&button=" + btn
    fetch(url)
        .then(function () { console.log("Game command sent to server.");})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function update_winner() {
    var wb = document.getElementById("bluewincb").checked;
    var wr = document.getElementById("redwincb").checked;
    var x;
    if (wb && wr) x = "br"
    else if (wb) x = "b"
    else if (wr) x = "r"
    else x = "0"
    var url = "admin?gamecommand=1&winner=" + x
    fetch(url)
        .then(function () { console.log("Game command sent to server.");})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function update_unit_sides() {
    var units = ["mover-1", "mover-2", "sider-1", "slider-2", "sider-3", "slider-4",
                 "sider-5", "slider-6", "basket-1", "basket-2"]; 
    var i;
    unitmap = {};
    for(i = 0; i < units.length; i++) {
        var unitname = units[i];
        var id = "unitselslot" + (i+1)
        unitmap[unitname] = document.getElementById(id).value
    }
    var map = {"unitassignments" : unitmap }
    var ss = btoa(JSON.stringify(map));
    var url = "admin?gameconfig="+ss
    fetch(url)
        .then(function () { console.log("Game config change sent to server.");})
        .then(function() {game_config_dirty = true;})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function basket_configure() {
    var indx = get_current_basket_unit_index();
    if (indx < 0) return;
    var map = {};
    map["type"] = "baskets";
    map["unit"] = indx;
    map["ip"] = get_textbox_value("basketip");
    map["name"] = get_textbox_value("basketname");
    map["enabled"] = get_checkbox_value("basketenablecb");
    var ss = btoa(JSON.stringify(map));
    var url = "admin?config="+ss
    fetch(url)
        .then(function () { console.log("config change sent to server.");})
        .then(function() {load_config();})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function mover_configure() {
    var indx = get_current_mover_unit_index();
    if (indx < 0) return;
    var map = {};
    map["type"] = "movers";
    map["unit"] = indx;
    map["ip"] = get_textbox_value("moverip");
    map["name"] = get_textbox_value("movername");
    map["enabled"] = get_checkbox_value("moverenablecb");
    var ss = btoa(JSON.stringify(map));
    var url = "admin?config="+ss
    fetch(url)
        .then(function () { console.log("config change sent to server.");})
        .then(function() {load_config();})
        .catch(function (err) { console.log("Unable to change config. Error: " + err)});
}

function update_sliderstatus() {
    var num = get_current_slider_unit_index();
    var url = "/unitstatus?unittype=sliders&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function (data) { set_textbox("sliderstatus", data); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function update_basketstatus() {
    var num = get_current_basket_unit_index();
    var url = "/unitstatus?unittype=baskets&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function (data) { set_textbox("basketstatus", data); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function update_moverstatus() {
    var num = get_current_mover_unit_index();
    var url = "/unitstatus?unittype=movers&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function (data) { set_textbox("moverstatus", data); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function load_slider_data() {
    if (!is_tab_vis("slidertab")) return;
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/unitstatus?unittype=sliders&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function(textdata) { fill_slider_tab(textdata); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function load_basket_data() {
    if (!is_tab_vis("baskettab")) return;
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var url = "/unitstatus?unittype=baskets&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function(textdata) { fill_basket_tab(textdata); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function load_mover_data() {
    if (!is_tab_vis("movertab")) return;
    var num = get_current_mover_unit_index();
    if (num < 0) return;
    var url = "/unitstatus?unittype=movers&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function(textdata) { fill_mover_tab(textdata); })
        .catch(function (err) { console.log('error: ' + err); return; })
}

function fill_slider_tab(textdata) {
    set_textbox("sliderstatus", textdata); 
    var data = JSON.parse(textdata);
    var n = data["hits"]
    if (typeof n === 'undefined') set_interhtml("sliderhitboxvalue", 0);
    else                          set_interhtml("sliderhitboxvalue", n);
}

function fill_basket_tab(textdata) {
    set_textbox("basketstatus", textdata); 
    var data = JSON.parse(textdata);
    var n = data["hits"]
    if (typeof n === 'undefined') set_interhtml("baskethitboxvalue", 0);
    else                          set_interhtml("baskethitboxvalue", n);
}

function fill_mover_tab(textdata) {
    set_textbox("moverstatus", textdata); 
    var data = JSON.parse(textdata);
    var n = data["hits"]
    if (typeof n === 'undefined') set_interhtml("moverhitboxvalue", 0);
    else                          set_interhtml("moverhitboxvalue", n);
}

function slider_selftest() {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&selftest=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function basket_selftest() {
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=baskets&unitnum=" + num
    url += "&selftest=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function mover_selftest() {
    var num = get_current_mover_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=movers&unitnum=" + num
    url += "&selftest=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_resethits() {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&resethits=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function mover_resethits() {
    var num = get_current_mover_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=movers&unitnum=" + num
    url += "&resethits=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function basket_resethits() {
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=baskets&unitnum=" + num
    url += "&resethits=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function basket_set_pwm() {
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var run_pwm = get_textbox_value("basketrunpwm");
    var baseurl = "/admin?unittype=baskets&unitnum=" + num
    var url = baseurl + "&runpwm=" + run_pwm
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function basket_save_pwm() {
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=baskets&unitnum=" + num
    url += "&saveconfig=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_set_pwm() {
    var num = get_current_slider_unit_index();
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

function slider_save_pwm() {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&saveconfig=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function move_slider(place) {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    if (place == -1) url = url + "&center=1";
    if (place == 0) url = url + "&close=1";
    if (place== 1) url = url + "&open=1";
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function set_basket_motor(enable) {
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=baskets&unitnum=" + num +"&motor=" + enable
    fetch(url)
        .then(function () { console.log("Motor request sent to server.")})
        .catch(function (err) { console.log("Unable to send motor request. Error: " + err)});
}

function set_basket_mode() {
    var num = get_current_basket_unit_index();
    if (num < 0) return;
    var sel = document.getElementById("basketgamemode");
    var url = "/admin?unittype=baskets&unitnum=" + num + "&gamemode=" + sel.value
    fetch(url)
        .then(function () { console.log("Basket game mode request sent to server.")})
        .catch(function (err) { console.log("Unable to send basket mode request. Error: " + err)});
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

function set_mover_mode() {
    var num = get_current_mover_unit_index();
    if (num < 0) return;
    var sel = document.getElementById("movergamemode");
    var url = "/admin?unittype=movers&unitnum=" + num + "&gamemode=" + sel.value
    fetch(url)
        .then(function () { console.log("Mover game mode request sent to server.")})
        .catch(function (err) { console.log("Unable to send basket mode request. Error: " + err)});
}