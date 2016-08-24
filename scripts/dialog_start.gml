// Create the textbox
//if (instance_exists(global.dialog)) {_lcalpha=1; global.dialog.dest=1;
//    with (global.dialog) {fdelete=1;}} else {_lcalpha=0;}
//global.dialog = instance_create(x,y,objGUI_dialogue);
/*_lcalpha=0; if (instance_exists(global.dialog)) {
    if (!global.dialog.tdest) {_lcalpha=1;
    with (global.dialog) {dreinit_create();}} else {
        global.dialog=instance_create(x,y,objGUI_dialogue);}} else {
            global.dialog=instance_create(x,y,objGUI_dialogue);_lcalpha=0;}*/

_lcalpha=0; _isquest=0; _isfdial1=0; if (instance_exists(global.dialog)) {_isfdial1=global.dialog.fullSize; if (dialclear && _isfdial1) {global.dialog.tdest=1;}
    if (global.dialog.is_question[global.dialog.diag]) {if (global.dialog.qutype[global.dialog.diag]) {_isquest=1;}}
    global.dialog.dest=1; if (isSkip) {global.dialog.opacity=0;} global.dialog=instance_create(x,y,objGUI_dialogue); _lcalpha=1;} else {
        global.dialog=instance_create(x,y,objGUI_dialogue); _lcalpha=0;}
_isfdial=((!_isfdial1 && dialfull) || (_isfdial1 && !dialfull)); if (_lcalpha) {global.dialog.opacity=global.dialog.max_opacity;}
if (global.diWindow) {if (!instance_exists(global.dialogBack)) {global.dialogBack=instance_create(x,y,objDialBack);}
    else {if (!_isquest && !_isfdial) {with (global.dialogBack) {if (!tdest||tdest) {if (dest||tdest) {opacity=max_opacity;} tdest=0; quscanned=0; t=0; dest=0;}
        else {global.dialogBack=instance_create(x,y,objDialBack);}}} else {if (isSkip) {global.dialogBack.opacity=0;}
            global.dialogBack.dest=1; global.dialogBack.doupd=0; global.dialogBack=instance_create(x,y,objDialBack);}}} else {
                if (instance_exists(global.dialogBack)) {if (isSkip) {global.dialogBack.opacity=0;} global.dialogBack.doupd=0; global.dialogBack.tdest=1;}}
if (global.diWindow!=1) {global.diWindow=1;}

// Definne who created the box
global.dialog.creator = id

//global.dialog.choices=0

// If it's true, the player will look at the NPC, and the NPC will do the same
/*if argument0 == true
{
    actor_player.angle = point_direction(actor_player.x,actor_player.y,x,y)
    angle = point_direction(x,y,actor_player.x,actor_player.y)
}
