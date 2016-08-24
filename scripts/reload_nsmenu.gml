tpbackpath=tpFolName+"\"+tpBack; advBack=1; backParallax=global.backOMove; backInterpolation=global.isInterpolation;
drelement_reload(current_directory()+"\"+novdat.FolName[novid]+"\"+novdat.CustomMenu[novid],1,"DrawMenu","Draw"); firstScan=0;

_file = file_text_open_read(current_directory()+"\"+novdat.FolName[novid]+"\"+novdat.CustomMenu[novid]); if (_file != -1) {
    noread=0; _isReading=0; nss_extbegin(); nss_handle_logic(1);
    while (!file_text_eof(_file)) {if (!_isReading) {fstr=file_text_read_string(_file);
        while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
        if (nss_check("void ")) {__void = string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "));
            if (string_lower(__void) == "reload") {_isReading = 1;}}
        file_text_readln(_file); _nss_progress+=1;} else {
        if (!noread) {fstr=file_text_read_string(_file);} else {noread=0;}
        while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
        if (nss_check("void ")) {__void = string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "));
            if (string_lower(__void) != "reload") {_isReading = 0;}}
        else if (nss_check("end")) {if (ds_list_size(ifs)<=0) {_isReading = 0;} else {novelsomescript(fstr,id);}} else {novelsomescript(fstr,id);}
        if (!noread) {file_text_readln(_file); _nss_progress+=1;}}}
    file_text_close(_file); nss_extend(); nss_handle_logic(0);}

if (tpBack!="") {if (!advBack) {if (sprite_exists(eSpr)) {sprite_delete(eSpr);} eSpr=sprite_add(working_directory+tpbackpath,1,0,0,0,0); if (sprite_exists(eSpr)) {
    _ofx=sprite_get_width(eSpr)/2; _ofy=sprite_get_height(eSpr)/2; sprite_set_offset(eSpr,_ofx,_ofy);
    moffx=-(global.winSW*global.backOMove/2)+(mouse_x-view_xview)*global.backOMove; moffy=-(global.winSH*global.backOMove/2)+(mouse_y-view_yview)*global.backOMove;
    mbackx=(global.winSW+(global.winSW*global.backOMove))/((sprite_get_width(eSpr)));
    mbacky=(global.winSH+(global.winSH*global.backOMove))/((sprite_get_height(eSpr)));
    if (mbackx>mbacky) {mbacky=mbackx;} else {mbackx=mbacky;}}} else {if (instance_exists(backobj)) {with (backobj) {instance_destroy();}}
        backobj=instance_create(0,0,objSNv_background); backobj.isint=backInterpolation; backobj.rParallax=backParallax; backobj.image_path=tpbackpath;}}
