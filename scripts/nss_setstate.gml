var __inst;
__inst = argument0; with (__inst) {if (other._fadeout <= 0) {if (sprite_exists(image)) {sprite_delete(image);}
        for (i=0;i<acount;i+=1) {if (sprite_exists(aimage[i])) {sprite_delete(aimage[i]);}}}
    else {additionaldrawing=1; adr_imp=imp; adr_alpha=alpha; adr_fadeout=other._fadeout;
        adr_posx=posx; adr_cuposx=cuposx; adr_cuposy=cuposy; adr_cuscale=cuscale;
        adr_xrev=xrev; adr_yrev=yrev; adr_dox=dox; adr_doy=doy;
        adr_tell=1; if (other.nowait || !other._finst) {adr_tell=0;}
        if (imp) {adr_acount=acount; adr_sprState=sprState;
            for (acount_i=0;acount_i<statearrayc;acount_i+=1) {adr_statearray[acount_i]=statearray[acount_i];}
            for (acount_i=0;acount_i<acount;acount_i+=1) {
                adr_interpolation[acount_i] = interpolation[acount_i];
                adr_parallax[acount_i] = parallax[acount_i];
                adr_indxoff[acount_i] = indxoff[acount_i];
                adr_indyoff[acount_i] = indyoff[acount_i];
                adr_sscale[acount_i] = sscale[acount_i];
                adr_aimage[acount_i] = aimage[acount_i];}}
        else {adr_sint=sint; adr_sparallax=sparallax; adr_image=image; adr_itpath=itpath;
            adr_itfname=itfname; adr_sosx=sosx; adr__ofx=_ofx; adr_sosy=sosy; adr__ofy=_ofy;}
        other.waitingForComplete=1;}}

if (_pos!="") {__inst.pos = _pos;} if (_fademax!=-1) {__inst.fadeinmax = _fademax;}
if (_scaleset) {__inst.cuscale = _scale;} if (_xrev!=-2) {__inst.xrev = _xrev;} if (_yrev!=-2) {__inst.yrev = _yrev;}
if (_cuposxset) {__inst.cuposx = _cuposx;} if (_cuposyset) {__inst.cuposy = _cuposy;}
if (_depset || _asimp) {__inst.shDepth=_depth;} else {__inst.shDepth=-100;}
if (_parset) {__inst.sparallax=_parallax;} __inst.sint=_interpolation;
if (_asimp) {__inst.sprState="####look for array"; for (acount_i=0;acount_i<_states;acount_i+=1) {
    __inst.statearray[acount_i]=_state[acount_i];} __inst.statearrayc=_states;}
else {__inst.itpath=_path; __inst.itfname=_image; __inst.originalfname=_originalname;
    if (_sosx) {__inst.sosx=1; __inst._ofx=_osx;} if (_sosy) {__inst.sosy=1; __inst._ofy=_osy;}}
if (_fadein > 0) {__inst.alpha=0; __inst.fd=0;} else {__inst.alpha = __inst.fadeinmax;} __inst.fadein = _fadein;

if (animFname!="") {if (animFname!="stop" && animFname!="clear" && animFname!="none") {
        with (__inst) {isok=animation_storevar_path(other.animPath+other.animFname); if (isok) {animated=1; alarm[1]=1;}}
        if (__inst.isok) {__inst.atelled=0; if (nowait || !_finst) {__inst.atelled=1;}
            if (!__inst.atelled) {if (_fadeout > 0) {__inst.adr_tell=0;}} waitingForComplete=1;}}
    else {with (__inst) {animation_storevar_path("");}}}

with (__inst) {acount=0; person_alarm0(); doalarm=0;} _finst=0;
