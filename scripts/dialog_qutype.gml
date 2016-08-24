if (global.diWindow) {with(global.dialog) {
    qutype[argument0]=argument1;
    if (qutype[argument0] && instance_exists(global.dialogBack)) {
        global.dialogBack.tdest=1; global.dialogBack.doupd=0; global.dialogBack=instance_create(x,y,objDialBack);}}}
else {global.dialog.qutype[argument0]=argument1; if (instance_exists(global.dialogBack)) {global.dialogBack.tdest=1;}}
if (global.diWindow!=1) {global.diWindow=1;}
