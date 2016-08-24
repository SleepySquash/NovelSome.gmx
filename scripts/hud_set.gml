//if (objHUD.hud == argument0 && objHUD.hudPath == argument0) {objHUD.hudHide = 0;}
if (instance_exists(objHUD)) {
objHUD.hudHide=0; objHUD.hud=argument0; objHUD.hudPath=argument0; objHUD.doSmooth=0;
objHUD.novid=novel.novid;}
