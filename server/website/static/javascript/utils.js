// utils.js -- standard utilites
// dlb, Oct 2021

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
    if (selbox == null) {
        console.log("Programming error: Selection box not found. (", selid, ")");
        return;
    }
    var i;
    // Look for an exact match, in either text or values.
    for(i = 0; i < selbox.options.length; i++) {
      var opt = selbox.options[i];
      if (opt.value.toLowerCase() == txt.toLowerCase()) {
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

function set_indicator_color(id, status) {
    elem = document.getElementById(id);
    if (elem == null) {
        console.log("Programming Error. Text Box not found: (", id, ")");
        return "";
    }
    if (status == "okay") elem.style.backgroundColor = '#00ff00'
    else elem.style.backgroundColor = '#ff0000'
}