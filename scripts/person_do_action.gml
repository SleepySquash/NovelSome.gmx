switch (argument0) {
    case "xrev": if (xrev==1) {xrev=-1;} else {xrev=1;} break;
    case "yrev": if (yrev==1) {yrev=-1;} else {yrev=1;} break;
    case "right": pos=argument0; break;
    case "cright": pos=argument0; break;
    case "center": pos=argument0; break;
    case "cleft": pos=argument0; break;
    case "left": pos=argument0; break;
    case "custompos": pos="custom"; break;
    case "close": sstate=argument0; dist=argument0; break;
    case "normal": sstate=argument0; dist=argument0; break;
    case "far": sstate=argument0; dist=argument0; break;
    case "customscale": dist="custom"; break;
    default: sstate=argument0; break;}

//if (_st=="xrev") {xrev=-1;} else if (_st=="yrev") {yrev=-1;} else if (_st=="close") {sstate=_st; dist=_st;}
//else if (_st=="far") {sstate=_st; dist=_st;} else if (_st=="normal") {sstate=_st; dist=_st;} else if (_st=="right") {pos=_st;} else if (_st=="cright") {pos=_st;}
//else if (_st=="center") {pos=_st;} else if (_st=="cleft") {pos=_st;} else if (_st=="left") {pos=_st;} else {sstate=_st;}
