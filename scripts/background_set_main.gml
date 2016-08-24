ab=instance_create(0,0,objSNv_background);
ab.image_path=argument0; ab.bnum=argument1; ab.fadeinmax=global.maxFadein;
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
