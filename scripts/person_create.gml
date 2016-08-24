//if (argument0=="") {return noone; exit;}
ab=instance_create(0,0,objSNv_person); ab.sprState=argument7;
ab.image_path=argument0; ab.bnum=argument1; ab.pos=argument2; ab.dist=argument3;
ab.xrev=argument4; ab.yrev=argument5; ab.shDepth=argument6; ab.fadeinmax=global.maxFadein;
if (ab.pos=='custom') {ab.cuposx=cuposx; ab.cuposy=cuposy;}
if (ab.dist=='custom') {ab.dist=cuscdist; ab.cuscale=cuscale;}
if (global.curFade!=global.stanFade) {ab.fadein=global.curFade;
    ab.fadeout=global.curFade;} else {
        if (global.curFadein!=global.stanFade) {ab.fadein=global.curFadein;}
        else if (global.curFadeout!=global.stanFade) {ab.fadeout=global.curFadeout;}
        else {ab.fadein=global.stanFade; ab.fadeout=global.stanFade;}}
if (global.curFade!=global.stanFade) {global.curFade=global.stanFade;}
if (global.curFadeout!=global.stanFade) {global.curFadeout=global.stanFade;}
if (global.curFadein!=global.stanFade) {global.curFadein=global.stanFade;}
if (global.maxFadein!=1) {global.maxFadein=1;}
return ab;
