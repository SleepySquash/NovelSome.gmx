if (!instance_exists(global.dialog)) {exit;} global.dialog.dialwin=argument3; if (isSkip) {global.dialog.opacity=global.dialog.max_opacity;}
global.dialog.fullSize=argument6;
if (argument0) {global.dialog.isdialpos=1; global.dialog.dialposx=argument1; global.dialog.dialposy=argument2;}
if (instance_exists(global.dialogBack)) {global.dialogBack.fullSize=argument6;
    if (isSkip) {global.dialogBack.opacity=global.dialogBack.max_opacity;} if (argument3 && !global.dialForcedBClr) {
    global.dialogBack.diColor=argument4; global.dialogBack.diOutColor=argument5;}}
