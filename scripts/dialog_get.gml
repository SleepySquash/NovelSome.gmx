if (argument0==-1) {return "";}
if (instance_exists(global.dialog)) {
    if (global.dialog.exists[argument0]) {return global.dialog.dialog[argument0];} else {return "";}} else {return "";}
