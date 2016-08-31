//----------------------------------------------------NOVELSOME SCRIPT----------------------------------------------------//
//----------------------------------------------------NOVELSOME SCRIPT----------------------------------------------------//
//----------------------------------------------------NOVELSOME SCRIPT----------------------------------------------------//
var __asddeb, __var, __strlength, __itwasimage, _storyLoad, _linkdb, _linkdb1, ____youshouldpass, __counttoskip;
//
//Needs to be declared before calling the script:
//o     fstr - current line. Needs to be filled with a command.    o
fstr = argument0;
//o     _doingfrom - simply id of the object.                      o
_doingfrom = argument1;
//o     novid - id of the novel in novel's array.                  o
//o     _file - in case there's a file fstr is coming from.        o
//o     lastline - int that equals 0.                              o
//

//------------------------------------------------------LOGIC HANDLING------------------------------------------------------//
//------------------------------------------------------LOGIC HANDLING------------------------------------------------------//
//------------------------------------------------------LOGIC HANDLING------------------------------------------------------//
if (fstr!="") {while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
if (handleLogic) {___donotcheck=0; if (nss_check("end")) {if (_isSkipping>0) {_isSkipping-=1;}
    if (ds_list_size(ifs)>0) {ds_list_delete(ifs,ds_list_size(ifs)-1);}}
_ifpass=!_isSkipping; if (nss_check("else if ") || nss_check("elseif ")) {if (_isSkipping==1) {if (ds_list_size(ifs)>0) {
    if (nss_checkif(ds_list_find_value(ifs,ds_list_size(ifs)-1),1)) {ds_list_add(ifs,ds_list_size(ifs)); nss_analizeif();
        if (nss_checkif(ds_list_size(ifs),0)) {_ifpass=1; _isSkipping-=1;} ds_list_delete(ifs,ds_list_size(ifs)-1);}}}
    else if (_isSkipping<=0) {_isSkipping+=1;} ___donotcheck=1;}
else if (nss_check("else")) {if (_isSkipping==1) {if (ds_list_size(ifs)>0) {
    if (nss_checkif(ds_list_find_value(ifs,ds_list_size(ifs)-1),1)) {_ifpass=1; _isSkipping-=1;}}}
    else if (_isSkipping<=0) {_isSkipping+=1;} ___donotcheck=1;}
else if (nss_check("if ")) {nss_analizeif(); _ifpass=0; ds_list_add(ifs,ds_list_size(ifs));
    if (_isSkipping>0) {_isSkipping+=1;} else {nss_checkif(ds_list_size(ifs)-1,0); if (!_ifpass) {_isSkipping+=1;}} ___donotcheck=1;}}
else {_ifpass=1; ___donotcheck=0;} if (_ifpass && !___donotcheck) {
if (_doingfrom.object_index == novel || object_index == novel) {
    if (nss_check("choose end")) {if (_chooseSkipping>0) {_chooseSkipping-=1;}}
    else if (nss_check("choose start")) {if (_chooseSkipping>0) {_chooseSkipping+=1;}}
    else if (nss_check("choose ")) {if (_chooseSkipping==0) {_chooseSkipping=1;}}}
else {_chooseSkipping=0;} if (_chooseSkipping<=0) {

//------------------------------------------------------LINK HANDLING------------------------------------------------------//
//------------------------------------------------------LINK HANDLING------------------------------------------------------//
//------------------------------------------------------LINK HANDLING------------------------------------------------------//
__asddeb=0; if (novid!=-1) {if (_doingfrom.object_index == novel || object_index == novel) {
    __asddeb=1; _linkdb=novel.links; _linkdb1=novel.linkstype;} else {_linkdb=novdat.links[novid]; _linkdb1=novdat.linkstype[novid]; rEnd=1;}
_linked=""; __itwasimage=0; if (string_count('=',fstr)>0) {
if (string_copy(fstr,1,string_length("var ")) == "var ") {__var = string_get_tillsymbol(fstr,string_length("var ")+1," "); _linked=__var;
    if (__var!="") {fstr=string_copy(fstr,string_length("var  ")+string_length(__var)+1,string_length(fstr)-(string_length("var  ")+string_length(__var)));
        if (string_copy(fstr,1,1) == "=") {fstr=string_copy(fstr,2,string_length(fstr)-1);}}}
else if (string_copy(fstr,1,string_length("link ")) == "link ") {__var = string_get_tillsymbol(fstr,string_length("link ")+1," "); _linked=__var;
    if (__var!="") {fstr=string_copy(fstr,string_length("link  ")+string_length(__var)+1,string_length(fstr)-(string_length("link  ")+string_length(__var)));
        if (string_copy(fstr,1,1) == "=") {fstr=string_copy(fstr,2,string_length(fstr)-1);}}}
else if (string_copy(fstr,1,string_length("image ")) == "image ") {__var = string_get_tillsymbol(fstr,string_length("image ")+1," "); _linked=__var;
    if (__var!="") {fstr=string_copy(fstr,string_length("image  ")+string_length(__var)+1,string_length(fstr)-(string_length("image  ")+string_length(__var)));
        if (string_copy(fstr,1,1) == "=") {fstr=string_copy(fstr,2,string_length(fstr)-1);} __itwasimage=1;}}}
if (_linked!="") {while (string_copy(_linked,string_length(_linked),1) == " ") {if (string_length(_linked)<=1) {break;} else {_linked = string_copy(_linked,1,string_length(_linked)-1);}}
    while (string_copy(_linked,1,1) == " ") {if (string_length(_linked)<=1) {break;} else {_linked = string_copy(_linked,2,string_length(_linked)-1);}}}}
while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
while (string_copy(fstr,string_length(fstr),1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,1,string_length(fstr)-1);}}
if (__itwasimage) {ds_map_replace(_linkdb,_linked,fstr);} else {

//----------------------------------------------------NOVEL'S BASE INFO----------------------------------------------------//
//----------------------------------------------------NOVEL'S BASE INFO----------------------------------------------------//
//----------------------------------------------------NOVEL'S BASE INFO----------------------------------------------------//
_storyLoad=""; if (_doingfrom.object_index != lang) {_storyLoad="novel's ";}
if (string_copy(fstr,1,string_length(";"))==";") {} else if (string_copy(fstr,1,string_length("//"))=="//") {}
else if (nss_check(_storyLoad+'name:'+global.localisation+" ")) {
    __strlength=string_length(_storyLoad+'name:'+global.localisation+" ");
    _str1 = string_copy(fstr,__strlength+1,string_length(fstr)-__strlength);
    _str1 = string_replace_all(_str1,'"',""); novdat.DName[novid] = _str1;}
else if (nss_check(_storyLoad+'description ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'description ')+1,string_length(fstr)-string_length(_storyLoad+'description '));
    _str1 = string_replace_all(_str1,'"',""); novdat.Description[novid] = _str1;}
else if (nss_check(_storyLoad+'description:'+global.localisation+" ")) {
    __strlength=string_length(_storyLoad+'description:'+global.localisation+" ");
    _str1 = string_copy(fstr,__strlength+1,string_length(fstr)-__strlength);
    _str1 = string_replace_all(_str1,'"',""); novdat.Description[novid] = _str1;}
else if (nss_check(_storyLoad+'author ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'author ')+1,string_length(fstr)-string_length(_storyLoad+'author '));
    _str1 = string_replace_all(_str1,'"',""); novdat.Author[novid] = _str1;}
else if (nss_check(_storyLoad+'creator ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'creator ')+1,string_length(fstr)-string_length(_storyLoad+'creator '));
    _str1 = string_replace_all(_str1,'"',""); novdat.Creator[novid] = _str1;}
else if (nss_check(_storyLoad+'scenario ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'scenario ')+1,string_length(fstr)-string_length(_storyLoad+'scenario '));
    _str1 = string_replace_all(_str1,'"',""); novdat.scenario[novid] = _str1;}
else if (nss_check(_storyLoad+'background ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'background ')+1,string_length(fstr)-string_length(_storyLoad+'background '));
    _str1 = string_replace_all(_str1,'"',""); novdat.Background[novid] = _str1;}
else if (nss_check(_storyLoad+'save count ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'save count ')+1,string_length(fstr)-string_length(_storyLoad+'save count '));
    _str1 = string_replace_all(_str1,'"',""); global.savCount = real(_str1); for (i=1;i<=global.savCount;i+=1) {thspr[i]=noone;}}
else if (nss_check("draw menubackground")) {drawmenubackground = 1;}
else if (nss_check("nomusic")) {playnomusic = 1; music_forced_stop();}
else if (nss_check("nowelcome at all")) {if (room==room_nmenu) {if (instance_exists(objNMenu)) {
        with (objNMenu) {fstate=2; alpha1=1; _backoff=clamp(1+0.15-(0.2*alpha1),1,2); alpha=1; f=2; flowout=1; alCan=1;} global.menuInited=1;}}
    else if (room==room_menu) {if (instance_exists(objMenu)) {with (objMenu) {
        fstate=2; alpha1=1; _backoff=clamp(1+0.15-(0.2*alpha1),1,2); f=2; flowout=1;} global.menuInited=1;}}}
else if (nss_check("nowelcome")) {if (room==room_nmenu) {if (instance_exists(objNMenu)) {
        with (objNMenu) {fstate=2; alpha1=0; _backoff=1; f=2; flowout=1; alCan=1;} global.menuInited=1;}}
    else if (room==room_menu) {if (instance_exists(objMenu)) {with (objMenu) {
        fstate=2; alpha1=0; _backoff=1; f=2; flowout=1;} global.menuInited=1;}}}
else if (nss_check("resolution ")) {
    _str1 = string_get_tillsymbol2(fstr,string_length('resolution ')+1,' ','x'); if (_str1!="") {
        _str2 = string_get_tillsymbol2(fstr,string_length('resolution ')+string_length(_str1)+2,' ','x'); if (_str2!="") {__w=real(_str1); __h=real(_str2);
            if (__w>10 && __h>10) {if (_doingfrom.object_index!=novel) {novdat.wSize_w[novid]=__w; novdat.wSize_h[novid]=__h;} window_set_resolution(__w,__h)}}}}
else if (nss_check(_storyLoad+'custommenu ')) {
    _str1 = string_copy(fstr,string_length(_storyLoad+'customMenu ')+1,string_length(fstr)-string_length(_storyLoad+'customMenu '));
    _str1 = string_replace_all(_str1,'"',""); novdat.CustomMenu[novid] = _str1; novdat.HasMenu[novid]=(novdat.CustomMenu[novid]!="");}
else if (nss_check(_storyLoad+'music ')) {
    _str1 = string_get_tillsymbol(fstr,string_length(_storyLoad+'music ')+2,'"');
    novdat.Music[novid] = _str1; if (string_length(fstr)>(string_length(_storyLoad+'music ')+4+string_length(_str1))) {
        if (string_copy(fstr,string_length(_storyLoad+'music  ')+3+string_length(_str1),5) == "from ") {
            _str2 = string_get_tillsymbol(fstr,string_length(_storyLoad+'music  ')+3+5+string_length(_str1),' ');
            novdat.MusicPreview[novid] = real(_str2);}}}

//----------------------------------------------------BACKGROUNDS----------------------------------------------------//
//----------------------------------------------------BACKGROUNDS----------------------------------------------------//
//----------------------------------------------------BACKGROUNDS----------------------------------------------------//
else if (nss_check("background hide")) {_fdout=-1; _hideall=1; _specback=-1;
    if (string_length(fstr)>string_length("background hide ")+2) {
        ipos = string_length("background hide ")+1; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            if (string_copy(_str2,1,string_length("all")) == "all") {_hideall=1;}
            else if (string_copy(_str2,1,1) == '"') {_str3=string_get_tillsymbol(fstr,ipos+1,'"');
                if (_str3!="") {__v=ds_map_find_value(backgrounds,_str3); if (!is_undefined(__v)) {
                    if (instance_exists(__v)) {_specback=__v; _hideall=0;}}}}
            else if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fdout=1/(_number*30);} else {_fdout=10000;}}
            else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fdout=1/(_number*30);} else {_fdout=10000;}}
            else {if (!nss_afterscript(_str2)) {if (ds_map_exists(_linkdb,_str2)) {__v=ds_map_find_value(_linkdb,_str2);
                if (!is_undefined(__v)) {if (!is_string(__v)) {if (instance_exists(__v)) {_hideall=0; _specback=__v;}}}}}} ipos+=string_length(_str2)+1;}}
    if (_hideall) {if (_specback==-1) {_str2=string_get_tillsymbol(fstr,string_length("background hide ")+1,' ');
        if (_str2!="") {_str2=string_convert_tovar(_str2); if (_str2!="") {__v=ds_map_find_value(backgrounds,_str3);
            if (!is_undefined(__v)) {if (instance_exists(__v)) {_specback=__v; _hideall=0;}}}}}}
    if (_hideall) {fback=!nowait; if (instance_number(objSNv_background)>0) {waitingForComplete=1;}
        for (ii=0;ii<instance_number(objSNv_background);ii+=1) {with (instance_find(objSNv_background,ii)) {if ((other._doingfrom.object_index!=novel) == nogamenolife) {
            if (_linkedas!="") {__v=ds_map_find_value(other._linkdb,_linkedas); if (!is_undefined(__v)) {ds_map_delete(other._linkdb,_linkedas);}
                __v=ds_map_find_value(other._linkdb1,_linkedas); if (!is_undefined(__v)) {ds_map_delete(other._linkdb1,_linkedas);}}
            if (other._fdout!=-1) {fadeout=other._fdout; if (other._fdout==10000) {alpha=0;}} if (other.fback) {tabout=1;} other.fback=0; dest=1; if (other.isSkip) {alpha=0;} if (other.nowait) {tabout=0;}}}}}
    else if (_specback != -1) {if (_fdout!=-1) {_specback.fadeout=_fdout; if (_fdout==10000) {_specback.alpha=0;}} _specback.tabout=1;
        _specback.dest=1; if (isSkip) {_specback.alpha=0;} if (nowait) {_specback.tabout=0;} waitingForComplete=1;
        if (_specback._linkedas!="") {__v=ds_map_find_value(_linkdb,_specback._linkedas); if (!is_undefined(__v)) {ds_map_delete(_linkdb,_specback._linkedas);}
            __v=ds_map_find_value(_linkdb1,_specback._linkedas); if (!is_undefined(__v)) {ds_map_delete(_linkdb1,_specback._linkedas);}}
        __v=ds_map_find_value(backgrounds,_specback.fileNamed); if (!is_undefined(__v)) {ds_map_delete(backgrounds,_specback.fileNamed);}}
    if (_doingfrom.object_index==novel) {_c_showing=0; for (i=0;i<instance_number(objSNv_background);i+=1) {__a=instance_find(objSNv_background,i);
        if (!__a.dest && !__a.nogamenolife) {_c_showing+=1;}} if (_c_showing==0) {global.backgrounddepth=0;}}}
else if ((nss_check("background add ") || nss_check("background ")) && nss_do_command_ingame_only()) {_isadding=nss_check("background add ");
    if (_isadding) {__strfix="background add ";} else {__strfix="background ";} _cuposx=0; _cuposy=0; animPath=""; animFname=""; _depth=0;
    fname=string_copy(fstr,string_length(__strfix)+1,string_length(fstr)-string_length(__strfix));
    if (fname!="") {_fadein=global.stanFade; _fadeout=global.stanFade; _fademax=1; _offsetisx=0; _offsetisy=0; _offsetx=""; _offsety="";
    _parallax=-1; _str1=fname; __dothisbg=""; _spritenumber=1; _spritespeed=0.5;
        __counttoskip=2; if (string_copy(fname,1,1)=='"') {__counttoskip=4;
            _str1=string_get_tillsymbol(fname,2,'"');} else {_str1=string_get_tillsymbol(fname,1,' ');}
        if (_str1!="") {if (string_length(fname)>string_length(_str1)+__counttoskip) {
            ipos = string_length(_str1)+__counttoskip; while (ipos<string_length(fname)) {
                _str2=string_get_tillsymbol2(fname,ipos," ",",");
                if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                    _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                    _number=string_convert_topos(_str3); if (_number!=0) {global.curFade=1/(_number*30);} else {global.curFade=10000;} _fadein=global.curFade; _fadeout=global.curFade;}
                else if (string_copy(_str2,1,string_length("fadein:")) == "fadein:") {
                    _str3=string_copy(_str2,string_length("fadein:")+1,string_length(_str2)-string_length("fadein:"));
                    _number=string_convert_topos(_str3); if (_number!=0) {global.curFadein=1/(_number*30);} else {global.curFadein=10000;} _fadein=global.curFade;}
                else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                    _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:"));
                    _number=string_convert_topos(_str3); if (_number!=0) {global.curFadeout=1/(_number*30);} else {global.curFadeout=10000;} _fadeout=global.curFade;}
                else if (string_copy(_str2,1,string_length("fademax:")) == "fademax:") {
                    _str3=string_copy(_str2,string_length("fademax:")+1,string_length(_str2)-string_length("fademax:"));
                    global.maxFadein=string_convert_topos(_str3); _fademax=global.maxFadein;}
                else if (string_copy(_str2,1,string_length("parallax:")) == "parallax:") {
                    _str3=string_copy(_str2,string_length("parallax:")+1,string_length(_str2)-string_length("parallax:"));
                    _pset=_str3; _parallax=person_guess_parallax();}
                else if (string_copy(_str2,1,string_length("depth:")) == "depth:") {
                    _str3=string_copy(_str2,string_length("depth:")+1,string_length(_str2)-string_length("depth:"));
                    _dset=_str3; _depth=person_guess_depth();}
                else if (string_copy(_str2,1,string_length("number:")) == "number:") {
                    _str3=string_copy(_str2,string_length("number:")+1,string_length(_str2)-string_length("number:"));
                    _spritenumber=string_convert_topos(_str3);}
                else if (string_copy(_str2,1,string_length("offsetx:")) == "offsetx:") {_offsetisx=1;
                    _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:")); _offsetx=(_str3);}
                else if (string_copy(_str2,1,string_length("offsetx:")) == "offsety:") {_offsetisy=1;
                    _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:")); _offsety=(_str3);}
                else if (string_copy(_str2,1,string_length("speed:")) == "speed:") {
                    _str3=string_copy(_str2,string_length("speed:")+1,string_length(_str2)-string_length("speed:"));
                    _spritespeed=string_convert_topos(_str3);}
                else if (string_copy(_str2,1,string_length("alpha:")) == "alpha:") {
                    _str3=string_copy(_str2,string_length("alpha:")+1,string_length(_str2)-string_length("alpha:"));
                    global.maxFadein=string_convert_topos(_str3); _fademax=global.maxFadein;}
                /*else if (string_copy(_str2,1,1) == '"') {_str3=string_get_tillsymbol(fstr,ipos+1,'"');
                    if (_str3!="") {__dothisbg=_str3;}}*/
                else if (string_copy(_str2,1,string_length("x:")) == "x:") {
                    _str3=string_copy(_str2,string_length("x:")+1,string_length(_str2)-string_length("x:")); _cuposx=string_convert_tocupos(_str3);}
                else if (string_copy(_str2,1,string_length("y:")) == "y:") {
                    _str3=string_copy(_str2,string_length("y:")+1,string_length(_str2)-string_length("y:")); _cuposy=string_convert_tocupos(_str3);}
                else if (string_copy(_str2,1,string_length("animation:")) == "animation:") {
                    if (string_copy(_str2,string_length("animation:")+1,1) == '"') {
                        _str3=string_get_tillsymbol(fname,ipos+string_length("animation:")+1,'"');}
                    else {_str3=string_get_tillsymbol(fname,ipos+string_length("animation:"),' ');}
                    if (_str3!="") {_path=""; if (_str3!="stop" && _str3!="clear" && _str3!="none") {
                        _path=novdat.FolName[novid]; if (string_copy(_str3,1,string_length("Stuff/"))=="Stuff/") {_path=_str3;} else if (string_copy(_str3,1,string_length("Stuff\"))=="Stuff\") {_path=_str3;}
                        if (_path!=_str3) {if (!file_exists(current_directory()+_path+_str3)) {if (file_exists(current_directory()+_path+"animation\"+_str3)) {_str3="animation\"+_str3;}
                            else if (file_exists(current_directory()+_path+"animations\"+_str3)) {_str3="animations\"+_str3;}}} else {_path="";}}
                        animPath=_path; animFname=_str3;}} else {nss_afterscript(_str2);}
                ipos+=string_length(_str2)+1;}}}
        if (fname=="black") {_path="Stuff\Sprites\Base\"; fname="black.jpg";
            if (!_isadding) {for (ii=0;ii<instance_number(objSNv_background);ii+=1) {with (instance_find(objSNv_background,ii)) {if ((other._doingfrom.object_index!=novel) == nogamenolife) {dest=1;}}}}
            _person=background_set_main(current_directory()+_path+fname,-1); _person.fileNamed=fname; if (!_isadding) {global.nvBack=_person;}
            else {if (instance_number(objSNv_background)<=1) {global.nvBack=_person;}} _person.fadein=_fadein; _person.initidepth=global.backgrounddepth; global.backgrounddepth-=0.000000001;
            _person.fadeout=_fadeout; _person.fadeinmax=_fademax; if (_linked != "") {ds_map_replace(_linkdb,_linked,_person); ds_map_replace(_linkdb1,_linked,"instance"); _person._linkedas=_linked;}
            _person.imp_offsetisx=_offsetisx; _person.imp_offsetisy=_offsetisy; _person.novid=novid; _person.imp_offsetx=_offsetx; _person.imp_offsety=_offsety;
            _person.cuposx=_cuposx; _person.cuposy=_cuposy; ds_map_replace(backgrounds,"black",_person); _person.backgroundDB="black"; if (_parallax!=-1) {_person.rParallax=_parallax;}
            _nogamenolife=0; if (_doingfrom.object_index!=novel) {_person.nogamenolife=1; _nogamenolife=1; _person.followalpha=_doingfrom;} _person.shDepth=_depth;
            _person.rpath=_path; _person.rfname=fname; if (!_nogamenolife) {if (nowait) {_person.telled=1;} if (isSkip) {_person.alpha=_person.fadeinmax;} waitingForComplete=1;}}
        else {if (string_copy(fname,1,1) != '"') {fname = string_convert_tovar(_str1);} else {fname=_str1;}
        ext=string_lower(filename_ext(fname)); if (filename_ext(fname) == "") {fname+=".jpg";}
        if (ext==".nsback" || ext==".jpg" || ext==".jpeg" || ext==".png" || ext=".gif" || ext=".bmp") {_originalfname=fname;
            _path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;}
            else if (string_copy(fname,1,string_length("Stuff\"))=="Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
            if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"backgrounds\"+fname)) {fname="backgrounds\"+fname;}
                else if (file_exists(current_directory()+_path+"background\"+fname)) {fname="background\"+fname;}}}
            if (!_isadding) {for (ii=0;ii<instance_number(objSNv_background);ii+=1) {with (instance_find(objSNv_background,ii)) {if ((other._doingfrom.object_index!=novel) == nogamenolife) {dest=1;}}}}
            _person=background_set_main(current_directory()+_path+fname,-1); _person.fileNamed=fname; if (!_isadding) {global.nvBack=_person;}
            else {if (instance_number(objSNv_background)<=1) {global.nvBack=_person;}} _nogamenolife=0; if (_doingfrom.object_index!=novel) {_person.nogamenolife=1; _nogamenolife=1; _person.followalpha=_doingfrom;}
            _person.rpath=_path; _person.rfname=fname; _person.novid=novid; if (_parallax!=-1) {_person.rParallax=_parallax;} _person._spritenumber=_spritenumber; _person.stispeed=_spritespeed;
            _person.imp_offsetisx=_offsetisx; _person.imp_offsetisy=_offsetisy; _person.imp_offsetx=_offsetx; _person.imp_offsety=_offsety;
            _person.fadein=_fadein; if (_fadein==10000) {_person.alpha=1;} _person.fadeout=_fadeout; _person.fadeinmax=_fademax; _person.cuposx=_cuposx; _person.cuposy=_cuposy;
            _person.shDepth=_depth; if (_linked != "") {ds_map_replace(_linkdb,_linked,_person); ds_map_replace(_linkdb1,_linked,"instance");
                _person._linkedas=_linked;} ds_map_replace(backgrounds,_originalfname,_person); _person.backgroundDB=_originalfname;
            if (!_nogamenolife) {if (nowait) {_person.telled=1;} if (isSkip) {_person.alpha=_person.fadeinmax;} waitingForComplete=1;} _person.initidepth=global.backgrounddepth; global.backgrounddepth-=0.000000001;
            if (_file!=-1) {fstr=undefined; if (__gettingfromcache) {if (ds_map_exists(linecache,_nss_progress+1)) {fstr=ds_map_find_value(linecache,_nss_progress+1); _nss_progress+=1;}}
                if (is_undefined(fstr)) {file_text_readln(_file); _nss_progress+=1; fstr=file_text_read_string(_file);} noread=1;}
            if (nss_check("with animation")) {/*ANIMATION READING*/} else {
            if (animFname!="") {if (animFname!="stop" && animFname!="clear" && animFname!="none") {
                    cp=1; if (_person.noreanim && string(_path)==_person.cranim) {cp=0; _person.noreanim=0;} if (cp) {with (_person) {
                    isok=animation_storevar_path(other.animPath+other.animFname); if (isok) {animated=1; alarm[1]=1;}}
                    if (!_nogamenolife) {if (_person.isok) {_person.telled=1; if (nowait) {_person.anotell=1;} waitingForComplete=1;}}}}
                else {with (_person) {animation_storevar_path("");}}}} with (_person) {doalarm=0; event_user(0);}}}}}
else if (nss_check("backfade reset")) {global.curFade=global.stanFade; global.curFadein=global.stanFade; global.curFadeout=global.stanFade; global.maxFadein=1;}
else if (nss_check("backfade ")) {imgnum=string_copy(fstr,string_length("backfade ")+1,global.maxDigitCount); if (imgnum!="") {global.curFade=real(imgnum);}
    if (instance_exists(global.nvBack)) {global.nvBack.fadeout=global.curFade; global.nvBack.fadein=global.curFade;}}
else if (nss_check("backfadeout ")) {imgnum=string_copy(fstr,string_length("backfadeout ")+1,global.maxDigitCount); if (imgnum!="") {global.curFadeout=real(imgnum);}
    if (instance_exists(global.nvBack)) {global.nvBack.fadeout=global.curFadeout;}}
else if (nss_check("backfadein ")) {imgnum=string_copy(fstr,string_length("backfadein ")+1,global.maxDigitCount); if (imgnum!="") {global.curFadein=real(imgnum);}
    if (instance_exists(global.nvBack)) {global.nvBack.fadein=global.curFadein;}}
else if (nss_check("backfademax ")) {imgnum=string_copy(fstr,string_length("backfademax ")+1,global.maxDigitCount); if (imgnum!="") {global.maxFadein=real(imgnum);}
    if (instance_exists(global.nvBack)) {global.nvBack.fadeinmax=global.maxFadein;}}

//----------------------------------------------------MUSIC----------------------------------------------------//
//----------------------------------------------------MUSIC----------------------------------------------------//
//----------------------------------------------------MUSIC----------------------------------------------------//
else if (nss_check("music seekfrom ")) {from=string_copy(fstr,string_length("music seekfrom ")+1,string_length(fstr)-string_length("music seekfrom "));
    if (from!="" && string_digits(from)!="") {global.mPrStart=real(from);}}
else if (nss_check("music seek ")) {from=string_copy(fstr,string_length("music seek ")+1,string_length(fstr)-string_length("music seek "));
    if (from!="" && string_digits(from)!="") {music_set_fseek(real(from));}}
else if (nss_check("stop music")) {_mmx=global.mFadeMax; _mfi=global.mFadeIn; _mfo=global.mFadeOut; music_play("");
    global.mFadeMax=_mmx; global.mFadeIn=_mfi; global.mFadeOut=_mfo;}
else if (nss_check("music ") || nss_check("play music ")) {__rsstr="music "; if (nss_check("play music ")) {__rsstr="play music ";}
    fname=string_copy(fstr,string_length(__rsstr)+1,string_length(fstr)-string_length(__rsstr));
    if (string_copy(fname,1,1)!='"') {_path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;}
        else if (string_copy(fname,1,string_length("Stuff\"))==" Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
    if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"music\"+fname)) {fname="music\"+fname;}
        else if (file_exists(current_directory()+_path+"musics\"+fname)) {fname="musics\"+fname;}}}
    if (!file_exists(current_directory()+_path+fname)) {fname=string_get_tillsymbol(fstr,string_length(__rsstr)+1," ");}}
    if (fname!="") {_str1=fname; __counttogo=2; if (string_copy(fname,1,1)=='"') {_str1=string_get_tillsymbol(fname,2,'"'); __counttogo=4;}
    if (_str1!="") {if (string_length(fstr)>string_length(_str1)+__counttogo) {
        ipos = string_length(__rsstr)+string_length(_str1)+__counttogo; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            if (string_copy(_str2,1,string_length("from")) == "from") {
                _str3 = string_get_tillsymbol(fname,ipos+string_length("from ")," "); if (_str3!="") {global.mPrStart=real(_str3);}}
            else if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                global.mFadeIn=real(_str3)*1000; global.mFadeOut=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fadein:")) == "fadein:") {
                _str3=string_copy(_str2,string_length("fadein:")+1,string_length(_str2)-string_length("fadein:")); global.mFadeIn=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:")); global.mFadeOut=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fademax:")) == "fademax:") {
                _str3=string_copy(_str2,string_length("fademax:")+1,string_length(_str2)-string_length("fademax:")); global.mFadeMax=real(_str3);}
            else if (string_copy(_str2,1,string_length("volume:")) == "volume:") {
                _str3=string_copy(_str2,string_length("volume:")+1,string_length(_str2)-string_length("volume:")); global.mFadeMax=real(_str3);}
            else if (string_copy(_str2,1,string_length("max:")) == "max:") {
                _str3=string_copy(_str2,string_length("max:")+1,string_length(_str2)-string_length("max:")); global.mFadeMax=real(_str3);}
            else {/*nss_afterscript(_str2);*/}
            ipos+=string_length(_str2)+1;}}}
    if (fname=="stop") {_mmx=global.mFadeMax; _mfi=global.mFadeIn; _mfo=global.mFadeOut; music_play("");
        global.mFadeMax=_mmx; global.mFadeIn=_mfi; global.mFadeOut=_mfo;} else if (fname=="resume") {music_resume();} else {fname=_str1;
    if (filename_ext(fname) == "") {fname+=".ogg";}
    ext=string_lower(string_copy(fname,string_length(fname)-3,4)); if (ext==".mp3"||ext==".fla"||ext==".wma"||ext==".aac"||ext==".wav") {
        if (global.debug) {with (objGUI_chat) {chat_add_color("Only .ogg files supported (sorry :c)!",c_red);}}}
    else if (ext==".ogg") {_path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;}
        else if (string_copy(fname,1,string_length("Stuff\"))==" Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
        if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"music\"+fname)) {fname="music\"+fname;}
            else if (file_exists(current_directory()+_path+"musics\"+fname)) {fname="musics\"+fname;}}}
        _mmx=global.mFadeMax; _mfi=global.mFadeIn; _mfo=global.mFadeOut; music_play_path(_path+fname);
        global.mFadeMax=_mmx; global.mFadeIn=_mfi; global.mFadeOut=_mfo; if (global.mPrStart!=0) {music_set_seek(global.mPrStart); global.mPrStart=0;}}}}}
else if (nss_check("musicfade reset")) {global.mFadeMax=1; global.mFadeIn=1000; global.mFadeOut=500;}
else if (nss_check("musicfade ")) {imgnum=string_copy(fstr,string_length("musicfade ")+1,global.maxDigitCount); if (imgnum!="") {global.mFadeIn=real(imgnum)*1000; global.mFadeOut=real(imgnum)*1000;}}
else if (nss_check("musicfadeout ")) {imgnum=string_copy(fstr,string_length("musicfadeout ")+1,global.maxDigitCount); if (imgnum!="") {global.mFadeOut=real(imgnum)*1000;}}
else if (nss_check("musicfadein ")) {imgnum=string_copy(fstr,string_length("musicfadein ")+1,global.maxDigitCount); if (imgnum!="") {global.mFadeIn=real(imgnum)*1000;}}
else if (nss_check("musicfademax ")) {imgnum=string_copy(fstr,string_length("musicfademax ")+1,global.maxDigitCount); if (imgnum!="") {global.mFadeMax=real(imgnum)*1000;}}

//----------------------------------------------------SOUND----------------------------------------------------//
//----------------------------------------------------SOUND----------------------------------------------------//
//----------------------------------------------------SOUND----------------------------------------------------//
else if (nss_check("sound ") || nss_check("play sound ")) {__rsstr="sound "; if (nss_check("play sound ")) {__rsstr="play sound ";}
    fname=string_copy(fstr,string_length(__rsstr)+1,string_length(fstr)-string_length(__rsstr));
    if (fname=="stop") {for (i=0;i<instance_number(objEmitter);i+=1) {ab=instance_find(objEmitter,i); if (ab.type=='streamsound') {ab.alarm[1]=1;}}
        } else {fname=string_convert_withpluses(fname); if (filename_ext(fname) == "") {fname+=".nsanim";} ext=string_lower(string_copy(fname,string_length(fname)-3,4));
    if (ext==".mp3"||ext==".fla"||ext==".wma"||ext==".aac"||ext==".wav") {if (global.debug) {with (objGUI_chat) {chat_add_color("Only .ogg files supported!",c_red);}}}
    if (ext==".ogg") {_path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;}
        else if (string_copy(fname,1,string_length("Stuff\"))=="Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
        if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"sounds\"+fname)) {fname="sounds\"+fname;}
            else if (file_exists(current_directory()+_path+"sound\"+fname)) {fname="sound\"+fname;}}}
        sound_stream_sound(current_directory()+_path+fname,_path+fname); _snd.fademax=global.ambFadeMax;}}}

//----------------------------------------------------AMBIENT----------------------------------------------------//
//----------------------------------------------------AMBIENT----------------------------------------------------//
//----------------------------------------------------AMBIENT----------------------------------------------------//
else if (nss_check("ambient all stop")) {_fadeout=-1; if (string_length(fstr)>string_length("ambient all stop")+2) {
        ipos = string_length("ambient all stop")+2; while (ipos<string_length(fname)) {
            _str2=string_get_tillsymbol2(fname,ipos," ",",");
            if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:")); _fadeout=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:")); _fadeout=real(_str3)*1000;}
            else {/*nss_afterscript(_str2);*/} ipos+=string_length(_str2)+1;}}
    for (i=0;i<instance_number(objEmitter);i+=1) {ab=instance_find(objEmitter,i);
        if (ab.type=='streamambient') {if (_fadeout!=-1) {ab.fadeout=_fadeout;} ab.alarm[1]=1;}}}
else if ((nss_check("ambient") || nss_check("play ambient")) && nss_do_command_ingame_only()) {__rsstr="ambient"; if (nss_check("play ambient")) {__rsstr="play ambient";}
    blnum=string_get_tillsymbol(fstr,string_length(__rsstr)+1," "); fname=string_copy(fstr,string_length(__rsstr)+1+string_length(blnum)+1,string_length(fstr)-string_length(__rsstr)-1-string_length(blnum));
    if (string_copy(fname,1,1)!='"') {_path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;}
        else if (string_copy(fname,1,string_length("Stuff\"))==" Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
    if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"ambient\"+fname)) {fname="ambient\"+fname;}
        else if (file_exists(current_directory()+_path+"ambients\"+fname)) {fname="ambients\"+fname;}}}
    if (!file_exists(current_directory()+_path+fname)) {fname=string_get_tillsymbol(fstr,string_length(__rsstr)+1+string_length(blnum)+1," ");}}
    _str1=fname; _startFrom=0; __all=0; _fadein=-1; _fadeout=-1; _fademax=-1; _counttogo=2; if (string_copy(fname,1,1)=='"') {_str1=string_get_tillsymbol(fname,2,'"'); _counttogo=4;}
    if (_str1!="") {if (string_length(fstr)>string_length(_str1)+_counttogo) {
        ipos = string_length(__rsstr)+1+string_length(_str1)+_counttogo; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            if (string_copy(_str2,1,string_length("from")) == "from") {
                _str3 = string_get_tillsymbol(fname,ipos+string_length("from ")," "); if (_str3!="") {_startFrom=real(_str3);}}
            else if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                _fadein=real(_str3)*1000; _fadeout=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fadein:")) == "fadein:") {
                _str3=string_copy(_str2,string_length("fadein:")+1,string_length(_str2)-string_length("fadein:")); _fadein=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:")); _fadeout=real(_str3)*1000;}
            else if (string_copy(_str2,1,string_length("fademax:")) == "fademax:") {
                _str3=string_copy(_str2,string_length("fademax:")+1,string_length(_str2)-string_length("fademax:")); _fademax=real(_str3);}
            else if (string_copy(_str2,1,string_length("volume:")) == "volume:") {
                _str3=string_copy(_str2,string_length("volume:")+1,string_length(_str2)-string_length("volume:")); _fademax=real(_str3);}
            else if (string_copy(_str2,1,string_length("max:")) == "max:") {
                _str3=string_copy(_str2,string_length("max:")+1,string_length(_str2)-string_length("max:")); _fademax=real(_str3);}
            else if (string_copy(_str2,1,string_length("all")) == "all") {__all=1;}
            else {/*nss_afterscript(_str2);*/} ipos+=string_length(_str2)+1;}}}
    if (blnum=="") {for (i=0;i<instance_number(objEmitter);i+=1) {ab=instance_find(objEmitter,i);
        if (ab.type=='streamambient') {if (_fadeout!=-1) {ab.fadeout=_fadeout;} ab.alarm[1]=1;}}}
    else {if (ds_map_exists(ambients,"ambient"+blnum)) {_va = ds_map_find_value(ambients,"ambient"+blnum);
        if (instance_exists(_va)) {if (_fadeout!=-1) {_va.fadeout=_fadeout;} _va.alarm[1]=1;}}}
    if (fname=="stop") {} else {fname=_str1; if (filename_ext(fname) == "") {fname+=".ogg";} ext=string_lower(string_copy(fname,string_length(fname)-3,4));
        if (ext==".mp3"||ext==".fla"||ext==".wma"||ext==".aac"||ext==".wav") {if (global.debug) {with (objGUI_chat) {chat_add_color("Only .ogg files supported!",c_red);}}}
        if (ext==".ogg") {_path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))==" Stuff/") {_path=fname;}
        else if (string_copy(fname,1,string_length("Stuff\"))=="Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
        if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"ambients\"+fname)) {fname="ambients\"+fname;}
            else if (file_exists(current_directory()+_path+"ambient\"+fname)) {fname="ambient\"+fname;}}}
        sound_stream_ambient(current_directory()+_path+fname,_path+fname); _snd._blnum=blnum;
        if (_fadein!=-1) {_snd.fadein=_fadein;} else {_snd.fadein=global.ambFadeIn;}
        if (_fadeout!=-1) {_snd.fadeout=_fadeout;} else {_snd.fadeout=global.ambFadeOut;}
        if (_fademax!=-1) {_snd.fademax=_fademax;} else {_snd.fademax=global.ambFadeMax;}
        if (_startFrom!=0) {_snd.isSeek=1; isSeek.startseek=_startFrom;} if (blnum!="") {ds_map_replace(ambients,"ambient"+blnum,_snd);}}}}
else if (nss_check("ambfade ")) {imgnum=string_copy(fstr,string_length("ambfade ")+1,global.maxDigitCount); if (imgnum!="") {global.ambFadeIn=real(imgnum)*1000; global.ambFadeOut=real(imgnum)*1000;}}
else if (nss_check("ambfadeout ")) {imgnum=string_copy(fstr,string_length("ambfadeout ")+1,global.maxDigitCount); if (imgnum!="") {global.ambFadeOut=real(imgnum)*1000;}}
else if (nss_check("ambfadein ")) {imgnum=string_copy(fstr,string_length("ambfadein ")+1,global.maxDigitCount); if (imgnum!="") {global.ambFadeIn=real(imgnum)*1000;}}
else if (nss_check("ambfademax ")) {imgnum=string_copy(fstr,string_length("ambfademax ")+1,global.maxDigitCount); if (imgnum!="") {global.ambFadeMax=real(imgnum)*1000;}}

//----------------------------------------------------ANIMATION----------------------------------------------------//
//----------------------------------------------------ANIMATION----------------------------------------------------//
//----------------------------------------------------ANIMATION----------------------------------------------------//
else if (nss_check("animation back ") && nss_do_command_ingame_only()) {
    fname=string_copy(fstr,string_length("animation back ")+1,string_length(fstr)-string_length("animation back ")); if (fname!="") {
    _str1=fname; if (string_copy(fname,1,1)=='"') {_str1=string_get_tillsymbol(fname,2,'"');
    if (_str1!="") {if (string_length(fname)>string_length(_str1)+4) {
        ipos = string_length(_str1)+4; while (ipos<string_length(fname)) {
            _str2=string_get_tillsymbol2(fname,ipos," ",","); nss_afterscript(_str2); ipos+=string_length(_str2)+1;}}}} fname=_str1;
    _path=""; if (fname!="stop" && fname!="clear" && fname!="none") {
    _path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;} else if (string_copy(fname,1,string_length("Stuff\"))=="Stuff\") {_path=fname;}
    if (_path!=fname) {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"animation\"+fname)) {fname="animation\"+fname;}
        else if (file_exists(current_directory()+_path+"animations\"+fname)) {fname="animations\"+fname;}}} else {_path="";}}
    if (instance_exists(global.nvBack)) {if (fname!="stop" && fname!="clear" && fname!="none") {
            cp=1; if (global.nvBack.noreanim && string(_path)==global.nvBack.cranim) {cp=0; global.nvBack.noreanim=0;} if (cp) {with (global.nvBack) {
            isok=animation_storevar_path(other._path+other.fname); if (isok) {animated=1; alarm[1]=1;}} if (global.nvBack.isok) {if (nowait) {global.nvBack.anotell=1;} waitingForComplete=1;}}}
        else {with (global.nvBack) {animation_storevar_path("");}}}}
    if (global.debug) {with (objGUI_chat) {chat_add_color("Animation of 'back' was setted to '"+string(other.fname)+"'",c_orange);}}}
else if (nss_check("animation camera ") && nss_do_command_ingame_only()) {if (instance_exists(obj3DCamera)) {_path = string_copy(fstr,string_length("animation camera ")+1,string_length(fstr)-string_length("animation camera "));
    _2path=""; if (string_copy(_path,1,string_length("Stuff\")) != "Stuff\" && string_copy(_path,1,string_length("Stuff\")) != "Stuff/") {_2path = novdat.FolName[novid];}
    if (_2path!="") {if (!file_exists(current_directory()+_2path+_path)) {if (file_exists(current_directory()+_2path+"animation\"+_path)) {_path="animation\"+_path;}
        else if (file_exists(current_directory()+_2path+"animations\"+_path)) {_path="animations\"+_path;}}}
    with (obj3DCamera) {isok=animation_storevar_path(other._2path+other._path); if (isok) {animated=1; alarm[1]=1; if (other.nowait) {anotell=1;}}} if (obj3DCamera.isok) {waitingForComplete=1;}}}
else if (nss_check("animation ") && nss_do_command_ingame_only()) {_name = string_get_tillsymbol(fstr,string_length("animation ")+1," ");
    if (_name!="") {chaid=-1; _chaid=ds_map_find_value(_linkdb,_name); if (is_undefined(_chaid)) {chaid=person_exists(_name);} else {
            if (instance_exists(_chaid)) {if (_chaid.object_index == objSNv_person) {chid=-2; chaid=_chaid.bnum;}}} _imbackobj=-1; _amtoskip=0;
        if (chaid==-1) {ch_name=1; if (string_copy(_name,1,1) != '"') {if (ds_map_exists(_linkdb,_name)) {__v=ds_map_find_value(_linkdb,_name);
                    if (!is_undefined(__v)) {if (ds_map_exists(_linkdb1,_name)) {__v1=ds_map_find_value(_linkdb1,_name); if (!is_undefined(__v1)) {
                        if (__v1 == 'instance') {if (instance_exists(__v)) {if (__v.object_index == objSNv_background) {chaid=0; _imbackobj=__v;}}}}}}}
                if (_imbackobj==-1) {ch_name=0; ch_names=_name; _name = string_convert_tovar(_name); if (ch_names!=_name) {string_replace(fstr,ch_names,_name); _name='"'+_name;}}}
            if (string_copy(_name,1,1) == '"') {if (ch_name) {_name=string_get_tillsymbol(fstr,string_length("animation ")+2,'"');} else {_name=string_copy(_name,2,string_length(_name)-1);}
                for (__bcki=0;__bcki<instance_number(objSNv_background);__bcki+=1) {__bko=instance_find(objSNv_background,__bcki);
                    if (__bko.backgroundDB == _name) {chaid=0; _amtoskip=2*ch_name; _imbackobj=__bko; break;}}}}
        if (chaid!=-1) {_aftername=(string_length("animation  ")+_amtoskip+string_length(_name));
            fname = string_copy(fstr,_aftername+1,string_length(fstr)-_aftername);
        if (fname!="") {_str1=fname; _amtoskip+=2; if (string_copy(fname,1,1)!='"') {
                _str1=string_get_tillsymbol(fname,1,' '); b_str1=_str1; _str1=string_convert_tovar(_str1); if (_str1!=b_str1) {_amtoskip+=(string_length(b_str1)-string_length(_str1));}}
            if (string_copy(fname,1,1)=='"') {_str1=string_get_tillsymbol(fname,2,'"'); _amtoskip+=2;}
            if (_str1!="") {if (string_length(fname)>string_length(_str1)+_amtoskip) {
                ipos = string_length(_str1)+_amtoskip; while (ipos<string_length(fname)) {
                    _str2=string_get_tillsymbol2(fname,ipos," ",",");
                    if (string_copy(_str2,1,string_length("chid:")) == "chid:") {
                        _str3=string_copy(_str2,string_length("chid:")+1,string_length(_str2)-string_length("chid:"));
                        if (_str3=="all") {chid=0;} else {chid=real(_str3);}}
                    else {nss_afterscript(_str2);} ipos+=string_length(_str2)+1;}}} fname=_str1;
            _path=""; if (fname!="stop" && fname!="clear" && fname!="none") {if (filename_ext(fname) == "") {fname+=".nsanim";}
            _path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;} else if (string_copy(fname,1,string_length("Stuff\"))=="Stuff\") {_path=fname;}
            if (_path!=fname) {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"animation\"+fname)) {fname="animation\"+fname;}
                else if (file_exists(current_directory()+_path+"animations\"+fname)) {fname="animations\"+fname;}}} else {_path="";}}
            if (_imbackobj!=-1) {if (fname!="stop" && fname!="clear" && fname!="none") {
                    cp=1; if (_imbackobj.noreanim && string(_path)==_imbackobj.cranim) {cp=0; _imbackobj.noreanim=0;} if (cp) {with (_imbackobj) {
                    isok=animation_storevar_path(other._path+other.fname); if (isok) {animated=1; alarm[1]=1;}} if (_imbackobj.isok) {if (nowait) {_imbackobj.anotell=1;} waitingForComplete=1;}}}
                else {with (_imbackobj) {animation_storevar_path("");}}}
            else {if (chid==-2) {_inst=_chaid; if (instance_exists(_inst)) {
                if (fname!="stop" && fname!="clear" && fname!="none") {
                    with (_inst) {isok=animation_storevar_path(other._path+other.fname);
                    if (isok) {animated=1; alarm[1]=1;}} if (_inst.isok) {if (nowait) {_inst.atelled=1;} waitingForComplete=1;}}
                else {with (_inst) {animation_storevar_path("");}}}}
            else if (chid==-1) {_inst=novdat.charperson[novid,chaid]; if (instance_exists(_inst)) {
                if (fname!="stop" && fname!="clear" && fname!="none") {
                    with (_inst) {isok=animation_storevar_path(other._path+other.fname);
                    if (isok) {animated=1; alarm[1]=1;}} if (_inst.isok) {if (nowait) {_inst.atelled=1;} waitingForComplete=1;}}
                else {with (_inst) {animation_storevar_path("");}}}}
            else if (chid==0) {_finst=1; for (i=0;i<ds_list_size(novdat.charoflist[novid,chaid]);i+=1) {
                _inst=ds_list_find_value(novdat.charoflist[novid,chaid],i);
                if (instance_exists(_inst)) {if (fname!="stop" && fname!="clear" && fname!="none") {
                        with (_inst) {isok=animation_storevar_path(other._path+other.fname); if (isok) {animated=1; alarm[1]=1;}}
                        if (_inst.isok) {if (nowait||!_finst) {_inst.atelled=1;} _finst=0; waitingForComplete=1;}}
                    else {with (_inst) {animation_storevar_path("");}}}}}
            else {crinst=0; for (i=0;i<ds_list_size(novdat.charoflist[novid,chaid]);i+=1) {_inst=ds_list_find_value(novdat.charoflist[novid,chaid],i);
                if (instance_exists(_inst)) {crinst+=1; if (chid==crinst) {if (fname!="stop" && fname!="clear" && fname!="none") {
                        with (_inst) {isok=animation_storevar_path(other._path+other.fname);
                        if (isok) {animated=1; alarm[1]=1;}} if (_inst.isok) {if (nowait) {_inst.atelled=1;} waitingForComplete=1;} break;}
                    else {with (_inst) {animation_storevar_path("");} break;}}}}} chid=-1;}}}}}
else if (nss_check("animation clear back")) {if (instance_exists(global.nvBack)) {global.nvBack.currentAnim="clear";}}
else if (nss_check("animation stop back")) {if (instance_exists(global.nvBack)) {global.nvBack.currentAnim="clear";}}

//----------------------------------------------------HUD----------------------------------------------------//
//----------------------------------------------------HUD----------------------------------------------------//
//----------------------------------------------------HUD----------------------------------------------------//
else if (nss_check("hud ")) {fname=string_copy(fstr,string_length("hud ")+1,string_length(fstr)-string_length("hud ")); __adding=0;
    if (string_lower(string_copy(fname,1,string_length("add "))) == "add ") {__adding=1;
        fname=string_copy(fname,string_length("add ")+1,string_length(fname)-string_length("add ")); fstr=string_replace(fstr,"add ","");}
    _fadein=-1; _fadeout=-1; _dohide=0; _doreset=0; _dovisible=0; _dounvisible=0; _specid=-1; _dowait=1;
    __adpos=1; if (string_copy(fname,1,1) == '"') {fname=string_get_tillsymbol(fstr,string_length("hud ")+2,'"'); __adpos=3;}
    else {_maybe=string_get_tillsymbol(fstr,string_length("hud ")+1,' '); if (_maybe!="") {
        for (ni=0;ni<instance_number(objHUD);ni+=1) {_a=instance_find(objHUD,ni); if (_a._linkedas!="") {if (_a._linkedas == _maybe) {_specid=_a; fname=_maybe; break;}}}
        if (_maybe!=fname) {if (_maybe=="reset" || _maybe=="hide" || _maybe=="visible" || _maybe=="unvisible") {fname=_maybe;}}}}
    if (string_length(fstr)>string_length("hud ")+string_length(fname)+__adpos+1) {
        ipos = string_length("hud ")+string_length(fname)+__adpos+1; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fadein=1/(_number*30);} else {_fadein=10000;} _fadeout=_fadein;}
            else if (string_copy(_str2,1,string_length("fadein:")) == "fadein:") {
                _str3=string_copy(_str2,string_length("fadein:")+1,string_length(_str2)-string_length("fadein:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fadein=1/(_number*30);} else {_fadein=10000;}}
            else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fadeout=1/(_number*30);} else {_fadeout=10000;}}
            else if (string_copy(_str2,1,string_length("hide")) == "hide") {_dohide=1;}
            else if (string_copy(_str2,1,string_length("reset")) == "reset") {_doreset=1;}
            else if (string_copy(_str2,1,string_length("visible")) == "visible") {_dovisible=1;}
            else if (string_copy(_str2,1,string_length("dowait")) == "dowait") {_dowait=1;}
            else if (string_copy(_str2,1,string_length("unvisible")) == "unvisible") {_dounvisible=1;}
            else if (string_copy(_str2,1,1) == '"') {switch (fname) {default: break; case "hide": _dohide=1; break;
                case "reset": _doreet=1; break; case "visible": _dovisible=1; break; case "unvisible": _dounvisible=1; break;}
                fname=string_get_tillsymbol(fstr,ipos+1,'"');}
            else {if (!nss_afterscript(_str2)) {__itsme=-1; for (ni=0;ni<instance_number(objHUD);ni+=1) {_a=instance_find(objHUD,ni);
                    if (_a._linkedas != "") {if (_a._linkedas == _str2) {__itsme=_a; break;}}}
                    if (__itsme!=-1) {_specid=__itsme;}}} ipos+=string_length(_str2)+1;}}
    if ((_doreset || _dohide) && fname!="reset" && fname!="hide") {if (_specid == -1) {
        for (ni=0;ni<instance_number(objHUD);ni+=1) {_a=instance_find(objHUD,ni); if (_a.dbName == fname) {_specid=_a; break;}}}}
    if (fname=="reset" || _doreset) {_first=!nowait && _dowait; if (_specid!=-1) {if (_dowait) {waitingForComplete=1;} _specid.dest=1; if (!_first) {_specid.fadeouttell=0;}
            if (_specid._linkedas != "") {if (ds_map_exists(_linkdb,_specid._linkedas)) {ds_map_delete(_linkdb,_specid._linkedas);}
                if (ds_map_exists(_linkdb1,_specid._linkedas)) {ds_map_delete(_linkdb1,_specid._linkedas);}}
            if (_fadein!=-1) {_specid.fadein=_fadein;} if (_fadeout!=-1) {_specid.fadeout=_fadeout;}}
        else {for (ni=0;ni<instance_number(objHUD);ni+=1) {if (_dowait) {waitingForComplete=1;} with (instance_find(objHUD,ni)) {dest=1; if (!other._first) {fadeouttell=0;}
            if (_linkedas != "") {if (ds_map_exists(other._linkdb,_linkedas)) {ds_map_delete(other._linkdb,_linkedas);}
                if (ds_map_exists(other._linkdb1,_linkedas)) {ds_map_delete(other._linkdb1,_linkedas);}}
            if (other._fadein!=-1) {fadein=other._fadein;} if (other._fadeout!=-1) {fadeout=other._fadeout;} other._first=0;}}}}
    else if (fname=="hide" || _dohide) {_first=!nowait && _dowait; if (_specid!=-1) {if (_dowait) {waitingForComplete=1;} _specid.dest=1; if (!_first) {_specid.fadeouttell=0;}
            if (_specid._linkedas != "") {if (ds_map_exists(_linkdb,_specid._linkedas)) {ds_map_delete(_linkdb,_specid._linkedas);}
                if (ds_map_exists(_linkdb1,_specid._linkedas)) {ds_map_delete(_linkdb1,_specid._linkedas);}}
            if (_fadein!=-1) {_specid.fadein=_fadein;} if (_fadeout!=-1) {_specid.fadeout=_fadeout;}}
        else {for (ni=0;ni<instance_number(objHUD);ni+=1) {if (_dowait) {waitingForComplete=1;} with (instance_find(objHUD,ni)) {dest=1; if (!other._first) {fadeouttell=0;}
            if (other._fadein!=-1) {fadein=other._fadein;} if (other._fadeout!=-1) {fadeout=other._fadeout;} other._first=0;}}}}
    else if (fname=="visible" || _dovisible) {if (_specid!=-1) {_specid.hudHide=0; _specid.fadeintell=0;
            if (_fadein!=-1) {_specid.fadein=_fadein;} if (_fadeout!=-1) {_specid.fadeout=_fadeout;}}
        else {for (ni=0;ni<instance_number(objHUD);ni+=1) {with (instance_find(objHUD,ni)) {hudHide=0; fadeintell=0;
            if (other._fadein!=-1) {fadein=other._fadein;} if (other._fadeout!=-1) {fadeout=other._fadeout;}}}}}
    else if (fname=="unvisible" || _dounvisible) {if (_specid!=-1) {_specid.hudHide=1; _specid.fadeouttell=0;
            if (_fadein!=-1) {_specid.fadein=_fadein;} if (_fadeout!=-1) {_specid.fadeout=_fadeout;}}
        else {for (ni=0;ni<instance_number(objHUD);ni+=1) {with (instance_find(objHUD,ni)) {hudHide=1; fadeouttell=0;
            if (other._fadein!=-1) {fadein=other._fadein;} if (other._fadeout!=-1) {fadeout=other._fadeout;}}}}}
    else {fnameorigin=fname; if (filename_ext(fname) == "") {fname+=".ndraw";}
        _path=novdat.FolName[novid]; if (string_copy(fname,1,string_length("Stuff/"))=="Stuff/") {_path=fname;}
        else if (string_copy(fname,1,string_length("Stuff\"))=="Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
        if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {
            if (file_exists(current_directory()+_path+"hud\"+fname)) {fname="hud\"+fname;}
            else if (file_exists(current_directory()+_path+"huds\"+fname)) {fname="huds\"+fname;}}}
        if (!__adding && _specid==-1) {for (ni=0;ni<instance_number(objHUD);ni+=1) {with (instance_find(objHUD,ni)) {dest=1;}}}
        if (_specid==-1) {_hud=instance_create(0,0,objHUD); _hud.hudHide=0; _hud.hud=_path+fname; if (_dowait) {waitingForComplete=1;} _hud.hudPath=_path+fname;} else {_hud=_specid;}
        _hud.novid=novel.novid; if (_fadein!=-1) {_hud.fadein=_fadein;} if (_fadeout!=-1) {_hud.fadeout=_fadeout;} if (nowait || !_dowait) {_hud.fadeintell=0;}
        _hud.dbName=fnameorigin; if (_linked!="") {ds_map_replace(_linkdb1,_linked,"instance");
            ds_map_replace(_linkdb,_linked,_hud); _hud._linkedas=_linked;}}}
else if (nss_check("s hud ")) {fname=string_copy(fstr,string_length("s hud ")+1,string_length(fstr)-string_length("s hud "));
    if (fname=="reset") {hud_set("");} else if (fname=="hide") {objHUD.hudHide=1; objHUD.doSmooth=1;} else {_path=novdat.FolName[novid]; if (string_copy(fstr,1,string_length("s hud Stuff/"))=="s hud Stuff/") {_path=fname;}
    else if (string_copy(fstr,1,string_length("s hud Stuff\"))=="s hud Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
    if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"hud\"+fname)) {fname="hud\"+fname;}
        else if (file_exists(current_directory()+_path+"huds\"+fname)) {fname="huds\"+fname;}}}
    hud_set_smooth(_path+fname);}}
else if (nss_check("shud ")) {fname=string_copy(fstr,string_length("shud ")+1,string_length(fstr)-string_length("shud "));
    if (fname=="reset") {hud_set("");} else if (fname=="hide") {objHUD.hudHide=1; objHUD.doSmooth=1;} else {_path=novdat.FolName[novid]; if (string_copy(fstr,1,string_length("shud Stuff/"))=="shud Stuff/") {_path=fname;}
    else if (string_copy(fstr,1,string_length("shud Stuff\"))=="shud Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
    if (fname!="") {if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"hud\"+fname)) {fname="hud\"+fname;}
        else if (file_exists(current_directory()+_path+"huds\"+fname)) {fname="huds\"+fname;}}}
    hud_set_smooth(_path+fname);}}

//----------------------------------------------------3D FUNCTIONS----------------------------------------------------//
//----------------------------------------------------3D FUNCTIONS----------------------------------------------------//
//----------------------------------------------------3D FUNCTIONS----------------------------------------------------//
else if (nss_check("3d start") || nss_check("start 3d") || nss_check("d3d start") || nss_check("start d3d")) {
    if (!instance_exists(obj3DCamera)) {__a=instance_create(0,0,obj3DCamera);}}
else if (nss_check("3d end") || nss_check("end 3d") || nss_check("end d3d") || nss_check("d3d end")) {
    if (instance_exists(obj3DCamera)) {with (obj3DCamera) {instance_destroy();}}
    if (instance_exists(objPlayer)) {with (objPlayer) {instance_destroy();}} objScene.path=""; with (objScene) {scene_load();}}
else if (nss_check("3d hide") || nss_check("d3d hide")) {global.is3DHide = 1;}
else if (nss_check("3d show") || nss_check("d3d show")) {global.is3DHide = 0;}
else if (nss_check("scene ")) {fname=string_convert_withpluses(string_copy(fstr,string_length("scene ")+1,string_length(fstr)-string_length("scene ")));
    if (fname=="reset") {scene_set("");} /*else if (fname=="hide") {objHUD.hudHide=1; objHUD.doSmooth=1;}*/ else {
    _path=novdat.FolName[novid]; if (string_copy(fstr,1,string_length("scene Stuff/"))=="scene Stuff/") {_path=fname;}
    else if (string_copy(fstr,1,string_length("scene Stuff\"))=="scene Stuff\") {_path=fname;} if (_path!=novdat.FolName[novid]) {fname="";}
    if (fname!="") {if (filename_ext(fname) == "") {fname+=".nscen";}
        if (!file_exists(current_directory()+_path+fname)) {if (file_exists(current_directory()+_path+"scene\"+fname)) {fname="scene\"+fname;}
        else if (file_exists(current_directory()+_path+"scenes\"+fname)) {fname="scenes\"+fname;}
        else {__fname=filename_remove_ext(filename_name(fname));
            if (file_exists(current_directory()+_path+"scenes\"+__fname+"\"+fname)) {fname="scenes\"+__fname+"\"+fname;}
            else if (file_exists(current_directory()+_path+"scene\"+__fname+"\"+fname)) {fname="scene\"+__fname+"\"+fname;}
            if (file_exists(current_directory()+_path+__fname+"\"+fname)) {fname=__fname+"\"+fname;}}}} scene_set(_path+fname);}}
else if (nss_check("camera pos ")) {imgnum1=string_get_tillsymbol(fstr,string_length("camera pos ")+1," ");
    if (imgnum1!="") {imgnum2=string_get_tillsymbol(fstr,string_length("camera pos  ")+string_length(imgnum1)+1," "); if (imgnum2!="") {
        imgnum3=string_get_tillsymbol(fstr,string_length("camera pos   ")+string_length(imgnum1)+string_length(imgnum2)+1," "); if (imgnum3!="") {
            if (instance_exists(obj3DCamera)) {obj3DCamera.x = string_convert_topos(imgnum1); obj3DCamera.y = string_convert_topos(imgnum2); obj3DCamera.z = string_convert_topos(imgnum3);}}}
        else {if (ds_map_exists(objScene.objects,imgnum1)) {_obj = ds_map_find_value(objScene.objects,imgnum1);
            if (instance_exists(obj3DCamera)) {obj3DCamera.x = _obj.x; obj3DCamera.y = _obj.y; obj3DCamera.z = _obj.z;}}}}}
else if (nss_check("player pos ")) {imgnum1=string_get_tillsymbol(fstr,string_length("player pos ")+1," ");
    if (imgnum1!="") {imgnum2=string_get_tillsymbol(fstr,string_length("player pos  ")+string_length(imgnum1)+1," "); if (imgnum2!="") {
        imgnum3=string_get_tillsymbol(fstr,string_length("player pos   ")+string_length(imgnum1)+string_length(imgnum2)+1," "); if (imgnum3!="") {
            if (instance_exists(objPlayer)) {objPlayer.x = string_convert_topos(imgnum1); objPlayer.y = string_convert_topos(imgnum2); objPlayer.z = string_convert_topos(imgnum3);}}
        } else {if (ds_map_exists(objScene.objects,imgnum1)) {_obj = ds_map_find_value(objScene.objects,imgnum1);
            if (instance_exists(objPlayer)) {objPlayer.x = _obj.x; objPlayer.y = _obj.y; objPlayer.z = _obj.z;}}}}}
else if (nss_check("spawn player")) {imgnum1=string_get_tillsymbol(fstr,string_length("player spawn ")+1," "); imgnum2=""; imgnum3="";
    if (imgnum1!="") {imgnum2=string_get_tillsymbol(fstr,string_length("player spawn  ")+string_length(imgnum1)+1," "); if (imgnum2!="") {
        imgnum3=string_get_tillsymbol(fstr,string_length("player spawn   ")+string_length(imgnum1)+string_length(imgnum2)+1," ");}}
        if (!instance_exists(objPlayer)) {instance_create(0,0,objPlayer);} if (imgnum1!="") {objPlayer.x = string_convert_topos(imgnum1);}
        if (imgnum2!="") {objPlayer.y = string_convert_topos(imgnum2);} if (imgnum3!="") {objPlayer.z = string_convert_topos(imgnum3);}}
else if (nss_check("camera lookat ")) {imgnum=string_get_tillsymbol(fstr,string_length("camera lookat ")+1," ");
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {if (ds_map_exists(objScene.objects,imgnum)) {if (instance_exists(obj3DCamera.follow)) {if (obj3DCamera.follow.object_index!=objPlayer) {obj3DCamera.follow=noone;}}
        camera_lookat(ds_map_find_value(objScene.objects,imgnum));} else {if (imgnum=="point") {imgnum1=string_get_tillsymbol(fstr,string_length('camera lookat point ')+1," ");
            if (imgnum1!="") {imgnum2=string_get_tillsymbol(fstr,string_length('camera lookat point  ')+string_length(imgnum1)+1," ");
                if (imgnum2!="") {imgnum3=string_get_tillsymbol(fstr,string_length('camera lookat point   ')+string_length(imgnum1)+string_length(imgnum2)+1," ");
                    if (imgnum3!="") {if (instance_exists(obj3DCamera.follow)) {if (obj3DCamera.follow.object_index!=objPlayer) {obj3DCamera.follow=noone;}}
                        _point = instance_create(string_convert_topos(imgnum1),string_convert_topos(imgnum2),obj3DPoint); _point.z=string_convert_topos(imgnum3); camera_lookat(_point);}}}}}}}}
else if (nss_check("camera mode ")) {imgnum=string_copy(fstr,string_length("camera mode ")+1,string_length(fstr)-string_length("camera mode "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.moveMouse = real(imgnum); if (instance_exists(objPlayer)) {if (instance_exists(obj3DCamera.follow)) {
        if (obj3DCamera.follow.object_index == objPlayer) {if (obj3DCamera.moveMouse != 0) {obj3DCamera.follow = noone;}}}
        if (obj3DCamera.moveMouse == 0) {obj3DCamera.follow = objPlayer; obj3DCamera.viewLimx1=0; obj3DCamera.viewLimx2=0; obj3DCamera.viewLimz=89;}}}}}
else if (nss_check("camera linkto ")) {imgnum=string_copy(fstr,string_length("camera linkto ")+1,string_length(fstr)-string_length("camera linkto ")); imgnum_=0;
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.moveMouse = real(imgnum_); if (instance_exists(objPlayer)) {if (instance_exists(obj3DCamera.follow)) {
        if (obj3DCamera.follow.object_index == objPlayer) {if (obj3DCamera.moveMouse != 0) {obj3DCamera.follow = noone;}}}
        if (obj3DCamera.moveMouse == 0) {if (imgnum == "player") {obj3DCamera.follow = objPlayer; obj3DCamera.viewLimx1=0; obj3DCamera.viewLimx2=0; obj3DCamera.viewLimz=89;}
            else {_towho = ds_map_find_value(objScene.objects,imgnum); if (!is_undefined(_towho)) {if (instance_exists(_towho)) {obj3DCamera.follow = _towho;}}}}}}}}
else if (nss_check("camera canview ")) {imgnum=string_copy(fstr,string_length("camera canview ")+1,string_length(fstr)-string_length("camera canview "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.canView = real(imgnum);}}}
else if (nss_check("camera zheight ")) {imgnum=string_copy(fstr,string_length("camera zheight ")+1,string_length(fstr)-string_length("camera zheight "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera._zheight = real(imgnum); obj3DCamera.zheight = obj3DCamera._zheight;}}}
else if (nss_check("player canmove ")) {imgnum=string_copy(fstr,string_length("player canmove ")+1,string_length(fstr)-string_length("player canmove "));
    if (imgnum!="") {if (instance_exists(objPlayer)) {objPlayer.canMove = real(imgnum);}}}
else if (nss_check("camera canmove ")) {imgnum=string_copy(fstr,string_length("player canmove ")+1,string_length(fstr)-string_length("player canmove "));
    if (imgnum!="") {if (instance_exists(objPlayer)) {objPlayer.canMove = real(imgnum);}}}
else if (nss_check("camera angle ")) {imgnum=string_copy(fstr,string_length("camera angle ")+1,string_length(fstr)-string_length("camera angle "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.cameraangle = real(imgnum);}}}
else if (nss_check("camera fov ")) {imgnum=string_copy(fstr,string_length("camera fov ")+1,string_length(fstr)-string_length("camera fov "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.FOV = real(imgnum);}}}
else if (nss_check("camera limitx ")) {imgnum=string_copy(fstr,string_length("camera limitx ")+1,string_length(fstr)-string_length("camera limitx "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.viewLimx1 = obj3DCamera.direction+real(imgnum); if (obj3DCamera.viewLimx1>360) {obj3DCamera.viewLimx1 = obj3DCamera.direction+real(imgnum)-360;}
        obj3DCamera.viewLimx2 = obj3DCamera.direction-real(imgnum); if (obj3DCamera.viewLimx2<0) {obj3DCamera.viewLimx2 = abs(obj3DCamera.direction-real(imgnum));}}}}
else if (nss_check("camera limity ")) {imgnum=string_copy(fstr,string_length("camera limitx ")+1,string_length(fstr)-string_length("camera limitx "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.viewLimz = real(imgnum);}}}
else if (nss_check("camera limitz ")) {imgnum=string_copy(fstr,string_length("camera limitx ")+1,string_length(fstr)-string_length("camera limitx "));
    if (imgnum!="") {if (instance_exists(obj3DCamera)) {obj3DCamera.viewLimz = real(imgnum);}}}
else if (nss_check("object ")) {imgnum=string_get_tillsymbol(fstr,string_length("object ")+1," ");
    if (imgnum!="") {__obj = ds_map_find_value(objScene.objects,imgnum); if (!is_undefined(imgnum)) {func=string_get_tillsymbol(fstr,string_length("object  ")+string_length(imgnum)+1," ");
        if (func == "setstate") {_to=string_get_tillsymbol(fstr,string_length("object   ")+string_length(imgnum)+string_length(func)+1," "); ds_map_replace(objScene.states,imgnum,_to);
            for (_i=0;_i<__obj.acount;_i+=1) {if (sprite_exists(__obj.aimage[_i])) {sprite_delete(__obj.aimage[_i]);}} __obj.acount=0; __obj.sprState=_to; with (__obj) {person_alarm0();}}}}}

//----------------------------------------------------DIALOGUE BOX CUSTOMIZATION----------------------------------------------------//
//----------------------------------------------------DIALOGUE BOX CUSTOMIZATION----------------------------------------------------//
//----------------------------------------------------DIALOGUE BOX CUSTOMIZATION----------------------------------------------------//
else if (string_copy(fstr,1,string_length("dialogue center"))=="dialogue center") {isdialpos=1; dialposx=view_wview/2; dialposy=view_hview/2;}
else if (string_copy(fstr,1,string_length("dialogue pos "))=="dialogue pos ") {_xp=string_get_ssnumber(fstr,string_length("dialogue pos ")+1);
    if (_xp!="") {isdialpos=1; dialposx=real(_xp); _yp=string_get_ssnumber(fstr,string_length("dialogue pos  ")+string_length(_xp)+1); if (_yp!="") {dialposy=real(_yp);}}}
else if (string_copy(fstr,1,string_length("dialogue normal"))=="dialogue normal") {isdialpos=0;}
else if (string_copy(fstr,1,string_length("dialogue show"))=="dialogue show") {if (instance_exists(global.dialog)) {global.dialog.dShowed=1; global.dialog.canPress=1;} if (instance_exists(global.dialogBack)) {global.dialogBack.dShowed=1;}}
else if (string_copy(fstr,1,string_length("dialogue hide"))=="dialogue hide") {if (instance_exists(global.dialog)) {global.dialog.dShowed=0; global.dialog.canPress=0;} if (instance_exists(global.dialogBack)) {global.dialogBack.dShowed=0;}}
else if (string_copy(fstr,1,string_length("dialogue text dofadeout"))=="dialogue text dofadeout") {dialtnfot=0;}
else if (string_copy(fstr,1,string_length("dialogue text nofadeout"))=="dialogue text nofadeout") {dialtnfot=1;}
else if (string_copy(fstr,1,string_length("dialogue box noclear"))=="dialogue box noclear") {dialclear=0;}
else if (string_copy(fstr,1,string_length("dialogue box doclear"))=="dialogue box doclear") {dialclear=1;}
else if (string_copy(fstr,1,string_length("dialogue box clear"))=="dialogue box clear") {if (instance_exists(global.dialogBack)) {global.dialogBack.dest=1;} if (instance_exists(global.dialog)) {global.dialog.dest=1;}}
else if (string_copy(fstr,1,string_length("dialogue nobox"))=="dialogue nobox") {dialfull=0; dialclear=1; dlt=0;
    if (instance_exists(global.dialog)) {if (global.dialog.fullSize) {global.dialog.dest=1; dlt=1;}}
    if (dlt) {if (instance_exists(global.dialogBack)) {global.dialogBack.dest=1;}}}
else if (string_copy(fstr,1,string_length("dialogue box"))=="dialogue box") {dialfull=1; dialclear=1;}
else if (string_copy(fstr,1,string_length("dialogue nowin"))=="dialogue nowin") {dialwin=0;}
else if (string_copy(fstr,1,string_length("dialogue win"))=="dialogue win") {dialwin=1;}
else if (string_copy(fstr,1,string_length("rgb color "))=="rgb color ") {_iclr1=string_get_snumber(fstr,string_length("rgb color ")+1); if (_iclr1!="") {dialclrr=real(_iclr1);
    _iclr2=string_get_snumber(fstr,string_length("rgb color  ")+1+string_length(_iclr1)); if (_iclr2!="") {dialclrg=real(_iclr2);
        _iclr3=string_get_snumber(fstr,string_length("rgb color   ")+1+string_length(_iclr1)+string_length(_iclr2)); if (_iclr3!="") {dialclrb=real(_iclr3);}}}}
else if (string_copy(fstr,1,string_length("dialogue reset"))=="dialogue reset") {dialwin=1; isdialpos=0; dialcolor=global.dialBackClr; dialoutcl=global.dialBackOutclr;}
else if (string_copy(fstr,1,string_length("dialogue color"))=="dialogue color") {_clr=string_copy(fstr,string_length("dialogue color ")+1,string_length(fstr)-string_length("dialogue color "));
    if (_clr!="") {if (_clr=='rgb') {dialcolor=make_colour_rgb(dialclrr,dialclrg,dialclrb);} else {dialcolor=convertToColor(_clr);} dialoutcl=dialcolor;}}
else if (string_copy(fstr,1,string_length("dialogue bordercolor"))=="dialogue bordercolor") {_clr=string_copy(fstr,string_length("dialogue bordercolor ")+1,string_length(fstr)-string_length("dialogue bordercolor "));
    if (_clr!="") {if (_clr=='rgb') {dialoutcl=make_colour_rgb(dialclrr,dialclrg,dialclrb);} else {dialoutcl=convertToColor(_clr);}}}

//----------------------------------------------------SKIN----------------------------------------------------//
//----------------------------------------------------SKIN----------------------------------------------------//
//----------------------------------------------------SKIN----------------------------------------------------//
else if (string_copy(fstr,1,string_length('skin '))=='skin ') {settingSkinIngame=1; if (!global.ignoreNovelSkin) {imgnum = string_copy(fstr,string_length('skin ')+1,string_length(fstr)-string_length('skin '));
    if (imgnum!="") {if (imgnum == "reset" || imgnum == "default") {if (global.skinChanged) {skin_deapply(); with (skindat) {novid=other.novid; skin_apply();}
        for (i=0;i<instance_number(objGUI_dialogue);i+=1) {__dialog = instance_find(objGUI_dialogue,i); if (!__dialog.tdest) {with (__dialog) {objGUI_dialogue_create();}}}
        for (i=0;i<instance_number(objDialBack);i+=1) {__dialog = instance_find(objDialBack,i); if (!__dialog.tdest) {with (__dialog) {objDialBack_create();}}}}} else {
        imgnum=string_replace_all(imgnum,'"',""); _path="";
        if (string_copy(imgnum,1,string_length("Stuff/")) == "Stuff/" || string_copy(imgnum,1,string_length("Stuff/")) == "Stuff\") {
            _path = imgnum; global.skChanged_isFN=0;} else {global.skChanged_isFN=1;
            if (!file_exists(current_directory()+novdat.FolName[novid]+imgnum)) {
                if (file_exists(current_directory()+novdat.FolName[novid]+imgnum)) {imgnum="skin\"+imgnum;}
                else if (file_exists(current_directory()+novdat.FolName[novid]+imgnum)) {imgnum="skins\"+imgnum;}}
            _path = novdat.FolName[novid]+imgnum;} global.skChanged_path=imgnum;
        skin_deapply(); with (skindat) {novid=other.novid; skin_apply_path(current_directory()+other._path,filename_path(other._path));} global.skinChanged=1;
        for (i=0;i<instance_number(objGUI_dialogue);i+=1) {__dialog = instance_find(objGUI_dialogue,i); if (!__dialog.tdest) {with (__dialog) {objGUI_dialogue_create();}}}
        for (i=0;i<instance_number(objDialBack);i+=1) {__dialog = instance_find(objDialBack,i); if (!__dialog.tdest) {with (__dialog) {objDialBack_create();}}}}}} settingSkinIngame=0;}
else if ((nss_check("font ") && _linked!="") || nss_check("new font ")) {__keyword="font "; if (nss_check("new font ")) {__keyword="new font ";}
    _chid = string_get_tillsymbol(fstr,string_length(__keyword)+1," "); if (_chid!="") {
        __size=12; __bold=0; __italic=0; __first=0; __last=0; if (string_length(fstr)>string_length(__keyword)+1+string_length(_chid)+1) {
            ipos=string_length(__keyword)+1+string_length(_chid)+1; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            if (string_copy(_str2,1,string_length("size:")) == "size:") {
                _size = string_copy(_str2,string_length("size:")+1,string_length(_str2)-string_length("size:")); if (_size!="") {__size=real(_size);}}
            else if (string_copy(_str2,1,string_length("size")) == "size") {
                _size = string_get_tillsymbol(fstr,ipos+string_length("size")+1,' '); if (_size!="") {__size=real(_size);}}
            else if (string_copy(_str2,1,string_length("bold")) == "bold") {__bold=1;}
            else if (string_copy(_str2,1,string_length("italic")) == "italic") {__italic=1;}
            else if (string_copy(_str2,1,string_length("first:")) == "first:") {
                __first = real(string_copy(_str2,string_length("first:")+1,string_length(_str2)-string_length("first:")));}
            else if (string_copy(_str2,1,string_length("last:")) == "last:") {
                __last = real(string_copy(_str2,string_length("last:")+1,string_length(_str2)-string_length("last:")));}
            ipos+=string_length(_str2)+1;}} _chid=string_replace_all(_chid,'"',""); _chidoriginal=_chid;
        if (string_copy(_chid,1,string_length("Stuff/")) == "Stuff/" || string_copy(_chid,1,string_length("Stuff/")) == "Stuff\") {_path = _chid;}
        else {_path=novdat.FolName[novid]; if (!file_exists(current_directory()+_path+_chid)) {
            if (file_exists(current_directory()+_path+"fonts\"+_chid)) {_chid="fonts\"+_chid;}
            else if (file_exists(current_directory()+_path+"font\"+_chid)) {_chid="font\"+_chid;}}}
        if (file_exists(current_directory()+_path+_chid)) {_pass=1; if (_doingfrom.object_index==novel) {___tempdb=novel.fonts;}
            else {___tempdb=novdat.fonts[novid];} _v=ds_map_find_value(___tempdb,_chidoriginal);
            if (!is_undefined(_v)) {if (font_exists(_v)) {_pass=0;/*font_delete(_v);*/}} _v=ds_map_find_value(___tempdb,_chid);
            if (!is_undefined(_v)) {if (font_exists(_v)) {_pass=0;/*font_delete(_v);*/}} if (_pass) {
                _font = font_add(current_directory()+_path+_chid,__size,__bold,__italic,__first,__last); if (font_exists(_font)) {
                if (_doingfrom.object_index==novel) {ds_map_replace(novel.fonts,_chidoriginal,_font);} else {ds_map_replace(novdat.fonts[novid],_chidoriginal,_font);}
                if (_linked != "") {ds_map_replace(_linkdb,_linked,_chidoriginal); ds_map_replace(_linkdb1,_linked,"font");}}}}}}
else if (string_copy(fstr,1,string_length("font "))=="font ") {_chid=string_copy(fstr,string_length("font ")+1,string_length(fstr)-string_length("font "));
    if (_chid!="") {if (_chid=="reset") {global.dDrawFont=global.dialTextFont; global.dDrawFont_t=global.dialTextFont_t;}
        else {global.dDrawFont=convertToFont(_chid); global.dDrawFont_t=_chid;}}
    if (global.debug) {with (objGUI_chat) {chat_add_color("Font changed to: "+string(other._chid)+"",c_fuchsia);}}}

//----------------------------------------------------NOTIFICATIONS----------------------------------------------------//
//----------------------------------------------------NOTIFICATIONS----------------------------------------------------//
//----------------------------------------------------NOTIFICATIONS----------------------------------------------------//
else if (string_copy(fstr,1,string_length("notification "))=="notification ") {_clr=c_gray;
    if (string_copy(fstr,string_length("notification ")+1,1) == '"') {
        message=string_get_tillsymbol(fstr,string_length("notification '")+1,'"');
        if (string_length(fstr)>string_length("notification '")+string_length(message)+2) {
            ipos=string_length("notification '")+string_length(message)+2; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            _str3=convertToColor(string_lower(_str2)); if (_str3!=c_white || _str2=="white") {_clr=_str3;}
            ipos+=string_length(_str2)+1;}}}
    else {message=string_copy(fstr,string_length("notification ")+1,string_length(fstr)-string_length("notification "));}
    if (message!="") {notcen_add("N",message); n.notv_color=_clr;}}

//----------------------------------------------------GLOBAL----------------------------------------------------//
//----------------------------------------------------GLOBAL----------------------------------------------------//
//----------------------------------------------------GLOBAL----------------------------------------------------//
else if (nss_check("global ")) {_str1 = string_get_tillsymbol(fstr,string_length("global ")+1," ");
    if (_str1!="") {_str2=string_copy(fstr,string_length("global ")+string_length(_str1)+2,string_length(fstr)-(string_length("global ")+string_length(_str1)+1));
    if (_str2!="") {while (string_copy(_str2,string_length(_str2),1) == " ") {if (string_length(_str2)<=0) {_str2=""; break;} _str2=string_copy(_str2,1,string_length(_str2)-1);}
    switch (_str1) {default: break;
        case "parallax": if (_str2=="reset" || _str2=="default") {global.backOMove=0.008; global.charOMove_n=0.020; global.charOMove_f=0.011; global.charOMove_c=0.035;}
            else {_str2=string_convert_topos(_str2); global.backOMove=_str2; global.charOMove_n=_str2; global.charOMove_f=_str2; global.charOMove_c=_str2;} break;
        case "backparallax": if (_str2=="reset" || _str2=="default") {global.backOMove=0.008;}
            else {_str2=string_convert_topos(_str2); global.backOMove=_str2;} break;
        case "charparallax": if (_str2=="reset" || _str2=="default") {global.charOMove_n=0.020; global.charOMove_f=0.011; global.charOMove_c=0.035;}
            else {if (string_copy(_str2,1,6) == "normal") {_str3=(string_copy(_str2,7+1,string_length(_str2)-7));
                    if (_str3=="reset" || _str3=="default") {global.charOMove_n=0.020;} else {global.charOMove_n=string_convert_topos(_str3);}}
                else if (string_copy(_str2,1,1) == "n") {_str3=(string_copy(_str2,2+1,string_length(_str2)-2));
                    if (_str3=="reset" || _str3=="default") {global.charOMove_n=0.020;} else {global.charOMove_n=string_convert_topos(_str3);}}
                else if (string_copy(_str2,1,5) == "close") {_str3=(string_copy(_str2,6+1,string_length(_str2)-6));
                    if (_str3=="reset" || _str3=="default") {global.charOMove_c=0.035;} else {global.charOMove_c=string_convert_topos(_str3);}}
                else if (string_copy(_str2,1,1) == "c") {_str3=(string_copy(_str2,2+1,string_length(_str2)-2));
                    if (_str3=="reset" || _str3=="default") {global.charOMove_c=0.035;} else {global.charOMove_c=string_convert_topos(_str3);}}
                else if (string_copy(_str2,1,3) == "far") {_str3=(string_copy(_str2,4+1,string_length(_str2)-4));
                    if (_str3=="reset" || _str3=="default") {global.charOMove_f=0.011;} else {global.charOMove_f=string_convert_topos(_str3);}}
                else if (string_copy(_str2,1,1) == "f") {_str3=(string_copy(_str2,2+1,string_length(_str2)-2));
                    if (_str3=="reset" || _str3=="default") {global.charOMove_f=0.011;} else {global.charOMove_f=string_convert_topos(_str3);}}
                else {_str2=string_convert_topos(_str2); global.charOMove_n=_str2; global.charOMove_f=_str2; global.charOMove_c=_str2;}} break;
        case "nowait": global.nowaitset=string_convert_topos(_str2); break;
        case "refvalue": global.alphaRefValue=string_convert_topos(_str2); break;
        //fade, fadein, fadeout, fademax
        //backfade, backfadein, backfadeout, backfademax
        //charfade, charfadein, charfadeout, charfademax
        //musicfade, musicfadein, musicfadeout, musicfademax
        //ambfade, ambfadein, ambfadeout, ambfademax
        }}}}

//----------------------------------------------------MISC----------------------------------------------------//
//----------------------------------------------------MISC----------------------------------------------------//
//----------------------------------------------------MISC----------------------------------------------------//
else if (string_copy(fstr,1,string_length("resource load "))=="resource load ") {}
else if (nss_check("get string")) {if (_linked!="") {__message="Введите, пожалуйста, данные:";
    if (string_length(fstr)>string_length("get string ")+1) {if (string_copy(fstr,string_length("get string ")+1,1) == '"') {
        __message=string_get_tillsymbol(fstr,string_length("get string ")+2,'"');}}
    __getstring=get_string(__message,""); //notcen_add(''," '"+__getstring+"' ");
    ds_map_replace(_linkdb,_linked,__getstring); if (ds_map_exists(_linkdb1,_linked)) {ds_map_delete(_linkdb1,_linked);}}}
else if (string_copy(fstr,1,string_length("nowait"))=="nowait") {nowait=1;}
else if (string_copy(fstr,1,string_length("nodelay"))=="nodelay") {nowait=1;}
else if (nss_check("wait ") && nss_do_command_ingame_only()) {imgnum=string_copy(fstr,string_length("wait ")+1,string_length(fstr)-string_length("wait "));
    if (imgnum!="") {if (imgnum == "unlimited") {ab=instance_create(0,0,objSNv_wait); if (instance_exists(global.dialog)) {
            with (global.dialog) {instance_destroy();}} ab.unlimited=1; waitingForComplete=1;
            if (isSkip) {nowait=0; cPressed=0; isSkip=0; keyboard_clear(vk_control); alarm[0]=global.nRefreshRate; exit;}}
        else {if (!isSkip) {if (imgnum!="") {ab=instance_create(0,0,objSNv_wait); if (novdat.isObsolete[novid]) {ab.time=real(imgnum);}
            else {ab.time=30*string_convert_topos(imgnum);} waitingForComplete=1;}} else {alarm[0]=global.nSkipRate; exit;}}}
    if (global.debug) {with (objGUI_chat) {chat_add_color("Waiting: '"+string(other.imgnum)+"'",c_blue);}}}
else if (nss_check('jump ')) {if (instance_exists(novel)) {
    toscen=string_copy(fstr,string_length('jump ')+1,string_length(fstr)-5); toscen=string_replace_all(toscen,'"',"");
    _path=novdat.FolName[novid]; if (filename_ext(toscen) == "") {toscen+=".nsdat";} if (!file_exists(current_directory()+_path+toscen)) {
        if (file_exists(current_directory()+_path+"episodes\"+toscen)) {toscen="episodes\"+toscen;}
        else if (file_exists(current_directory()+_path+"scenario\"+toscen)) {toscen="scenario\"+toscen;}
        else if (file_exists(current_directory()+_path+"scenarios\"+toscen)) {toscen="scenarios\"+toscen;}
        else if (file_exists(current_directory()+_path+"script\"+toscen)) {toscen="script\"+toscen;}
        else if (file_exists(current_directory()+_path+"scripts\"+toscen)) {toscen="scripts\"+toscen;}}
    if (novel.scenario==toscen) {novel.inRead_l="";} novel.scenario=toscen; ds_list_clear(novel._nss_script);}}
else if (nss_check('execute ')) {
    toscen=string_copy(fstr,string_length('execute ')+1,string_length(fstr)-string_length("execute ")); toscen=string_replace_all(toscen,'"',"");
    _path=novdat.FolName[novid]; if (filename_ext(toscen) == "") {toscen+=".nsdat";} if (!file_exists(current_directory()+_path+toscen)) {
        if (file_exists(current_directory()+_path+"episodes\"+toscen)) {toscen="episodes\"+toscen;}
        else if (file_exists(current_directory()+_path+"scenario\"+toscen)) {toscen="scenario\"+toscen;}
        else if (file_exists(current_directory()+_path+"scenarios\"+toscen)) {toscen="scenarios\"+toscen;}
        else if (file_exists(current_directory()+_path+"script\"+toscen)) {toscen="script\"+toscen;}
        else if (file_exists(current_directory()+_path+"scripts\"+toscen)) {toscen="scripts\"+toscen;}}
    if (file_exists(current_directory()+_path+toscen)) {_n__with=id;
        if (_doingfrom.object_index==novel && object_index!=novel) {_n__with=instance_find(novel,0);
            novel._path=_path; novel.toscen=toscen; novel._doingfrom=_doingfrom;}
        with (_n__with) {n_of_file=""; _doyurself=0;
            if (_file==-1) {_doyurself=1;} else {if (_doingfrom.object_index==novel) {
                novid=novel.novid; n_of_file=novel.inRead_l;} else {if (novid!=-1) {n_of_file=novdat.FName[novid];}}}
            show_debug_message('added: '+string(_nss_progress)+' "'+n_of_file+'" "'+toscen+'"');
            ds_list_add(_nss_script,string(_nss_progress)+' "'+n_of_file+'" "'+toscen+'"'); if (_file!=-1) {
                if (_doingfrom.object_index==novel) {ds_map_clear(novel.linecache);} file_text_close(_file);}
            _file = file_text_open_read(current_directory()+_path+toscen); _nss_progress=0;
            if (_doingfrom.object_index==novel) {novel.inRead_l=toscen; novel.scenario=toscen; global.curLine=0; progress=0;}
            fstr=file_text_read_string(_file); show_debug_message(fstr); noread=1;
            if (_doyurself) {while (!file_text_eof(_file)) {if (!noread) {fstr = file_text_read_string(_file);} else {noread=0;}
                novelsomescript(fstr,_doingfrom); if (!noread) {file_text_readln(_file); _nss_progress+=1;}}}}}}
else if (string_copy(fstr,1,string_length('start again'))=='start again') {inRead_l="";}
else if (nss_check("dead end") && nss_do_command_ingame_only()) {if (_file != -1) {file_text_close(_file);
    if (global.debug) {with (objGUI_chat) {chat_add_color("Closing scenario '"+other.inRead_l+"'...",c_gray);}}} inRead_l=""; game_deinit();
        if (!global.isTesting) {room_goto(global.lRMenu);} else {global.nEDid=novid; global.isNExists=novid; room_goto(room_editor);} instance_destroy(); exit;}
else if (nss_check("game end") && nss_do_command_ingame_only()) {if (_file != -1) {file_text_close(_file);
    if (global.debug) {with (objGUI_chat) {chat_add_color("Closing scenario '"+other.inRead_l+"'...",c_gray);}}} inRead_l=""; game_deinit();
        if (!global.isTesting) {room_goto(global.lRMenu);} else {global.nEDid=novid; global.isNExists=novid; room_goto(room_editor);} instance_destroy(); exit;}

//----------------------------------------------------DIALOGUE----------------------------------------------------//
//----------------------------------------------------DIALOGUE----------------------------------------------------//
//----------------------------------------------------DIALOGUE----------------------------------------------------//
else if (nss_check('"')) {phrase=string_convert_withpluses(string_copy(fstr,1,string_length(fstr)));
    if (phrase!="") {if (_linked=="") {if (nss_do_command_ingame_only()) {global.diWindow=dialwin; dialog_text(0,noone,"",phrase);
        dialog_customize(isdialpos,dialposx,dialposy,dialwin,dialcolor,dialoutcl,dialfull); dialog_deadend(1); waitingForComplete=1;}}}
    if (_linked!="") {ds_map_replace(_linkdb,_linked,phrase); if (ds_map_exists(_linkdb1,_linked)) {ds_map_delete(_linkdb1,_linked);}}}
else if (nss_check('choose start') && nss_do_command_ingame_only()) {cPressed=0; chProgress=_nss_progress; __frst=1;
    _questions=ds_list_create(); isSkip=0; nowait=0; chCount=0; //for (ii=0;ii<=9;ii+=1) {chstr[ii]=""; chact[ii]="";}
    cstr=""; chtype=1; while (string_copy(cstr,1,string_length('choose end'))!='choose end') {
        if (_file!=-1) {if (!__frst) {cstr=file_text_read_string(_file);} else {__frst=0;}} else {break;} if (cstr!="") {
            while (string_copy(cstr,1,1)==" ") {if (string_length(cstr)<=1) {break;} cstr=string_copy(cstr,2,string_length(cstr)-1);}
            if (string_copy(cstr,1,string_length('choose end'))=='choose end') {break;}
            else if (string_copy(cstr,1,string_length('choose type'))=='choose type') {
                _tp=string_get_tillsymbol(cstr,string_length('choose type ')+1," "); if (_tp!="") {chtype=real(_tp);}}
            else if (string_copy(cstr,1,string_length('choose '))=='choose ') {phrase = string_copy(cstr,string_length('choose ')+1,string_length(cstr)-string_length('choose '));
                if (phrase!="") {ds_list_add(_questions,string(chProgress+1)+" "+string_convert_withpluses(phrase));}}}
        if (_file!=-1) {ds_map_replace(novel.linecache,chProgress,cstr); chProgress+=1; file_text_readln(_file);} else {break;}}
    ds_map_replace(novel.linecache,chProgress,cstr);
    if (!ds_list_empty(_questions)) {global.diWindow=dialwin; dialog_question(0,-1,-1,-1,-1,-1); global.diWindow=dialwin;
        dialog_qutype(0,chtype); dialog_customize(isdialpos,dialposx,dialposy,dialwin,dialcolor,dialoutcl,dialfull);
        for (ii=0;ii<ds_list_size(_questions);ii+=1) {__vf=ds_list_find_value(_questions,ii);
            __vf1=string_get_tillsymbol(__vf,1,' '); dialog_add_question(0,string_copy(__vf,string_length(__vf1)+2,string_length(__vf)-string_length(__vf1)-1));}
        dialog_deadend(1); waitingForComplete=1;}}

//----------------------------------------------------PERSON----------------------------------------------------//
//----------------------------------------------------PERSON----------------------------------------------------//
//----------------------------------------------------PERSON----------------------------------------------------//
else if (string_copy(fstr,1,string_length("charset all"))=="charset all") {chid=0; if (global.debug) {with (objGUI_chat) {chat_add_color("Addicted to char: all",c_purple);}}}
else if (string_copy(fstr,1,string_length("charset id "))=="charset id ") {_chid=string_copy(fstr,string_length("charset id ")+1,global.maxDigitCount);
    if (string_digits(_chid)!="") {chid=real(_chid);} if (global.debug) {with (objGUI_chat) {chat_add_color("Addicted to char: "+other.chid+"",c_purple);}}}
else if (string_copy(fstr,1,string_length("charset "))=="charset ") {_chid=string_copy(fstr,string_length("charset ")+1,global.maxDigitCount);
    if (string_digits(_chid)!="") {chid=real(_chid);} if (global.debug) {with (objGUI_chat) {chat_add_color("Addicted to char: "+string(other.chid)+"",c_purple);}}}
else if (nss_check("show ")) {_name = string_get_tillsymbol(fstr,string_length("show ")+1,' '); if (_name!="") {
    chaid=-1; _chaid=ds_map_find_value(_linkdb,_name); if (is_undefined(_chaid)) {chaid=person_exists(_name);} else {
        if (instance_exists(_chaid)) {if (_chaid.object_index == objSNv_person) {chaid=_chaid.bnum;}}}
    if (chaid==-1) {if (string_count('"',_name) > 0) {_name1 = string_convert_withpluses(_name);}
        else {_name1 = string_convert_tovar(_name); if (string_count('"',_name1) > 0) {
            _name2=string_get_tillsymbol(_name1,1,' '); _name1 = string_convert_withpluses(_name2)+string_copy(_name1,string_length(_name2)+1,string_length(_name1)-string_length(_name2));}
        else {_chaid=ds_map_find_value(_linkdb,_name1); if (is_undefined(_chaid)) {chaid=person_exists(_name1);} else {
            if (instance_exists(_chaid)) {if (_chaid.object_index == objSNv_person) {chaid=_chaid.bnum;}}}}}
        fstr=string_replace(fstr,_name,_name1); _name = string_get_tillsymbol(fstr,string_length("show ")+1,' ');}
    _fadein=global.stanFade; _fadeout=global.stanFade; _fademax=1; _pos="center"; _states=0;
    _cuposx=0; _cuposy=0; _depth=0; _scale=1; _parallax=global.charOMove_n; _parset=0; _interpolation=1;
    _depset=0; _xrev=1; _yrev=1; animFname=""; animPath=""; _sosx=0; _sosy=0; _osx=0; _osy=0;
    if (string_length(fstr)>=string_length("show ")+string_length(_name)+2) {
        ipos = string_length("show ")+string_length(_name)+2; while (ipos<string_length(fstr)) {
            _str2=string_get_tillsymbol2(fstr,ipos," ",",");
            if (string_copy(_str2,1,string_length("left")) == "left") {_pos="left";}
            else if (string_copy(_str2,1,string_length("cleft")) == "cleft") {_pos="cleft";}
            else if (string_copy(_str2,1,string_length("center")) == "center") {_pos="center";}
            else if (string_copy(_str2,1,string_length("cright")) == "cright") {_pos="cright";}
            else if (string_copy(_str2,1,string_length("right")) == "right") {_pos="right";}
            else if (string_copy(_str2,1,string_length("xrev")) == "xrev") {_xrev=-1;}
            else if (string_copy(_str2,1,string_length("yrev")) == "yrev") {_yrev=-1;}
            else if (string_copy(_str2,1,string_length("offsetx:")) == "offsetx:") {_sosx=1; _osx=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));}
            else if (string_copy(_str2,1,string_length("offsetx:")) == "offsety:") {_sosy=1; _osy=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));}
            else if (string_copy(_str2,1,string_length("interpolation:")) == "interpolation:") {_interpolation=string_copy(_str2,string_length("interpolation:")+1,string_length(_str2)-string_length("interpolation:"));}
            else if (string_copy(_str2,1,string_length("depth:")) == "depth:") {_dset=string_copy(_str2,string_length("depth:")+1,string_length(_str2)-string_length("depth:"));
                _depth=person_guess_depth(); _depset=1; if (__guess_guessed) {if (!_parset) {_parset=1; _pset=_dset; _parallax=person_guess_parallax();}}}
            else if (string_copy(_str2,1,string_length("parallax:")) == "parallax:") {_pset=string_copy(_str2,string_length("parallax:")+1,string_length(_str2)-string_length("parallax:"));
                _parallax=person_guess_parallax(); _parset=1; if (__guess_guessed) {if (!_depset) {_depset=1; _dset=_pset; _depth=person_guess_depth();}}}
            else if (string_copy(_str2,1,string_length("scale:")) == "scale:") {
                _scale=string_convert_topos(string_copy(_str2,string_length("scale:")+1,string_length(_str2)-string_length("scale:")));}
            else if (string_copy(_str2,1,string_length("x:")) == "x:") {_pos="custom";
                _cuposx=string_convert_tocupos(string_copy(_str2,string_length("x:")+1,string_length(_str2)-string_length("x:")));}
            else if (string_copy(_str2,1,string_length("y:")) == "y:") {
                _cuposy=string_convert_tocupos(string_copy(_str2,string_length("y:")+1,string_length(_str2)-string_length("y:")));}
            else if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fadein=1/(_number*30); _fadeout=_fadein;} else {_fadein=10000; _fadeout=10000;}}
            else if (string_copy(_str2,1,string_length("fadein:")) == "fadein:") {
                _str3=string_copy(_str2,string_length("fadein:")+1,string_length(_str2)-string_length("fadein:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fadein=1/(_number*30);} else {_fadein=10000;}}
            else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:"));
                _number=string_convert_topos(_str3); if (_number!=0) {_fadeout=1/(_number*30);} else {_fadeout=10000;}}
            else if (string_copy(_str2,1,string_length("fademax:")) == "fademax:") {
                _str3=string_copy(_str2,string_length("fademax:")+1,string_length(_str2)-string_length("fademax:")); _fademax=string_convert_topos(_str3);}
            else if (string_copy(_str2,1,string_length("alpha:")) == "alpha:") {
                _str3=string_copy(_str2,string_length("alpha:")+1,string_length(_str2)-string_length("alpha:")); _fademax=string_convert_topos(_str3);}
            else if (string_copy(_str2,1,string_length("animation:")) == "animation:") {
                if (string_copy(_str2,string_length("animation:")+1,1) == '"') {
                    _str3=string_get_tillsymbol(fstr,ipos+string_length("animation:")+1,'"');}
                else {_str3=string_get_tillsymbol(fstr,ipos+string_length("animation:"),' ');}
                if (_str3!="") {_path=""; if (_str3!="stop" && _str3!="clear" && _str3!="none") {
                    _path=novdat.FolName[novid]; if (string_copy(_str3,1,string_length("Stuff/"))=="Stuff/") {_path=_str3;} else if (string_copy(_str3,1,string_length("Stuff\"))=="Stuff\") {_path=_str3;}
                    if (_path!=_str3) {if (!file_exists(current_directory()+_path+_str3)) {if (file_exists(current_directory()+_path+"animation\"+_str3)) {_str3="animation\"+_str3;}
                        else if (file_exists(current_directory()+_path+"animations\"+_str3)) {_str3="animations\"+_str3;}}} else {_path="";}}
                    animPath=_path; animFname=_str3;}} else {if (!nss_afterscript(_str2)) {_state[_states]=_str2; _states+=1;}}
            ipos+=string_length(_str2)+1;}}
    if (chaid==-1) {__yeahdoit=0; _path=novdat.FolName[novid]; _originalname=_name; if (!file_exists(current_directory()+_path+_name)) {
        if (file_exists(current_directory()+_path+"characters\"+_name)) {_name="characters\"+_name;}
        else if (file_exists(current_directory()+_path+"character\"+_name)) {_name="character\"+_name;}
        else if (file_exists(current_directory()+_path+"images\"+_name)) {_name="images\"+_name;}
        else if (file_exists(current_directory()+_path+"image\"+_name)) {_name="image\"+_name;}
        else if (file_exists(current_directory()+_path+"sprites\"+_name)) {_name="sprites\"+_name;}
        else if (file_exists(current_directory()+_path+"sprite\"+_name)) {_name="sprite\"+_name;}}
        __yeahdoit=file_exists(current_directory()+_path+_name);} else {__yeahdoit=1;} if (__yeahdoit) {
    _person=instance_create(0,0,objSNv_person); _person.novid=novid; _person.sprState="####look for array"; for (i=0;i<_states;i+=1) {
        _person.statearray[i]=_state[i];} _person.statearrayc=_states; _person.pos=_pos;
    if (_depset || chaid != -1) {_person.shDepth=_depth;} else {_person.shDepth=-100;}
    if (_parset) {_person.sparallax=_parallax;} _person.sint=_interpolation;
    if (chaid==-1) {_person.itpath=_path; _person.itfname=_name; _person.originalfname=_originalname;
        if (_sosx) {_person.sosx=1; _person._ofx = _osx;} if (_sosy) {_person.sosy=1; _person._ofy=_osy;}}
    _person.initidepth=global.persondepth; global.persondepth-=0.00001; //global.persondepth-=0.000000001;
    _person.cuscale=_scale; _person.cuposx=_cuposx; _person.cuposy=_cuposy; if (nowait) {_person.telled=1;} waitingForComplete=1;
    _person.xrev=_xrev; _person.yrev=_yrev; _person.fadeinmax=_fademax; _person.fadein=_fadein; if (_fadein==10000) {_person.alpha=1;} _person.fadeout=_fadeout;
    if (chaid!=-1) {novdat.charperson[novid,chaid]=_person; ds_list_add(novdat.charoflist[novid,chaid],_person); _person.bnum=chaid;}
    if (_linked != "") {ds_map_replace(_linkdb,_linked,_person); ds_map_replace(_linkdb1,_linked,"instance"); _person._linkedas=_linked;}
    if (animFname!="") {if (animFname!="stop" && animFname!="clear" && animFname!="none") {
            with (_person) {isok=animation_storevar_path(other.animPath+other.animFname);
            if (isok) {animated=1; alarm[1]=1;}} if (_person.isok) {if (nowait) {_person.atelled=1;} else {_person.telled=1;} waitingForComplete=1;}}
        else {with (_person) {animation_storevar_path("");}}} with (_person) {person_alarm0(); doalarm=0;}}}}
else if (nss_check("hide ")) {_name=string_get_tillsymbol(fstr,string_length("hide ")+1,' '); if (_name!="") {
    chaid=-1; if (_name!="all") {_chaid=ds_map_find_value(_linkdb,_name); if (is_undefined(_chaid)) {chaid=person_exists(_name);} else {
        if (instance_exists(_chaid)) {if (_chaid.object_index == objSNv_person) {chid=-2; chaid=_chaid.bnum;}}}}
    __itsinstance=-1; if (chaid==-1 && _name!="all") {if (string_count('"',_name) > 0) {_name1 = string_convert_withpluses(_name);}
        else {if (ds_map_exists(_linkdb,_name)) {__v1=ds_map_find_value(_linkdb,_name);
            if (!is_undefined(__v1)) {__v1=real(__v1); if (ds_map_exists(_linkdb1,_name)) {__v=ds_map_find_value(_linkdb1,_name);
                if (!is_undefined(__v)) {if (__v == "instance") {if (instance_exists(__v1)) {
                    if (__v1.object_index==objSNv_person) {__itsinstance=__v1;}}}}}}}
            if (__itsinstance==-1) {_name1 = string_convert_tovar(_name);
                if (string_count('"',_name1) > 0) {_name1 = string_convert_withpluses(string_get_tillsymbol(_name1,1,' '));}}}
        if (__itsinstance==-1) {fstr=string_replace(fstr,_name,_name1); _name = string_get_tillsymbol(fstr,string_length("hide ")+1,' ');}}
    _fadeout=-1; if (string_length(fstr)>=string_length("hide ")+string_length(_name)+2) {
            ipos = string_length("hide ")+string_length(_name)+2; while (ipos<string_length(fstr)) {
                _str2=string_get_tillsymbol2(fstr,ipos," ",",");
                if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                    _str3=string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:"));
                    _number=string_convert_topos(_str3); if (_number!=0) {_fadeout=1/(_number*30);} else {_fadeout=10000;}}
                else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                    _str3=string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:"));
                    _number=string_convert_topos(_str3); if (_number!=0) {_fadeout=1/(_number*30);} else {_fadeout=10000;}}
                else if (string_copy(_str2,1,string_length("all")) == "all") {chid=0;}
                else if (string_copy(_str2,1,string_length("chid:")) == "chid:") {
                    _str3=string_copy(_str2,string_length("chid:")+1,string_length(_str2)-string_length("chid:"));
                    if (_str3=="all") {chid=0;} else {chid=real(_str3);}}
                else {if (!nss_afterscript(_str2)) {}}
                ipos+=string_length(_str2)+1;}}
        if (chaid==-1) {if (__itsinstance!=-1) {chaid=__itsinstance.bnum;}}
        if (chaid!=-1) {if (chid==-2) {_inst=_chaid; if (instance_exists(_inst)) {if (_fadeout!=-1) {_inst.fadeout=_fadeout;}
                _val=ds_list_find_index(novdat.charoflist[novid,chaid],_inst); ds_map_delete(_linkdb,_name); if (ds_map_exists(_linkdb1,_name)) {ds_map_delete(_linkdb1,_name);}
                if (_val!=-1) {ds_list_delete(novdat.charoflist[novid,chaid],_val);} _inst.dest=1; if (nowait) {_inst.ntell=0;}
                if (_inst.fadeout==10000) {_inst.alpha=0;} waitingForComplete=1;}}
            else if (chid==-1) {_inst=novdat.charperson[novid,(chaid)];
                if (instance_exists(_inst)) {if (_inst._linkedas!="") {if (ds_map_exists(_linkdb,_inst._linkedas)) {ds_map_delete(_linkdb,_inst._linkedas);}
                        if (ds_map_exists(_linkdb1,_inst._linkedas)) {ds_map_delete(_linkdb1,_inst._linkedas);}}
                    if (_fadeout!=-1) {_inst.fadeout=_fadeout;}
                    _val=ds_list_find_index(novdat.charoflist[novid,(chaid)],novdat.charperson[novid,(chaid)]);
                    if (_val!=-1) {ds_list_delete(novdat.charoflist[novid,(chaid)],_val);} _inst.dest=1; if (nowait) {_inst.ntell=0;}
                    if (_inst.fadeout==10000) {_inst.alpha=0;} waitingForComplete=1;}}
            else if (chid==0) {_finst=1; _lc=ds_list_size(novdat.charoflist[novid,(chaid)]); for (i=_lc-1;i>=0;i-=1) {_inst=ds_list_find_value(novdat.charoflist[novid,(chaid)],i);
                if (instance_exists(_inst)) {if (_inst._linkedas!="") {if (ds_map_exists(_linkdb,_inst._linkedas)) {ds_map_delete(_linkdb,_inst._linkedas);}
                        if (ds_map_exists(_linkdb1,_inst._linkedas)) {ds_map_delete(_linkdb1,_inst._linkedas);}}
                    if (_fadeout!=-1) {_inst.fadeout=_fadeout;} if (_inst.fadeout==10000) {_inst.alpha=0;}
                    _inst.dest=1; if (!_finst||nowait) {_inst.ntell=0;} _finst=0; ds_list_delete(novdat.charoflist[novid,(chaid)],i);}}
                    if (_lc>0) {waitingForComplete=1;}}
            else {crinst=1; bin=0; for (i=0;i<ds_list_size(novdat.charoflist[novid,(chaid)]);i+=1) {
                _inst=ds_list_find_value(novdat.charoflist[novid,(chaid)],i);
                if (instance_exists(_inst)) {if (crinst==chid) {bin=1; if (_fadeout!=-1) {_inst.fadeout=_fadeout;} if (_inst.fadeout==10000) {_inst.alpha=0;}
                if (_inst._linkedas!="") {if (ds_map_exists(_linkdb,_inst._linkedas)) {ds_map_delete(_linkdb,_inst._linkedas);}
                    if (ds_map_exists(_linkdb1,_inst._linkedas)) {ds_map_delete(_linkdb1,_inst._linkedas);}}
                _inst.dest=1; if (nowait) {_inst.ntell=0;} if (isSkip) {_pers.alpha=0;} ds_list_delete(novdat.charoflist[novid,(chaid)],i);} crinst+=1;}} if (bin) {waitingForComplete=1;}}
        } else {if (_name == "all") {_finst=1; for (i=0;i<instance_number(objSNv_person);i+=1) {
            _inst=instance_find(objSNv_person,i); if (!_inst.nogamenolife == (_doingfrom.object_index==novel)) {if (!_finst||nowait) {_inst.ntell=0;} waitingForComplete=1; _finst=0;
                if (_inst.bnum!=-1) {__isundefined=ds_list_find_index(novdat.charoflist[novid,_inst.bnum],_inst);
                    if (!is_undefined(__isundefined)) {ds_list_delete(novdat.charoflist[novid,_inst.bnum],__isundefined);}}
                if (_inst._linkedas!="") {if (ds_map_exists(_linkdb,_inst._linkedas)) {ds_map_delete(_linkdb,_inst._linkedas);}
                    if (ds_map_exists(_linkdb1,_inst._linkedas)) {ds_map_delete(_linkdb1,_inst._linkedas);}}
                if (_fadeout!=-1) {_inst.fadeout=_fadeout;} if (_inst.fadeout==10000) {_inst.alpha=0;} _inst.dest=1;}}}
            else {if (__itsinstance!=-1) {
                    _inst=__itsinstance; if (!_inst.nogamenolife == (_doingfrom.object_index==novel)) {
                        if (_inst.bnum!=-1) {__isundefined=ds_list_find_index(novdat.charoflist[novid,_inst.bnum],_inst);
                            if (!is_undefined(__isundefined)) {ds_list_delete(novdat.charoflist[novid,_inst.bnum],__isundefined);}}
                        if (_inst._linkedas!="") {if (ds_map_exists(_linkdb,_inst._linkedas)) {ds_map_delete(_linkdb,_inst._linkedas);}
                            if (ds_map_exists(_linkdb1,_inst._linkedas)) {ds_map_delete(_linkdb1,_inst._linkedas);}}
                        if (_fadeout!=-1) {_inst.fadeout=_fadeout;} if (_inst.fadeout==10000) {_inst.alpha=0;} _inst.dest=1; if (nowait) {_inst.ntell=0;} waitingForComplete=1;}}
                else {_finst=1; for (i=0;i<instance_number(objSNv_person);i+=1) {_inst=instance_find(objSNv_person,i); if (!_inst.nogamenolife == (_doingfrom.object_index==novel)) {
                    if (_inst.originalfname==_name) {if (_inst.bnum!=-1) {__isundefined=ds_list_find_index(novdat.charoflist[novid,_inst.bnum],_inst);
                            if (!is_undefined(__isundefined)) {ds_list_delete(novdat.charoflist[novid,_inst.bnum],__isundefined);}}
                        if (_inst._linkedas!="") {if (ds_map_exists(_linkdb,_inst._linkedas)) {ds_map_delete(_linkdb,_inst._linkedas);}
                            if (ds_map_exists(_linkdb1,_inst._linkedas)) {ds_map_delete(_linkdb1,_inst._linkedas);}}
                        if (_fadeout!=-1) {_inst.fadeout=_fadeout;} if (_inst.fadeout==10000) {_inst.alpha=0;} _inst.dest=1; if (!_finst||nowait) {_inst.ntell=0;} waitingForComplete=1; _finst=0; if (chid!=0) {break;}}}}}}}
        chid=-1;} _c_showing=0; for (i=0;i<instance_number(objSNv_person);i+=1) {__a=instance_find(objSNv_person,i); if (!__a.dest) {_c_showing+=1;}} if (_c_showing==0) {global.persondepth=0;}}

//-------------------------------------------THEN THE FIRST WORD IS A VARIABLE OR CHARACTER'S NAME-------------------------------------------//
//-------------------------------------------THEN THE FIRST WORD IS A VARIABLE OR CHARACTER'S NAME-------------------------------------------//
//-------------------------------------------THEN THE FIRST WORD IS A VARIABLE OR CHARACTER'S NAME-------------------------------------------//
else {cmd=string_get_tillsymbol(fstr,1," "); if (cmd!="") {
    if (string_copys(fstr,string_length(cmd)+2,1)=='"') {
        chaid=-1; _chaid=ds_map_find_value(_linkdb,cmd); if (is_undefined(_chaid)) {chaid=person_exists(cmd);} else {
        if (instance_exists(_chaid)) {if (_chaid.object_index == objSNv_person) {chaid=_chaid.bnum;}}}
        if (chaid!=-1) {phrase=string_convert_withpluses(string_copy(fstr,string_length(cmd+' ')+1,string_length(fstr)-string_length(cmd+' '))); if (phrase!="") {
                _actor=novdat.dchar[novid,chaid]; if (string_copy(_actor,1,1)!='"') {_actor=string_convert_topos_string(_actor);} else {_actor=string_replace_all(_actor,'"',"");}
                global.diWindow=dialwin; dialog_text(0,noone,_actor,phrase); dialog_customize(isdialpos,dialposx,dialposy,dialwin,dialcolor,dialoutcl,dialfull);
                dialog_acolor(0,novdat.charclr[novid,chaid],novdat.charoutclr[novid,chaid]); dialog_deadend(1); waitingForComplete=1;}
            } else {if (rEnd==2) {rEnd=3;} if (global.debug) {if (__asddeb) {with (objGUI_chat) {chat_add_color("Unknown action (perhaps character not found?): '"+string(other.fstr)+"'",c_red);}}}}
    } else {cmd1=string_get_tillsymbol(fstr,string_length(cmd)+2," ");
        if (string_copys(cmd1,1,string_length("setstate")) == "setstate") {
            _fadein=0; _fadeout=0; _states=0; _image=""; _pos=""; _xrev=-2; _yrev=-2; _sosx=0; _sosy=0; _osx=""; _osy=""; _interpolation=1; _cuposxset=0; _cuposyset=0;
            _depset=0; _parset=0; _depth=0; _parallax=global.charOMove_n; _scale=1; _scaleset=0; _cuposx=0; _cuposy=0; _fademax=-1; animPath=""; animFname="";
            ipos=string_length(cmd)+1+string_length(cmd1)+1+1; while (ipos<=string_length(fstr)) {_str2=string_get_tillsymbol(fstr,ipos,' ');
                if (string_copy(_str2,1,string_length("left")) == "left") {_pos="left";}
                else if (string_copy(_str2,1,string_length("cleft")) == "cleft") {_pos="cleft";}
                else if (string_copy(_str2,1,string_length("center")) == "center") {_pos="center";}
                else if (string_copy(_str2,1,string_length("cright")) == "cright") {_pos="cright";}
                else if (string_copy(_str2,1,string_length("right")) == "right") {_pos="right";}
                else if (string_copy(_str2,1,string_length("xrev")) == "xrev") {_xrev=-1;}
                else if (string_copy(_str2,1,string_length("yrev")) == "yrev") {_yrev=-1;}
                else if (string_copy(_str2,1,string_length("offsetx:")) == "offsetx:") {_sosx=1; _osx=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));}
                else if (string_copy(_str2,1,string_length("offsetx:")) == "offsety:") {_sosy=1; _osy=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));}
                else if (string_copy(_str2,1,string_length("interpolation:")) == "interpolation:") {_interpolation=string_copy(_str2,string_length("interpolation:")+1,string_length(_str2)-string_length("interpolation:"));}
                else if (string_copy(_str2,1,string_length("depth:")) == "depth:") {_dset=string_copy(_str2,string_length("depth:")+1,string_length(_str2)-string_length("depth:"));
                    _depth=person_guess_depth(); _depset=1; if (__guess_guessed) {if (!_parset) {_parset=1; _pset=_dset; _parallax=person_guess_parallax();}}}
                else if (string_copy(_str2,1,string_length("parallax:")) == "parallax:") {_pset=string_copy(_str2,string_length("parallax:")+1,string_length(_str2)-string_length("parallax:"));
                    _parallax=person_guess_parallax(); _parset=1; if (__guess_guessed) {if (!_depset) {_depset=1; _dset=_pset; _depth=person_guess_depth();}}}
                else if (string_copy(_str2,1,string_length("scale:")) == "scale:") {_scaleset=1;
                    _scale=string_convert_topos(string_copy(_str2,string_length("scale:")+1,string_length(_str2)-string_length("scale:")));}
                else if (string_copy(_str2,1,string_length("x:")) == "x:") {_pos="custom"; _cuposxset=1;
                    _cuposx=string_convert_tocupos(string_copy(_str2,string_length("x:")+1,string_length(_str2)-string_length("x:")));}
                else if (string_copy(_str2,1,string_length("y:")) == "y:") {_cuposyset=1;
                    _cuposy=string_convert_tocupos(string_copy(_str2,string_length("y:")+1,string_length(_str2)-string_length("y:")));}
                else if (string_copy(_str2,1,string_length("fade:")) == "fade:") {
                    _str3=string_convert_topos(string_copy(_str2,string_length("fade:")+1,string_length(_str2)-string_length("fade:")));
                    if (_str3!=0) {_fadeout = 1/(30*_str3);} else {_fadeout=0;} _fadein=_fadeout;}
                else if (string_copy(_str2,1,string_length("fadein:")) == "fadein:") {
                    _str3=string_convert_topos(string_copy(_str2,string_length("fadein:")+1,string_length(_str2)-string_length("fadein:")));
                    if (_str3!=0) {_fadein = 1/(30*_str3);} else {_fadein=0;}}
                else if (string_copy(_str2,1,string_length("fadeout:")) == "fadeout:") {
                    _str3=string_convert_topos(string_copy(_str2,string_length("fadeout:")+1,string_length(_str2)-string_length("fadeout:")));
                    if (_str3!=0) {_fadeout = 1/(30*_str3);} else {_fadeout=0;}}
                else if (string_copy(_str2,1,string_length('"')) == '"') {_image=string_get_tillsymbol(fstr,ipos+1,'"'); _str2='"'+_image+'"';}
                else if (string_copy(_str2,1,string_length("chid:")) == "chid:") {
                    _str3=string_copy(_str2,string_length("chid:")+1,string_length(_str2)-string_length("chid:"));
                    if (_str3=="all") {chid=0;} else {chid=real(_str3);}}
                else if (string_copy(_str2,1,string_length("fademax:")) == "fademax:") {
                    _str3=string_copy(_str2,string_length("fademax:")+1,string_length(_str2)-string_length("fademax:")); _fademax=string_convert_topos(_str3);}
                else if (string_copy(_str2,1,string_length("alpha:")) == "alpha:") {
                    _str3=string_copy(_str2,string_length("alpha:")+1,string_length(_str2)-string_length("alpha:")); _fademax=string_convert_topos(_str3);}
                else if (string_copy(_str2,1,string_length("animation:")) == "animation:") {
                    if (string_copy(_str2,string_length("animation:")+1,1) == '"') {
                        _str3=string_get_tillsymbol(fstr,ipos+string_length("animation:")+1,'"');}
                    else {_str3=string_get_tillsymbol(fstr,ipos+string_length("animation:"),' ');}
                    if (_str3!="") {_path=""; if (_str3!="stop" && _str3!="clear" && _str3!="none") {
                        _path=novdat.FolName[novid]; if (string_copy(_str3,1,string_length("Stuff/"))=="Stuff/") {_path=_str3;} else if (string_copy(_str3,1,string_length("Stuff\"))=="Stuff\") {_path=_str3;}
                        if (_path!=_str3) {if (!file_exists(current_directory()+_path+_str3)) {if (file_exists(current_directory()+_path+"animation\"+_str3)) {_str3="animation\"+_str3;}
                            else if (file_exists(current_directory()+_path+"animations\"+_str3)) {_str3="animations\"+_str3;}}} else {_path="";}}
                        animPath=_path; animFname=_str3;}}
                else if (!nss_afterscript(_str2)) {_state[_states]=_str2; _states+=1;} ipos+=string_length(_str2)+1;}
            _asimp=1; _path=""; if (_image!="") {_path=novdat.FolName[novid]; _originalname=_image; if (string_copy(_image,1,string_length("Stuff/")) == "Stuff/"
                    || string_copy(_image,1,string_length("Stuff/")) == "Stuff\") {_path="";}
                else {if (!file_exists(current_directory()+_path+_image)) {
                    if (file_exists(current_directory()+_path+"images\"+_image)) {_image="images\"+_image;}
                    else if (file_exists(current_directory()+_path+"sprites\"+_image)) {_image="sprites\"+_image;}
                    else if (file_exists(current_directory()+_path+"characters\"+_image)) {_image="characters\"+_image;}
                    else if (file_exists(current_directory()+_path+"characters\images\"+_image)) {_image="characters\images\"+_image;}
                    else if (file_exists(current_directory()+_path+"characters\sprites\"+_image)) {_image="characters\sprites\"+_image;}
                    else if (file_exists(current_directory()+_path+"characters\sprite\"+_image)) {_image="characters\sprite\"+_image;}
                    else if (file_exists(current_directory()+_path+"characters\image\"+_image)) {_image="characters\image\"+_image;}}}}
            if (_asimp) {_pass=(_states>0);} else {_pass=(_image != ""); if (_pass) {_pass=(file_exists(current_directory()+_path+_image));}}
            if (_pass) {chaid=-1; _chaid=ds_map_find_value(_linkdb,cmd); if (is_undefined(_chaid)) {chaid=person_exists(cmd);} else {
                if (instance_exists(_chaid)) {if (_chaid.object_index == objSNv_person) {chaid=_chaid.bnum; chid=-2;}}}
                _dopass=(chaid!=-1); if (chid == -2) {_dopass=1;} if (_dopass) {_finst=1;
                    if (chid==-2) {_inst=_chaid; if (instance_exists(_inst)) {nss_setstate(_inst);}}
                    else if (chid==-1) {_inst=novdat.charperson[novid,(chaid)]; if (instance_exists(_inst)) {nss_setstate(_inst);}}
                    else if (chid==0) {_lc=ds_list_size(novdat.charoflist[novid,(chaid)]);
                        for (i=_lc-1;i>=0;i-=1) {_inst=ds_list_find_value(novdat.charoflist[novid,(chaid)],i);
                            if (instance_exists(_inst)) {nss_setstate(_inst);}}}
                    else {crinst=1; bin=0; for (i=0;i<ds_list_size(novdat.charoflist[novid,(chaid)]);i+=1) {
                        _inst=ds_list_find_value(novdat.charoflist[novid,(chaid)],i); if (instance_exists(_inst)) {
                            if (crinst==chid) {nss_setstate(_inst);} crinst+=1;}}} chid=-1;}}
        } else {if (_linked=="") {if (string_count('=',fstr)+string_count('+',fstr)+string_count('*',fstr)>0) {_yeahthatsright=0; for (_vi=1;_vi<string_length(fstr);_vi+=1) {
                if (string_copy(fstr,_vi,1) == '=' || string_copy(fstr,_vi,1) == '+' || string_copy(fstr,_vi,1) == '-' || string_copy(fstr,_vi,2) == '*=' || string_copy(fstr,_vi,2) == '/=') {
                    _linked=string_copy(fstr,1,_vi-1); _am_toskip=0; if (string_copy(fstr,_vi,1) == '=') {_am_toskip=1;}
                    fstr=string_copy(fstr,_vi+_am_toskip,string_length(fstr)-_vi+1+(-1*_am_toskip));
                    while (string_copy(_linked,string_length(_linked),1) == " ") {if (string_length(_linked)<=1) {break;} else {_linked = string_copy(_linked,1,string_length(_linked)-1);}}
                    while (string_copy(_linked,1,1) == " ") {if (string_length(_linked)<=1) {break;} else {_linked = string_copy(_linked,2,string_length(_linked)-1);}}
                    while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
                    while (string_copy(fstr,1,1) == "=") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
                    while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
                    break;}}}}
            
            ____youshouldpass=1; if (_linked!="") {if (ds_map_exists(_linkdb,_linked)) {
                __v=ds_map_find_value(_linkdb,_linked); if (!is_undefined(__v)) {___gopass=1;
                    if (ds_map_exists(_linkdb1,_linked)) {__v1=ds_map_find_value(_linkdb1,_linked);
                        if (!is_undefined(__v1)) {if (__v1=="instance") {___gopass=0;}}}
                    if (___gopass) {if (!is_string(__v)) {
                        if (nss_check("+=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                            ds_map_replace(_linkdb,_linked,__v+string_convert_topos(_secpart)); ____youshouldpass=0;}}
                        else if (nss_check("++")) {ds_map_replace(_linkdb,_linked,__v+1);}
                        else if (nss_check("-=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                            ds_map_replace(_linkdb,_linked,__v-string_convert_topos(_secpart)); ____youshouldpass=0;}}
                        else if (nss_check("--")) {ds_map_replace(_linkdb,_linked,__v-1);}
                        else if (nss_check("*=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                            ds_map_replace(_linkdb,_linked,__v*string_convert_topos(_secpart)); ____youshouldpass=0;}}
                        else if (nss_check("/=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                            ds_map_replace(_linkdb,_linked,__v/string_convert_topos(_secpart)); ____youshouldpass=0;}}}
                    else {
                        if (nss_check("+=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                            ds_map_replace(_linkdb,_linked,__v+string_convert_topos_string(_secpart)); ____youshouldpass=0;}}
                    }}}}}
            
            if (_linked!="") {if (____youshouldpass) {_cmd1=fstr; _dontdo=0; if (ds_map_exists(_linkdb1,_cmd1)) {__v1=ds_map_find_value(_linkdb1,_cmd1); if (!is_undefined(__v1)) {
                        if (ds_map_exists(_linkdb,_cmd1)) {__v=ds_map_find_value(_linkdb,_cmd1); if (!is_undefined(__v)) {switch (__v1) {default: break;
                            case "instance": ds_map_replace(_linkdb,_linked,__v); ds_map_replace(_linkdb1,_linked,__v1); _dontdo=1; break;
                            case "font": ds_map_replace(_linkdb,_linked,__v); ds_map_replace(_linkdb1,_linked,__v1); _dontdo=1; break;}}}}}
                    if (!_dontdo) {if (string_count('"',_cmd1) > 0) {_cmd1=string_convert_withpluses(_cmd1);
                            ds_map_replace(_linkdb,_linked,_cmd1); if (ds_map_exists(_linkdb1,_linked)) {ds_map_delete(_linkdb1,_linked);}}
                        else {_cmd1=string_convert_topos_stringonly(_cmd1); _str=check_for_nonnumber(_cmd1); if (_str==_cmd1) {
                            _str=string_convert_topos(_str); ds_map_replace(_linkdb,_linked,_str); if (ds_map_exists(_linkdb1,_linked)) {ds_map_delete(_linkdb1,_linked);}}}
            }}} else {if (rEnd==2) {rEnd=3;} if (global.debug) {if (__asddeb) {with (objGUI_chat) {chat_add_color("Unknown action: '"+string(other.fstr)+"'",c_red);}}}}}}
    } else {if (rEnd==2) {rEnd=3;} if (global.debug) {if (__asddeb) {with (objGUI_chat) {chat_add_color("Unknown action: '"+string(other.fstr)+"'",c_red);}}}}}
}
}
}
}

//-------------------------------------------CHECK IF THE FILE WAS EXECUTED THROUGH "execute" COMMAND-------------------------------------------//
//-------------------------------------------CHECK IF THE FILE WAS EXECUTED THROUGH "execute" COMMAND-------------------------------------------//
//-------------------------------------------CHECK IF THE FILE WAS EXECUTED THROUGH "execute" COMMAND-------------------------------------------//
if (_file!=-1) {_n_pass=1; if (_doingfrom.object_index == novel) {_n_pass=(!novel.waitingForComplete && fstr=="");}
    if (file_text_eof(_file) && _n_pass) {if (ds_list_size(_nss_script)>0) {
    __n_value=ds_list_find_value(_nss_script,ds_list_size(_nss_script)-1);
    __n_progress=string_get_tillsymbol(__n_value,1," ");
    __n_of_file=string_get_tillsymbol_as_string(__n_value,string_length(__n_progress)+1+1,' ');
    if (string_length(__n_of_file)-2<=0) {__n_of_file="";} else {__n_of_file=string_copy(__n_of_file,2,string_length(__n_of_file)-2);}
    if (ds_list_size(_nss_script)-1>0) {__n_value1=ds_list_find_value(_nss_script,ds_list_size(_nss_script)-2);
        __n_progress1=string_get_tillsymbol(__n_value1,1," ");
        __n_of_file1=string_get_tillsymbol_as_string(__n_value1,string_length(__n_progress1)+1+1,' ');
        __n_toscen=string_get_tillsymbol_as_string(__n_value1,string_length(__n_progress1)+1+1+string_length(__n_of_file1)+1,' ');
        if (string_length(__n_toscen)-2<=0) {__n_toscen="";} else {__n_toscen=string_copy(__n_toscen,2,string_length(__n_toscen)-2);}}
    file_text_close(_file); if (_doingfrom.object_index==novel) {ds_map_clear(novel.linecache);}
    if (ds_list_size(_nss_script)-1>0) {
        if (__n_toscen!="") {_path=novdat.FolName[novid];
        if (filename_ext(__n_toscen) == "") {__n_toscen+=".nsdat";} if (!file_exists(current_directory()+_path+__n_toscen)) {
            if (file_exists(current_directory()+_path+"episodes\"+__n_toscen)) {__n_toscen="episodes\"+__n_toscen;}
            else if (file_exists(current_directory()+_path+"scenario\"+__n_toscen)) {__n_toscen="scenario\"+__n_toscen;}
            else if (file_exists(current_directory()+_path+"scenarios\"+__n_toscen)) {__n_toscen="scenarios\"+__n_toscen;}
            else if (file_exists(current_directory()+_path+"script\"+__n_toscen)) {__n_toscen="script\"+__n_toscen;}
            else if (file_exists(current_directory()+_path+"scripts\"+__n_toscen)) {__n_toscen="scripts\"+__n_toscen;}}
        if (file_exists(current_directory()+_path+__n_toscen)) {_file = file_text_open_read(current_directory()+_path+__n_toscen);
            if (_doingfrom.object_index == novel) {novel._file=_file; novel.inRead_l=__n_toscen; novel.scenario=__n_toscen;}
            __n_cl=0; _nss_progress=0; __n_value=real(__n_value); while (__n_cl<(__n_value)+1) {__n_cl+=1; file_text_readln(_file); _nss_progress+=1;}
            if (_doingfrom.object_index == novel) {novel._nss_progress = _nss_progress;}
            if (_file!=-1) {fstr = file_text_read_string(_file); show_debug_message(fstr); noread=1;}}}
    } else {
        if (__n_of_file!="") {_path=novdat.FolName[novid];
        if (filename_ext(__n_of_file) == "") {__n_of_file+=".nsdat";} if (!file_exists(current_directory()+_path+__n_of_file)) {
            if (file_exists(current_directory()+_path+"episodes\"+__n_of_file)) {__n_of_file="episodes\"+__n_of_file;}
            else if (file_exists(current_directory()+_path+"scenario\"+__n_of_file)) {__n_of_file="scenario\"+__n_of_file;}
            else if (file_exists(current_directory()+_path+"scenarios\"+__n_of_file)) {__n_of_file="scenarios\"+__n_of_file;}
            else if (file_exists(current_directory()+_path+"script\"+__n_of_file)) {__n_of_file="script\"+__n_of_file;}
            else if (file_exists(current_directory()+_path+"scripts\"+__n_of_file)) {__n_of_file="scripts\"+__n_of_file;}}
        if (file_exists(current_directory()+_path+__n_of_file)) {_file = file_text_open_read(current_directory()+_path+__n_of_file);
            if (_doingfrom.object_index == novel) {novel._file=_file; novel.inRead_l=__n_of_file; novel.scenario=__n_of_file;}
            __n_cl=0; _nss_progress=0; __n_value=real(__n_value); while (__n_cl<(__n_value)+1) {__n_cl+=1; file_text_readln(_file); _nss_progress+=1;}
            if (_doingfrom.object_index == novel) {novel._nss_progress = _nss_progress;}
            if (_file!=-1) {fstr = file_text_read_string(_file); show_debug_message(fstr); noread=1;}}}}
    ds_list_delete(_nss_script,ds_list_size(_nss_script)-1); show_debug_message('caught a eof - success: '+string(_file));}}}
