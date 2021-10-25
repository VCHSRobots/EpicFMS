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

function showchange(elemid) {
    var elem = document.getElementById(elemid);
    elem.style.backgroundColor = '#dd999e';
}

function load_config() {
    var url = "getconfig";
    fetch(url)
        .then(function(response) {
            return response.json();
        })
        .then(function (data) {
            fill_config_elements(data);
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

function fill_config_elements(data) {
    var sel = document.getElementById("sliderunitsel");
    var curindex = sel.value;
    clearSelBox(sel);
    var nsliders = data["sliders"].length;
    var i;
    for(i = 0; i < nsliders; i++) {
        var si = (i+1).toString();
        addselection(sel, si, si, si)
    }
    var okay = setSelectionBox("sliderunitsel", curindex);
    if (!okay) setSelectionBox("sliderunitsel", "1");
    // Fill rest of page here.
}

function sliderunitchange() {
    // Fill rest of page here too.
}