// scoreboard.js -- Script behind the main scoreboard page. 
var last_update = window.performance.now();
var blink_count = 0;
var config_data = null;  // Configuration data


// Load status data in the background.
function loadStatusData() {
    fetch("rawstatus")
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            fill_admin_status(data);
            load_slider_data();
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
    var e = document.getElementById(id)
    e.style.visibility = "hidden";
}

function vis_on(id) { 
    var e = document.getElementById(id)
    e.style.visibility = "visible";
}

function is_tab_vis(id) { 
    var e = document.getElementById(id)
    if (e.style.display=="block") return true;
    return false;
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

// Functions for the basket tab
function setmotor(enable) {
    var url = "admin?motor=" + enable
    fetch(url)
        .then(function () { console.log("Motor request sent to server.")})
        .catch(function (err) { console.log("Unable to send motor request. Error: " + err)});
}

function setbasketmode() {
    var sel = document.getElementById("basketgamemode");
    var url = "admin?basketmode=" + sel.value 
    fetch(url)
        .then(function () { console.log("Basket mode request sent to server.")})
        .catch(function (err) { console.log("Unable to send basket mode request. Error: " + err)});
}

function settestcb() {
  var cb = document.getElementById("testscoreboard");
  var url = "admin?scoretestmode="
  if (cb.checked) url += "1";
  else            url += "0";
  fetch(url)
      .then(function () { console.log("Test mode request sent to server.")})
      .catch(function (err) { console.log("Unable to send test mode request. Error: " + err)});
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

function clearSelBox(sel) {
    var n = sel.length;
    var i;
    for (i = 0; i < n; i++) {
        sel.remove(0);
    }
}

function addselection(selbox, txt, lab, val) {
    var option = document.createElement("option");
    option.text = txt;
    option.label = lab;
    option.value = val;
    selbox.add(option);
}

function setSelectionBox(selid, txt) {
    //console.log("in setSelectioBox. Txt=", txt)
    var selbox = document.getElementById(selid);
    var i;
    // Look for an exact match, in either text or values.
    for(i = 0; i < selbox.options.length; i++) {
      var opt = selbox.options[i];
      if (opt.value == txt) {
          selbox.value = opt.value;
          //console.log("setting to (1):", selbox.value)
          return true;
      }
      if (opt.text == txt) {
          selbox.value = opt.value;
          //console.log("setting to (2):", selbox.value)
          return true;
      }
    }
    if (txt == "") {
        // This means that a correct default was not 
        // provided, so the current selection is valid.
        return true
    }
    // Return false if no valid selection was found.
    return false;
}

function setSelectionBox(selid, txt) {
    //console.log("in setSelectioBox. Txt=", txt)
    var selbox = document.getElementById(selid);
    if (selbox == null) {
        console.log("Programming error: Selection box not found. (", selid, ")");
        return;
    }
    var i;
    // Look for an exact match, in either text or values.
    for(i = 0; i < selbox.options.length; i++) {
      var opt = selbox.options[i];
      if (opt.value == txt) {
          selbox.value = opt.value;
          //console.log("setting to (1):", selbox.value)
          return true;
      }
      if (opt.text == txt) {
          selbox.value = opt.value;
          //console.log("setting to (2):", selbox.value)
          return true;
      }
    }
    if (txt == "") {
        // This means that a correct default was not 
        // provided, so the current selection is valid.
        return true
    }
    // Return false if no valid selection was found.
    return false;
}

function make_dirty(elemid) {
    var elem = document.getElementById(elemid);
    elem.style.backgroundColor = '#dd999e';
}

function make_clean(elemid) {
    var elem = document.getElementById(elemid);
    elem.style.backgroundColor = '#ffffff';
}

function set_textbox(id, txt, makeclean) {
    var elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming error. Bad id for text box (", id, ")");
        return;
    }
    elem.value = txt;
    if(makeclean) make_clean(id);
}

function set_interhtml(id, txt) {
    var elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming error. Bad id for text box (", id, ")");
        return;
    }
    elem.innerHTML = txt;
}

function set_checkbox(id, val, makeclean) {
    var elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming error. Bad id for check box (", id, ")");
        return;
    }
    elem.checked = val   
}

function get_selectionbox_value(id) {
    var elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming error. Bad id for selection box (", id, ")");
        return 0;
    }  
    return parseInt(elem.value)  
}

function fill_config_elements() {
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

function get_textbox_value(id) {
    elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming Error. Text Box not found: (", id, ")");
        return "";
    }
    return elem.value;
}

function get_checkbox_value(id) {
    elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming Error. Text Box not found: (", id, ")");
        return "";
    }
    return elem.checked;
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

function update_sliderstatus() {
    var num = get_current_slider_unit_index();
    var url = "/unitstatus?unittype=sliders&unitnum=" + num;
    fetch(url)
        .then(function(response) { return response.text(); })
        .then(function (data) { set_textbox("sliderstatus", data); })
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

function fill_slider_tab(textdata) {
    set_textbox("sliderstatus", textdata); 
    var data = JSON.parse(textdata);
    var n = data["hits"]
    if (typeof n === 'undefined') set_interhtml("sliderhitboxvalue", 0);
    else                          set_interhtml("sliderhitboxvalue", n);
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

function slider_selftest() {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&selftest=1"
    fetch(url)
        .then(function(response) { return})
        .catch(function (err) { console.log('error: ' + err); return; })
}

function slider_resethits() {
    var num = get_current_slider_unit_index();
    if (num < 0) return;
    var url = "/admin?unittype=sliders&unitnum=" + num
    url += "&resethitst=1"
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