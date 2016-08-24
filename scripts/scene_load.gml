var _what,_mtype,chnum,_x1,_x2,_y1,_y2,_z1,_z2,_tfile,_imgnum,_refvalue,__imgoffxs,_imgoffys,_solid,_x,_y,_z,_imgoffx,_imgoffy,_nrmlch7,_tfiler,_rotx,_roty,_rotz,_alphatest,_lookatcamera,_sclx,_scly,_sclz,_flwcamera,_lktAt,_charState,_charName,_scenario,_usable,_actioncount,_val,_pos;

sceneDepth=9999999; if (instance_exists(objScr_gameInit)) {novid=objScr_gameInit.novid;} else if (instance_exists(novel)) {novid=novel.novid;} else {novid=-1;}
if (ds_map_size(textures)>0) {_tex = ds_map_find_first(textures);}
for (i=0;i<ds_map_size(textures);i+=1) {_va = ds_map_find_value(textures,_tex); if (sprite_exists(_va)) {sprite_delete(_va);}
    if (i<ds_map_size(textures)) {_tex = ds_map_find_next(textures,_tex);}} ds_map_clear(textures); ds_map_clear(states); ds_map_clear(objects);
if (instance_exists(obj3DObject)) {with (obj3DObject) {instance_destroy();}}
if (instance_exists(obj3DPoint)) {with (obj3DPoint) {instance_destroy();}}
if (instance_exists(par_wall)) {with (par_wall) {instance_destroy();}}
if (file_exists(current_directory()+path)) {_file = file_text_open_read(current_directory()+path); nss_extbegin(); nss_handle_logic(1);
    while(!file_text_eof(_file)) {fstr = file_text_read_string(_file); _objmode = 0; _objname = ""; nstr="";
        while (string_copy(fstr,1,1) == " ") {if (string_length(fstr) <= 1) {break;} fstr = string_copy(fstr,2,string_length(fstr)-1);}
        if (string_copy(fstr,1,string_length("object ")) == "object ") {_what = string_get_sstring(fstr,string_length("object ")+1);
            if (_what!="") {fstr=string_copy(fstr,string_length("object  ")+string_length(_what)+1,string_length(fstr)-(string_length("object  ")+string_length(_what))+1);
                while (1) {if ((string_copy(fstr,1,1) != " " && string_copy(fstr,1,1) != "=") || (string_length(fstr) <= 1)) {break;}
                fstr = string_copy(fstr,2,string_length(fstr)-1);} _objmode = 1; _objname = _what;}}
        if (string_copy(fstr,1,string_length("add ")) == "add ") {_what = string_get_sstring(fstr,string_length("add ")+1);
            if (_what != "") {_x1=0; _x2=0; _y1=0; _y2=0; _z1=0; _z2=0; _tfile=""; _mtype=0; _imgnum=1; _hrepeat=1; _vrepeat=1;
                _refvalue=-1; _imgoffxs=0; _imgoffys=0; _solid=0; _usable=0; _actioncount=0; _lktAt=noone; _charName=""; _charState="";
                _x=0; _y=0; _z=0; _imgoffx=0; _imgoffy=0; _nrmlch7=1; _tfiler=""; _rotx=0; _roty=0; _rotz=0; _alphatest=1;
                _lookatcamera=0; _sclx=1; _scly=1; _sclz=1; _flwcamera=1; _scenario=""; switch (_what) {
                    case "floor": _mtype=1; break; case "wall": _mtype=2; break; case "block": _mtype=3; break;
                    case "box": _mtype=3; break; case "cyllinder": _mtype=4; break; case "ellipse": _mtype=5; break; case "sphere": _mtype=5; break;
                    case "ellipsoid": _mtype=5; break; case "cone": _mtype=6; break; case "char": _mtype=7; break; case "sprite": _mtype=8; break;
                    case "skybox": _mtype=9; break; case "panorama": _mtype=9; break;} if (_mtype==0 && _what!="") {_mtype=8; chnum=person_exists(_what); if (chnum!=-1) {
                        _mtype=7; _nrmlch7=0; _charName = _what;}}
                if (_mtype == 9) {_sclx=6000; _scly=6000; _sclz=6000; for (i=0;i<=5;i+=1) {_tcube[i]=""; _tcuber[i]="";}}
                _pos = string_length("add  ")+string_length(_what)+1; if (_mtype == 7) {
                    if (_nrmlch7) {_charName = string_get_sstring(fstr,_pos); _charState = string_get_sstring(fstr,_pos+string_length(_charName)+1);}
                    else {_charState = string_get_sstring(fstr,_pos);} x_charState=_charState; _charState="";}
                while (_pos<string_length(fstr)) {nstr = string_get_sstring(fstr,_pos); if (nstr!="") {
                    if (string_copy(nstr,1,string_length("x:")) == "x:") {_val = string_copy(nstr,string_length("x:")+1,string_length(nstr)-string_length("x:"));
                        if (_val != "") {_x=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("y:")) == "y:") {_val = string_copy(nstr,string_length("x:")+1,string_length(nstr)-string_length("x:"));
                        if (_val != "") {_y=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("z:")) == "z:") {_val = string_copy(nstr,string_length("x:")+1,string_length(nstr)-string_length("x:"));
                        if (_val != "") {_z=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("x1:")) == "x1:") {_val = string_copy(nstr,string_length("x1:")+1,string_length(nstr)-string_length("x1:"));
                        if (_val != "") {_x1=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("y1:")) == "y1:") {_val = string_copy(nstr,string_length("x1:")+1,string_length(nstr)-string_length("x1:"));
                        if (_val != "") {_y1=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("z1:")) == "z1:") {_val = string_copy(nstr,string_length("x1:")+1,string_length(nstr)-string_length("x1:"));
                        if (_val != "") {_z1=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("x2:")) == "x2:") {_val = string_copy(nstr,string_length("x1:")+1,string_length(nstr)-string_length("x1:"));
                        if (_val != "") {_x2=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("y2:")) == "y2:") {_val = string_copy(nstr,string_length("x1:")+1,string_length(nstr)-string_length("x1:"));
                        if (_val != "") {_y2=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("z2:")) == "z2:") {_val = string_copy(nstr,string_length("x1:")+1,string_length(nstr)-string_length("x1:"));
                        if (_val != "") {_z2=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("rotx:")) == "rotx:") {_val = string_copy(nstr,string_length("rotx:")+1,string_length(nstr)-string_length("rotx:"));
                        if (_val != "") {_rotx=real(_val);}}
                    else if (string_copy(nstr,1,string_length("rotx:")) == "roty:") {_val = string_copy(nstr,string_length("rotx:")+1,string_length(nstr)-string_length("rotx:"));
                        if (_val != "") {_roty=real(_val);}}
                    else if (string_copy(nstr,1,string_length("rotx:")) == "rotz:") {_val = string_copy(nstr,string_length("rotx:")+1,string_length(nstr)-string_length("rotx:"));
                        if (_val != "") {_rotz=real(_val);}}
                    else if (string_copy(nstr,1,string_length("scalex:")) == "scalex:") {_val = string_copy(nstr,string_length("scalex:")+1,string_length(nstr)-string_length("scalex:"));
                        if (_val != "") {_sclx=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("scalex:")) == "scaley:") {_val = string_copy(nstr,string_length("scalex:")+1,string_length(nstr)-string_length("scalex:"));
                        if (_val != "") {_scly=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("scalex:")) == "scalez:") {_val = string_copy(nstr,string_length("scalex:")+1,string_length(nstr)-string_length("scalex:"));
                        if (_val != "") {_sclz=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("scale:")) == "scale:") {_val = string_copy(nstr,string_length("scale:")+1,string_length(nstr)-string_length("scale:"));
                        if (_val != "") {_sclz=string_convert_topos(_val); _sclx=_sclz; _scly=_sclz;}}
                    else if (string_copy(nstr,1,string_length("hrepeat:")) == "hrepeat:") {_val = string_copy(nstr,string_length("hrepeat:")+1,string_length(nstr)-string_length("hrepeat:"));
                        if (_val != "") {_hrepeat=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("hrepeat:")) == "vrepeat:") {_val = string_copy(nstr,string_length("hrepeat:")+1,string_length(nstr)-string_length("hrepeat:"));
                        if (_val != "") {_vrepeat=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("action:")) == "action:") {_val = string_copy(nstr,string_length("action:")+1,string_length(nstr)-string_length("action:"));
                        if (_val != "") {_usable = 1; _action[_actioncount]=(_val); _actioncount+=1;}}
                    else if (string_copy(nstr,1,string_length("scenario:")) == "scenario:") {_val = string_copy(nstr,string_length("scenario:")+1,string_length(nstr)-string_length("scenario:"));
                        if (_val != "") {_scenario=(_val);}}
                    else if (string_copy(nstr,1,string_length("lookatcamera")) == "lookatcamera") {_lookatcamera=1;}
                    else if (string_copy(nstr,1,string_length("followcamera")) == "followcamera") {_flwcamera=1;}
                    else if (string_copy(nstr,1,string_length("nofollowcamera")) == "nofollowcamera") {_flwcamera=0;}
                    else if (string_copy(nstr,1,string_length("solid")) == "solid") {_solid=1;}
                    else if (string_copy(nstr,1,string_length("lookAt:")) == "lookAt:") {_val = string_copy(nstr,string_length("lookAt:")+1,string_length(nstr)-string_length("lookAt:"));
                        if (_val != "") {if (ds_map_exists(objects,_val)) {_lktAt = ds_map_find_value(objects,_val);}}}
                    else if (string_copy(nstr,1,string_length("refvalue:")) == "refvalue:") {_val = string_copy(nstr,string_length("refvalue:")+1,string_length(nstr)-string_length("refvalue:"));
                        if (_val != "") {_refvalue=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("alphatest:")) == "alphatest:") {_val = string_copy(nstr,string_length("alphatest:")+1,string_length(nstr)-string_length("alphatest:"));
                        if (_val != "") {_alphatest=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("texnumber:")) == "texnumber:") {_val = string_copy(nstr,string_length("texnumber:")+1,string_length(nstr)-string_length("texnumber:"));
                        if (_val != "") {_imgnum=string_convert_topos(_val);}}
                    else if (string_copy(nstr,1,string_length("texoffx:")) == "texoffx:") {_val = string_copy(nstr,string_length("texoffx:")+1,string_length(nstr)-string_length("texoffx:"));
                        if (_val != "") {_imgoffx=string_convert_topos(_val); _imgoffxs=1;}}
                    else if (string_copy(nstr,1,string_length("texoffy:")) == "texoffy:") {_val = string_copy(nstr,string_length("texoffx:")+1,string_length(nstr)-string_length("texoffx:"));
                        if (_val != "") {_imgoffy=string_convert_topos(_val); _imgoffys=1;}}
                    else if (string_copy(nstr,1,string_length("texoffx:")) == "sproffx:") {_val = string_copy(nstr,string_length("texoffx:")+1,string_length(nstr)-string_length("texoffx:"));
                        if (_val != "") {_imgoffx=string_convert_topos(_val); _imgoffxs=1;}}
                    else if (string_copy(nstr,1,string_length("texoffy:")) == "sproffy:") {_val = string_copy(nstr,string_length("texoffx:")+1,string_length(nstr)-string_length("texoffx:"));
                        if (_val != "") {_imgoffy=string_convert_topos(_val); _imgoffys=1;}}
                    else if (string_copy(nstr,1,string_length("offsetx:")) == "offsetx:") {_val = string_copy(nstr,string_length("offsetx:")+1,string_length(nstr)-string_length("offsetx:"));
                        if (_val != "") {_imgoffx=string_convert_topos(_val); _imgoffxs=1;}}
                    else if (string_copy(nstr,1,string_length("offsety:")) == "offsety:") {_val = string_copy(nstr,string_length("offsetx:")+1,string_length(nstr)-string_length("offsetx:"));
                        if (_val != "") {_imgoffy=string_convert_topos(_val); _imgoffys=1;}}
                    else if (string_copy(nstr,1,string_length("offsetx:")) == "xoffset:") {_val = string_copy(nstr,string_length("offsetx:")+1,string_length(nstr)-string_length("offsetx:"));
                        if (_val != "") {_imgoffx=string_convert_topos(_val); _imgoffxs=1;}}
                    else if (string_copy(nstr,1,string_length("offsety:")) == "yoffset:") {_val = string_copy(nstr,string_length("offsetx:")+1,string_length(nstr)-string_length("offsetx:"));
                        if (_val != "") {_imgoffy=string_convert_topos(_val); _imgoffys=1;}}
                    else if (string_copy(nstr,1,string_length("texture:")) == "texture:") {_val = string_copy(nstr,string_length("texture:")+1,string_length(nstr)-string_length("texture:"));
                        if (_val != "") {_tfiler=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tfile=current_directory()+(_val);} else {_tfile=filename_path(path)+(_val);}}}
                    else if (nst_check("cuben:") || nst_check("cubef:")) {_val = string_copy(nstr,string_length("cubef:")+1,string_length(nstr)-string_length("cubef:"));
                        if (string_copy(_val,1,1) == '"') {_val = (string_get_tillsymbol(fstr,_pos+string_length("cubef:")+1,'"'));}
                        if (_val != "") {_tcuber[0]=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tcube[0]=current_directory()+(_val);} else {_tcube[0]=current_directory()+filename_path(path)+(_val);}}}
                    else if (nst_check("cubee:") || nst_check("cuber:")) {_val = string_copy(nstr,string_length("cubef:")+1,string_length(nstr)-string_length("cubef:"));
                        if (string_copy(_val,1,1) == '"') {_val = (string_get_tillsymbol(fstr,_pos+string_length("cubef:")+1,'"'));}
                        if (_val != "") {_tcuber[1]=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tcube[1]=current_directory()+(_val);} else {_tcube[1]=current_directory()+filename_path(path)+(_val);}}}
                    else if (nst_check("cubes:") || nst_check("cubek:")) {_val = string_copy(nstr,string_length("cubef:")+1,string_length(nstr)-string_length("cubef:"));
                        if (string_copy(_val,1,1) == '"') {_val = (string_get_tillsymbol(fstr,_pos+string_length("cubef:")+1,'"'));}
                        if (_val != "") {_tcuber[2]=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tcube[2]=current_directory()+(_val);} else {_tcube[2]=current_directory()+filename_path(path)+(_val);}}}
                    else if (nst_check("cubew:") || nst_check("cubel:")) {_val = string_copy(nstr,string_length("cubef:")+1,string_length(nstr)-string_length("cubef:"));
                        if (string_copy(_val,1,1) == '"') {_val = (string_get_tillsymbol(fstr,_pos+string_length("cubef:")+1,'"'));}
                        if (_val != "") {_tcuber[3]=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tcube[3]=current_directory()+(_val);} else {_tcube[3]=current_directory()+filename_path(path)+(_val);}}}
                    else if (nst_check("cubeu:") || nst_check("cubet:")) {_val = string_copy(nstr,string_length("cubef:")+1,string_length(nstr)-string_length("cubef:"));
                       if (string_copy(_val,1,1) == '"') {_val = (string_get_tillsymbol(fstr,_pos+string_length("cubef:")+1,'"'));} 
                        if (_val != "") {_tcuber[4]=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tcube[4]=current_directory()+(_val);} else {_tcube[4]=current_directory()+filename_path(path)+(_val);}}}
                    else if (nst_check("cubed:") || nst_check("cubeb:")) {_val = string_copy(nstr,string_length("cubef:")+1,string_length(nstr)-string_length("cubef:"));
                        if (string_copy(_val,1,1) == '"') {_val = (string_get_tillsymbol(fstr,_pos+string_length("cubef:")+1,'"'));}
                        if (_val != "") {_tcuber[5]=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tcube[5]=current_directory()+(_val);} else {_tcube[5]=current_directory()+filename_path(path)+(_val);}}}
                    else if (nst_check("sprite:")) {_val = string_copy(nstr,string_length("sprite:")+1,string_length(nstr)-string_length("sprite:"));
                        if (_val != "") {_tfiler=_val; if (string_copy(_val,1,string_length("Stuff\")) == "Stuff\" || string_copy(_val,1,string_length("Stuff\")) == "Stuff/") {
                            _tfile=current_directory()+(_val);} else {_tfile=filename_path(path)+(_val);}}}
                    else {if (_mtype == 7) {_charState=x_charState;}}}
                _pos+=string_length(nstr)+1;} _obj=instance_create(0,0,obj3DObject); _obj.x = _x; _obj.y = _y; _obj.z = _z; _obj.type = _mtype;
                    _pass=1; chnum=-1; if (_mtype==7) {_obj.texture = -1; chnum=-1; if (_charName != "") {chnum=person_exists(_charName);
                        if (chnum!=-1) {_pass=0; _obj.imp=1; _obj.sprState="####look for array"; if (_charState!="") {_obj.statearray[0]=_charState; _obj.statearrayc=1;}
                            _obj.chid = chnum; _obj.bnum = chnum; if (_objmode) {if (ds_map_exists(prestates,_objname)) {
                            _obj.sprState = ds_map_find_value(prestates,_objname); ds_map_replace(states,_objname,_obj.sprState);}}}}
                        if ((_charState == "" && _charName != "") || chnum == -1) {}}
                    if (_mtype==9) {_pass=0;}
                    if (_pass) {if (_tfiler!="") {_obj.tfile = _tfiler; if (ds_map_exists(textures,_tfiler)) {_spr = ds_map_find_value(textures,_tfiler);
                        if (!sprite_exists(_spr)) {_spr = sprite_add(_tfile,_imgnum,0,0,_imgoffx,_imgoffy);
                            if (sprite_exists(_spr)) {_offtosetx=_imgoffx; _offtosety=_imgoffy; if (!_imgoffxs) {_offtosetx=sprite_get_width(_spr)/2;}
                                if (!_imgoffys) {_offtosety=sprite_get_height(_spr)/2;} sprite_set_offset(_spr,_offtosetx,_offtosety);
                                ds_map_replace(textures,_tfiler,_spr); _obj.texture = _spr;}
                        } else {_obj.texture = _spr;}} else {_spr = sprite_add(_tfile,_imgnum,0,0,_imgoffx,_imgoffy);
                            if (sprite_exists(_spr)) {_offtosetx=_imgoffx; _offtosety=_imgoffy; if (!_imgoffxs) {_offtosetx=sprite_get_width(_spr)/2;}
                                if (!_imgoffys) {if (_mtype==7) {_offtosety=sprite_get_height(_spr);} else {_offtosety=sprite_get_height(_spr)/2;}}
                                sprite_set_offset(_spr,_offtosetx,_offtosety);
                                ds_map_add(textures,_tfiler,_spr); _obj.texture = _spr;}}}}
                    if (_mtype == 9) {for (i=0;i<=5;i+=1) {_cube[i]=sprNoTexture;
                        if (_tcuber[i]!="") {_obj.cfile[i] = _tcuber[i]; if (ds_map_exists(textures,_tcuber[i])) {_cube[i] = ds_map_find_value(textures,_tcuber[i]);}
                        else {_cube[i] = sprite_add(_tcube[i],1,0,0,0,0); if (sprite_exists(_cube[i])) {ds_map_add(textures,_tcuber[i],_cube[i]);}}}}
                        with (_obj) {panorama_init(other._cube[0],other._cube[1],other._cube[2],other._cube[3],other._cube[4],other._cube[5]);}}
                    _obj.x1 = _x1; _obj.y1 = _y1; _obj.z1 = _z1; _obj.x2 = _x2; _obj.y2 = _y2; _obj.z2 = _z2; _obj.isSolid = _solid; _obj.alphatest=_alphatest;
                    _obj.depth = sceneDepth; sceneDepth-=2; _obj.charState = _charState; _obj.charName = _charName; _obj.followCamera=_flwcamera;
                    _obj.sclx = _sclx; _obj.scly = _scly; _obj.sclz = _sclz; _obj.isUsable = _usable; _obj.novid=novel.novid; _obj.refvalue=_refvalue;
                    _obj.hrepeat=_hrepeat; _obj.vrepeat=_vrepeat;
                    _obj.scenario = _scenario; _obj.lookAt = _lktAt; _obj.action = ds_list_create(); for (i_=0;i_<_actioncount;i_+=1) {ds_list_add(_obj.action,_action[i_]);}
                    _obj.rotx = _rotx; _obj.roty = _roty; _obj.rotz = _rotz; _obj.lookAtCamera=_lookatcamera; if (_objmode) {_obj.onvarName=_objname; ds_map_replace(objects,_objname,_obj);}
                    if (chnum!=-1) {with (_obj) {d3dobject_alarm0();}}}}
        else {novelsomescript(fstr,id);}
        file_text_readln(_file);}
    file_text_close(_file); nss_extend();} ds_map_clear(prestates);
