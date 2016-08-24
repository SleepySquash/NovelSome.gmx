skin_reset();
if (file_exists(argument0)) {
    _file = file_text_open_read(argument0); if (_file==-1) {exit;} fstr = file_text_read_string(_file);
    _isIni=0; _noread=1; if (string_copy(fstr,1,1) == "[") {_isIni=1; file_text_close(_file);}
if (!_isIni) {folname=string(argument1); if (!is_string(argument1)) {folname=skindat.FolName[argument1];}
    global.dialBoxBorderedTexture=0; _file = file_text_open_read(argument0); nss_extbegin(); _isReading=0;
    noread=0; while (!file_text_eof(_file)) {if (!_isReading) {
        while (!_isReading) {if (file_text_eof(_file)) {break;} if (!noread) {fstr = file_text_read_string(_file);} else {noread=0;}
            while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            if (nss_check("void ")) {__vname = string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "));
                while (string_copy(__vname,1,1) == " ") {if (string_length(__vname)<=1) {__vname=""; break;} __vname = string_copy(__vname,2,string_length(__vname)-1);}
                while (string_copy(__vname,string_length(__vname),1) == " ") {if (string_length(__vname)<=1) {__vname=""; break;} __vname = string_copy(__vname,1,string_length(__vname)-1);}
                ds_map_replace(skindat.events,string_lower(__vname),1);}
            if (string_lower(string_copy(fstr,1,string_length("void load"))) == "void load") {_isReading = 1;}
            else if (string_lower(string_copy(fstr,1,string_length("void onload"))) == "void onload") {_isReading = 1;}
            else if (string_lower(string_copy(fstr,1,string_length("event load"))) == "event load") {_isReading = 1;}
            else if (string_lower(string_copy(fstr,1,string_length("event onload"))) == "event onload") {_isReading = 1;}
            file_text_readln(_file); _nss_progress+=1;}
        } else {if (!noread) {fstr = file_text_read_string(_file);} else {noread=0;}
            while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            if (nss_check("void ")) {__vname = string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "));
                while (string_copy(__vname,1,1) == " ") {if (string_length(__vname)<=1) {__vname=""; break;} __vname = string_copy(__vname,2,string_length(__vname)-1);}
                while (string_copy(__vname,string_length(__vname),1) == " ") {if (string_length(__vname)<=1) {__vname=""; break;} __vname = string_copy(__vname,1,string_length(__vname)-1);}
                ds_map_replace(skindat.events,string_lower(__vname),1);}
            if (string_lower(string_copy(fstr,1,string_length("end"))) == "end") {_isReading = 0;}
            else if (string_lower(string_copy(fstr,1,string_length("void "))) == "void ") {
                _str=string_lower(string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void ")));
                if (_str != "load" && _str != "onload") {_isReading = 0;}}
            else if (string_lower(string_copy(fstr,1,string_length("event "))) == "event ") {
                _str=string_lower(string_copy(fstr,string_length("event ")+1,string_length(fstr)-string_length("event ")));
                if (_str != "load" && _str != "onload") {_isReading = 0;}}
            else {novelsomescript(fstr,init);}
            if (!noread) {file_text_readln(_file); _nss_progress+=1;}}}
    file_text_close(_file); nss_extend();
    
    if (ds_map_exists(skindat.events,"dialogue")) {_file = file_text_open_read(argument0); _isReading=0; nss_extbegin(); noread=0;
    while (!file_text_eof(_file)) {if (!_isReading) {
        while (!_isReading) {if (file_text_eof(_file)) {break;} fstr = file_text_read_string(_file);
            while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            if (string_lower(string_copy(fstr,1,string_length("void dialogue"))) == "void dialogue") {_isReading = 1;}
            else if (string_lower(string_copy(fstr,1,string_length("event dialogue"))) == "event dialogue") {_isReading = 1;} file_text_readln(_file); _nss_progress+=1;}
        } else {if (!noread) {fstr = file_text_read_string(_file);} else {noread=0;}
            while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            if (nss_check("end")) {_isReading = 0;}
            else if (nss_check("void")) {
                if (string_lower(string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "))) != "dialogue") {_isReading = 0;}}
            else if (nss_check("event")) {
                if (string_lower(string_copy(fstr,string_length("event ")+1,string_length(fstr)-string_length("event "))) != "dialogue") {_isReading = 0;}}
            else if (nss_check("DialogueMaxAlpha")) {_str1=string_copy(fstr,string_length("DialogueMaxAlpha")+1,string_length(fstr)-string_length("DialogueMaxAlpha"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialMaxAlpha=real(_str1);}}
            else if (nss_check("DialogueTextOffFromCenter")) {_str1=string_copy(fstr,string_length("DialogueTextOffFromCenter")+1,string_length(fstr)-string_length("DialogueTextOffFromCenter"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.DialogueTextOffFromCenter=_str1;}}
            else if (nss_check("DialogueTextOffx")) {_str1=string_copy(fstr,string_length("DialogueTextOffx")+1,string_length(fstr)-string_length("DialogueTextOffx"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTxtOffx=real(_str1);}}
            else if (nss_check("DialogueTextOffy")) {_str1=string_copy(fstr,string_length("DialogueTextOffy")+1,string_length(fstr)-string_length("DialogueTextOffy"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTxtOffy=real(_str1);}}
            else if (nss_check("DialogueAlphaGain")) {_str1=string_copy(fstr,string_length("DialogueAlphaGain")+1,string_length(fstr)-string_length("DialogueAlphaGain"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialAlphaGain=real(_str1);}}
            else if (nss_check("DialogueIsTextOutlined")) {_str1=string_copy(fstr,string_length("DialogueIsTextOutlined")+1,string_length(fstr)-string_length("DialogueIsTextOutlined"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTextOl=real(_str1);}}
            else if (nss_check("DialogueIsNameOutlined")) {_str1=string_copy(fstr,string_length("DialogueIsNameOutlined")+1,string_length(fstr)-string_length("DialogueIsNameOutlined"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialNTextOl=real(_str1);}}
            else if (nss_check("DialogueBoxOffx")) {_str1=string_copy(fstr,string_length("DialogueBoxOffx")+1,string_length(fstr)-string_length("DialogueBoxOffx"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialBoxOffx=real(_str1);}}
            else if (nss_check("DialogueBoxOffy")) {_str1=string_copy(fstr,string_length("DialogueBoxOffx")+1,string_length(fstr)-string_length("DialogueBoxOffx"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialBoxOffy=real(_str1);}}
            else if (nss_check("DialogueBoxHeight")) {_str1=string_copy(fstr,string_length("DialogueBoxHeight")+1,string_length(fstr)-string_length("DialogueBoxHeight"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialBoxHeight=real(_str1);}}
            else if (nss_check("DialogueBoxNoScale")) {_str1=string_copy(fstr,string_length("DialogueBoxNoScale")+1,string_length(fstr)-string_length("DialogueBoxNoScale"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialBoxNoScale=real(_str1);}}
            else if (nss_check("DialogueFBoxOffx")) {_str1=string_copy(fstr,string_length("DialogueFBoxOffy")+1,string_length(fstr)-string_length("DialogueFBoxOffy"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFBoxOffx=real(_str1);}}
            else if (nss_check("DialogueFBoxOffy")) {_str1=string_copy(fstr,string_length("DialogueFBoxOffy")+1,string_length(fstr)-string_length("DialogueFBoxOffy"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFBoxOffy=real(_str1);}}
            else if (nss_check("DialogueFBoxTextOffFromCenter")) {_str1=string_copy(fstr,string_length("DialogueFBoxTextOffFromCenter")+1,string_length(fstr)-string_length("DialogueFBoxTextOffFromCenter"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFOffFromCenter=real(_str1);}}
            else if (nss_check("DialogueFBoxTextOffx")) {_str1=string_copy(fstr,string_length("DialogueFBoxTextOffx")+1,string_length(fstr)-string_length("DialogueFBoxTextOffx"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFTxtOffx=real(_str1);}}
            else if (nss_check("DialogueFBoxTextOffy")) {_str1=string_copy(fstr,string_length("DialogueFBoxTextOffx")+1,string_length(fstr)-string_length("DialogueFBoxTextOffx"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFTxtOffy=real(_str1);}}
            else if (nss_check("DialogueFBoxNoScale")) {_str1=string_copy(fstr,string_length("DialogueFBoxNoScale")+1,string_length(fstr)-string_length("DialogueFBoxNoScale"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFBoxNoScale=real(_str1);}}
            else if (nss_check("DialogueFBoxMaxAlpha")) {_str1=string_copy(fstr,string_length("DialogueFBoxMaxAlpha")+1,string_length(fstr)-string_length("DialogueFBoxMaxAlpha"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialFMaxAlpha=real(_str1);}}
            else if (nss_check("DialogueNBoxOffx")) {_str1=string_copy(fstr,string_length("DialogueNBoxOffx")+1,string_length(fstr)-string_length("DialogueNBoxOffx"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialNBoxOffx=real(_str1);}}
            else if (nss_check("DialogueNBoxOffy")) {_str1=string_copy(fstr,string_length("DialogueNBoxOffy")+1,string_length(fstr)-string_length("DialogueNBoxOffy"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialNBoxOff=real(_str1);}}
            else if (nss_check("DialogueNBoxWidth")) {_str1=string_copy(fstr,string_length("DialogueNBoxWidth")+1,string_length(fstr)-string_length("DialogueNBoxWidth"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialNBoxWidth=real(_str1);}}
            else if (nss_check("DialogueNBoxHeight")) {_str1=string_copy(fstr,string_length("DialogueNBoxHeight")+1,string_length(fstr)-string_length("DialogueNBoxHeight"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialNBoxHeight=real(_str1);}}
            else if (nss_check("DialogueBackMaxAlpha")) {_str1=string_copy(fstr,string_length("DialogueBackMaxAlpha")+1,string_length(fstr)-string_length("DialogueBackMaxAlpha"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialBackAlpha=real(_str1);}}
            else if (nss_check("DialogueTextSep")) {_str1=string_copy(fstr,string_length("DialogueTextSep")+1,string_length(fstr)-string_length("DialogueTextSep"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTextSep=real(_str1);}}
            else if (nss_check("DialogueTextWidth")) {_str1=string_copy(fstr,string_length("DialogueTextWidth")+1,string_length(fstr)-string_length("DialogueTextWidth"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTextWidth=real(_str1);}}
            else if (nss_check("DialogueBoxBorderedTexture")) {_str1=string_copy(fstr,string_length("DialogueBoxBorderedTexture")+1,string_length(fstr)-string_length("DialogueBoxBorderedTexture"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialBoxBorderedTexture=real(_str1);}}
            else if (nss_check("DialogueColoredBack")) {_str1=string_copy(fstr,string_length("DialogueColoredBack")+1,string_length(fstr)-string_length("DialogueColoredBack"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialIsCback=real(_str1);}}
            else if (nss_check("DialogueForcedBackColor")) {_str1=string_copy(fstr,string_length("DialogueForcedBackColor")+1,string_length(fstr)-string_length("DialogueForcedBackColor"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialForcedBClr=real(_str1);}}
            else if (nss_check("DialogueTextClr")) {_str1=string_copy(fstr,string_length("DialogueTextClr")+1,string_length(fstr)-string_length("DialogueTextClr"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTextClr=string_fstr_to_color(_str1);}}
            else if (nss_check("DialogueTextOClr")) {_str1=string_copy(fstr,string_length("DialogueTextOClr")+1,string_length(fstr)-string_length("DialogueTextOClr"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialTextOClr=string_fstr_to_color(_str1);}}
            else if (nss_check("DialogueChooseClr")) {_str1=string_copy(fstr,string_length("DialogueChooseClr")+1,string_length(fstr)-string_length("DialogueChooseClr"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); global.dialChooseClr=string_fstr_to_color(_str1);}}
            else if (nss_check("DialogueTextFont")) {_str1=string_copy(fstr,string_length("DialogueTextFont")+1,string_length(fstr)-string_length("DialogueTextFont"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (_str1!=string(global.dialTextFont_t)) {
                        global.dialTextFont_t=_str1; global.dialTextFont=convertToFont(_str1);}
                    global.dDrawFont=global.dialTextFont; global.dDrawFont_t=global.dialTextFont_t;}}
            else if (nss_check("MenuMusic")) {_str1=string_copy(fstr,string_length("MenuMusic")+1,string_length(fstr)-string_length("MenuMusic"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (string_copy(_str1,1,1) == '"') {
                    _str2=string_get_tillsymbol(_str1,2,'"'); __MenuMusic=_str2; if (string_length(_str1)>(string_length(_str2)+3)) {
                    if (string_copy(_str1,string_length(_str2)+3+1,5) == "from ") {
                        _str2 = string_get_tillsymbol(_str1,string_length(_str2)+3+5+1,' ');
                        global.musicMStart = real(_str2);}}} else {__MenuMusic = _str1; global.musicMStart = 0;}
                    _setting=0; if (object_index==novel) {_setting=settingSkinIngame;} _path1=folname+__MenuMusic;
                    if (__MenuMusic!="" && !_setting) {if (file_exists(current_directory()+_path1)) {cp=0;
                        if (!global.frSkScan && !instance_exists(objScr_gameInit) && room!=room_game && !global.loading) {
                            cp=1; if (global.menuInited) {if (room==room_nmenu) {cp=0;}}
                        if (cp) {music_play_path(_path1); music_set_seek(global.musicMStart);
                            global.mFadeOut=300; global.mFadeIn=300;}} global.menuMusic=_path1;}
                    else {cp=0; if (!global.frSkScan && !instance_exists(objScr_gameInit) && room!=room_game && !global.loading) {
                        cp=1; if (global.menuInited) {if (room==room_nmenu) {cp=0;}}
                        if (cp) {music_play_path(global.menuSMusic); music_set_seek(global.musicMStart);
                            global.mFadeOut=300; global.mFadeIn=300;}} global.menuMusic=global.menuSMusic;}}}}
            else if (nss_check("MenuBackground")) {_str1=string_copy(fstr,string_length("MenuBackground")+1,string_length(fstr)-string_length("MenuBackground"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (file_exists(current_directory()+folname+"\"+_str1)) {global.mBack_path=folname+"\"+_str1;
                    if (global.mBack_path!=global.mSBack_path) {if (sprite_exists(global.menuBackground)) {sprite_delete(global.menuBackground);}
                        global.menuBackground=sprite_add(current_directory()+global.mBack_path,1,0,0,0,0);}
                    if (!sprite_exists(global.menuBackground)) {global.mBack_path=global.mSBack_path; global.menuBackground=sprite_add(working_directory+global.mBack_path,1,0,0,0,0);}
                    else {sprite_set_offset(global.menuBackground,sprite_get_width(global.menuBackground)/2,sprite_get_height(global.menuBackground)/2);}
                    sprite_set_offset(global.menuBackground,sprite_get_width(global.menuBackground)/2,sprite_get_height(global.menuBackground)/2);}}}
            else if (nss_check("MenuBackgroundBlur")) {_str1=string_copy(fstr,string_length("MenuBackgroundBlur")+1,string_length(fstr)-string_length("MenuBackgroundBlur"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (file_exists(current_directory()+folname+"\"+_str1)) {global.mBackBlur_path=folname+"\"+_str1;
                    if (global.mBackBlur_path!=global.mSBackBlur_path) {if (sprite_exists(global.menuBackgroundBlur)) {sprite_delete(global.menuBackgroundBlur);}
                        global.menuBackgroundBlur=sprite_add(current_directory()+global.mBackBlur_path,1,0,0,0,0);}
                    if (!sprite_exists(global.menuBackgroundBlur)) {global.mBackBlur_path=global.mSBackBlur_path; global.menuBackgroundBlur=sprite_add(working_directory+global.mBackBlur_path,1,0,0,0,0);}
                    else {sprite_set_offset(global.menuBackgroundBlur,sprite_get_width(global.menuBackgroundBlur)/2,sprite_get_height(global.menuBackgroundBlur)/2);}
                    sprite_set_offset(global.menuBackgroundBlur,sprite_get_width(global.menuBackgroundBlur)/2,sprite_get_height(global.menuBackgroundBlur)/2);}}}
            else if (nss_check("dialogueBox")) {_str1=string_copy(fstr,string_length("dialogueBox")+1,string_length(fstr)-string_length("dialogueBox"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (_str1!="") {_skimgofx=0; _skimgofy=0; _skimgnum=1;
                if (string_copy(_str1,1,1) == '"') {_str0=string_get_tillsymbol(_str1,2,'"');
                    if (string_length(_str1)>string_length(_str0)+4) {
                        ipos = string_length(_str0)+4; while (ipos<string_length(_str1)) {
                            _str2=string_get_tillsymbol2(_str1,ipos," ",",");
                            if (string_copy(_str2,1,string_length("offsetx:")) == "offsetx:") {
                                _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));
                                _skimgofx=string_convert_topos(_str3);}
                            else if (string_copy(_str2,1,string_length("offsetx:")) == "offsety:") {
                                _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));
                                _skimgofy=string_convert_topos(_str3);}
                            else if (string_copy(_str2,1,string_length("number:")) == "number:") {
                                _str3=string_copy(_str2,string_length("number:")+1,string_length(_str2)-string_length("number:"));
                                _skimgnum=string_convert_topos(_str3);}
                            ipos+=string_length(_str2)+1;}}}
                else {_str0 = _str1;} if (file_exists(current_directory()+folname+"\"+_str0)) {
                    global.dialBox=sprite_add(current_directory()+folname+"\"+_str0,_skimgnum,0,0,_skimgofx,_skimgofy);}}}}
            else if (nss_check("dialogueNamebox")) {_str1=string_copy(fstr,string_length("dialogueNamebox")+1,string_length(fstr)-string_length("dialogueNamebox"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (_str1!="") {_skimgofx=0; _skimgofy=0; _skimgnum=1;
                if (string_copy(_str1,1,1) == '"') {_str0=string_get_tillsymbol(_str1,2,'"');
                    if (string_length(_str1)>string_length(_str0)+4) {
                        ipos = string_length(_str0)+4; while (ipos<string_length(_str1)) {
                            _str2=string_get_tillsymbol2(_str1,ipos," ",",");
                            if (string_copy(_str2,1,string_length("offsetx:")) == "offsetx:") {
                                _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));
                                _skimgofx=string_convert_topos(_str3);}
                            else if (string_copy(_str2,1,string_length("offsetx:")) == "offsety:") {
                                _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));
                                _skimgofy=string_convert_topos(_str3);}
                            else if (string_copy(_str2,1,string_length("number:")) == "number:") {
                                _str3=string_copy(_str2,string_length("number:")+1,string_length(_str2)-string_length("number:"));
                                _skimgnum=string_convert_topos(_str3);}
                            ipos+=string_length(_str2)+1;}}}
                else {_str0 = _str1;} if (file_exists(current_directory()+folname+"\"+_str0)) {
                    global.dialNamebox=sprite_add(current_directory()+folname+"\"+_str0,_skimgnum,0,0,_skimgofx,_skimgofy);}}}}
            else if (nss_check("dialogueFullbox")) {_str1=string_copy(fstr,string_length("dialogueFullbox")+1,string_length(fstr)-string_length("dialogueFullbox"));
                if (_str1!="") {_str1=string_nospaceoreq(_str1); if (_str1!="") {_skimgofx=0; _skimgofy=0; _skimgnum=1;
                if (string_copy(_str1,1,1) == '"') {_str0=string_get_tillsymbol(_str1,2,'"');
                    if (string_length(_str1)>string_length(_str0)+4) {
                        ipos = string_length(_str0)+4; while (ipos<string_length(_str1)) {
                            _str2=string_get_tillsymbol2(_str1,ipos," ",",");
                            if (string_copy(_str2,1,string_length("offsetx:")) == "offsetx:") {
                                _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));
                                _skimgofx=string_convert_topos(_str3);}
                            else if (string_copy(_str2,1,string_length("offsetx:")) == "offsety:") {
                                _str3=string_copy(_str2,string_length("offsetx:")+1,string_length(_str2)-string_length("offsetx:"));
                                _skimgofy=string_convert_topos(_str3);}
                            else if (string_copy(_str2,1,string_length("number:")) == "number:") {
                                _str3=string_copy(_str2,string_length("number:")+1,string_length(_str2)-string_length("number:"));
                                _skimgnum=string_convert_topos(_str3);}
                            ipos+=string_length(_str2)+1;}}}
                else {_str0 = _str1;} if (file_exists(current_directory()+folname+"\"+_str0)) {
                    global.dialFullbox=sprite_add(current_directory()+folname+"\"+_str0,_skimgnum,0,0,_skimgofx,_skimgofy);}}}}
            else {novelsomescript(fstr,init);}
            if (!noread) {file_text_readln(_file); _nss_progress+=1;}}} nss_extend(); file_text_close(_file);}
    
    if (ds_map_exists(skindat.events,"drawdialogue")) {skindat.drawDialogueFrom=argument0;}
    if (ds_map_exists(skindat.events,"drawgamepause")) {skindat.drawGamePauseFrom=argument0;}
    if (ds_map_exists(skindat.events,"drawloading")) {skindat.drawLoadingFrom=argument0;}
    if (ds_map_exists(skindat.events,"drawsave")) {skindat.drawSaveFrom=argument0;}
    if (ds_map_exists(skindat.events,"drawload")) {skindat.drawLoadFrom=argument0;}
    if (ds_map_exists(skindat.events,"drawoptions")) {skindat.drawOptionsFrom=argument0;}}
if (_isIni) {ini_open(argument0);
    folname=string(argument1); if (!is_string(argument1)) {folname=skindat.FolName[argument1];}
    global.dialMaxAlpha=ini_read_real("SKINDATA","DialogueMaxAlpha",global.dialMaxAlpha);
    global.dialOffFromCenter=ini_read_real("SKINDATA","DialogueTextOffFromCenter",global.dialOffFromCenter);
    global.dialTxtOffx=ini_read_real("SKINDATA","DialogueTextOffx",global.dialTxtOffx);
    global.dialTxtOffy=ini_read_real("SKINDATA","DialogueTextOffy",global.dialTxtOffy);
    global.dialAlphaGain=ini_read_real("SKINDATA","DialogueAlphaGain",global.dialAlphaGain);
    global.dialTextOl=ini_read_real("SKINDATA","DialogueIsTextOutlined",global.dialTextOl);
    global.dialNTextOl=ini_read_real("SKINDATA","DialogueIsNameOutlined",global.dialNTextOl);
    global.dialBoxOffx=ini_read_real("SKINDATA","DialogueBoxOffx",global.dialBoxOffx);
    global.dialBoxOffy=ini_read_real("SKINDATA","DialogueBoxOffy",global.dialBoxOffy);
    global.dialBoxHeight=ini_read_real("SKINDATA","DialogueBoxHeight",global.dialBoxHeight);
    global.dialBoxNoScale=ini_read_real("SKINDATA","DialogueBoxNoScale",global.dialBoxNoScale);
    global.dialFBoxOffx=ini_read_real("SKINDATA","DialogueFBoxOffx",global.dialFBoxOffx);
    global.dialFBoxOffy=ini_read_real("SKINDATA","DialogueFBoxOffy",global.dialFBoxOffy);
    global.dialFOffFromCenter=ini_read_real("SKINDATA","DialogueFBoxTextOffFromCenter",global.dialFOffFromCenter);
    global.dialFTxtOffx=ini_read_real("SKINDATA","DialogueFBoxTextOffx",global.dialFTxtOffx);
    global.dialFTxtOffy=ini_read_real("SKINDATA","DialogueFBoxTextOffy",global.dialFTxtOffy);
    global.dialFBoxNoScale=ini_read_real("SKINDATA","DialogueFBoxNoScale",global.dialFBoxNoScale);
    global.dialFMaxAlpha=ini_read_real("SKINDATA","DialogueFBoxMaxAlpha",global.dialMaxAlpha);
    global.dialNBoxOff=ini_read_real("SKINDATA","DialogueNBoxOff",global.dialNBoxOff);
    global.dialNBoxOffx=ini_read_real("SKINDATA","DialogueNBoxOffx",global.dialNBoxOffx);
    global.dialNBoxWidth=ini_read_real("SKINDATA","DialogueNBoxWidth",global.dialNBoxWidth);
    global.dialNBoxHeight=ini_read_real("SKINDATA","DialogueNBoxHeight",global.dialNBoxHeight);
    global.dialBackAlpha=ini_read_real("SKINDATA","DialogueBackMaxAlpha",global.dialBackAlpha);
    global.dialTextSep=ini_read_real("SKINDATA","DialogueTextSep",global.dialTextSep);
    global.dialTextWidth=ini_read_real("SKINDATA","DialogueTextWidth",global.dialTextWidth);
    global.dialBoxBorderedTexture=ini_read_real("SKINDATA","DialogueBoxBorderedTexture",0);
    global.mButtonClr=ini_make_color("SKINDATA","MenuButtonColor_",global.mButtonClr);
    global.mButtonOutClr=ini_make_color("SKINDATA","MenuButtonOutcolor_",global.mButtonOutClr);
    global.dialChooseClr=ini_make_color("SKINDATA","DialogueChooseClr_",global.dialChooseClr);
    global.dialTextClr=ini_make_color("SKINDATA","DialogueTextClr_",global.dialTextClr);
    global.dialTextOClr=ini_make_color("SKINDATA","DialogueTextOClr_",global.dialTextOClr);
    _txt=ini_read_string("SKINDATA","DialogueTextFont",global.dialTextFont);
        if (string(_txt)!=string(global.dialTextFont)) {global.dialTextFont_t=_txt; global.dialTextFont=convertToFont(_txt);}
        global.dDrawFont=global.dialTextFont; global.dDrawFont_t=global.dialTextFont_t;
    global.dialIsCback=ini_read_real("SKINDATA","DialogueColoredBack",global.dialIsCback);
    global.dialForcedBClr=ini_read_real("SKINDATA","DialogueForcedBackColor",global.dialForcedBClr);
    global.dialBackClr=ini_make_color("SKINDATA","DialogueBackClr_",global.dialBackClr);
    global.dialBackOutclr=ini_make_color("SKINDATA","DialogueBackOutclr_",global.dialBackOutclr);
    global.musicMStart=ini_read_real("SKINDATA","MenuMusicStart",0); __MenuMusic=ini_read_string("SKINDATA","MenuMusic","");
    _setting=0; if (object_index==novel) {_setting=settingSkinIngame;}
    _path1=folname+__MenuMusic; if (__MenuMusic!="" && !_setting) {if (file_exists(current_directory()+_path1)) {cp=0;
        if (!global.frSkScan && !instance_exists(objScr_gameInit) && room!=room_game && !global.loading) {cp=1; if (global.menuInited) {if (room==room_nmenu) {cp=0;}}
        if (cp) {music_play_path(_path1); music_set_seek(global.musicMStart); global.mFadeOut=300; global.mFadeIn=300;}} global.menuMusic=_path1;}
        else {cp=0; if (!global.frSkScan && !instance_exists(objScr_gameInit) && room!=room_game && !global.loading) {cp=1; if (global.menuInited) {if (room==room_nmenu) {cp=0;}}
            if (cp) {music_play_path(global.menuSMusic); music_set_seek(global.musicMStart); global.mFadeOut=300; global.mFadeIn=300;}} global.menuMusic=global.menuSMusic;}}
    _path1=folname+"\"+ini_read_string("SKINDATA","MenuBackground",""); if (file_exists(current_directory()+_path1)) {global.mBack_path=_path1;}
        else {global.mBack_path=global.mSBack_path;}
    _path1=folname+"\"+ini_read_string("SKINDATA","MenuBackgroundBlur",""); if (file_exists(current_directory()+_path1)) {global.mBackBlur_path=_path1;}
        else {global.mBackBlur_path=global.mSBackBlur_path;}
    if (global.mBack_path!=global.mSBack_path) {if (sprite_exists(global.menuBackground)) {sprite_delete(global.menuBackground);}
        global.menuBackground=sprite_add(current_directory()+global.mBack_path,1,0,0,0,0);}
    if (!sprite_exists(global.menuBackground)) {global.mBack_path=global.mSBack_path; global.menuBackground=sprite_add(working_directory+global.mBack_path,1,0,0,0,0);}
    else {sprite_set_offset(global.menuBackground,sprite_get_width(global.menuBackground)/2,sprite_get_height(global.menuBackground)/2);}
    sprite_set_offset(global.menuBackground,sprite_get_width(global.menuBackground)/2,sprite_get_height(global.menuBackground)/2);
    if (global.mBackBlur_path!=global.mSBackBlur_path) {if (sprite_exists(global.menuBackgroundBlur)) {sprite_delete(global.menuBackgroundBlur);}
        global.menuBackgroundBlur=sprite_add(current_directory()+global.mBackBlur_path,1,0,0,0,0);}
    if (!sprite_exists(global.menuBackgroundBlur)) {global.mBackBlur_path=global.mSBackBlur_path; global.menuBackgroundBlur=sprite_add(working_directory+global.mBackBlur_path,1,0,0,0,0);}
    else {sprite_set_offset(global.menuBackgroundBlur,sprite_get_width(global.menuBackgroundBlur)/2,sprite_get_height(global.menuBackgroundBlur)/2);}
    sprite_set_offset(global.menuBackgroundBlur,sprite_get_width(global.menuBackgroundBlur)/2,sprite_get_height(global.menuBackgroundBlur)/2);
    sprName="dialogueBox"; _skimg=ini_read_string("SPRITES",sprName,"");
    if (file_exists(working_directory+folname+"\"+_skimg)) {_skimgnum=ini_read_real("SPRITES",sprName+"_num",1);
        _skimgofx=ini_read_real("SPRITES",sprName+"_offx",0); _skimgofy=ini_read_real("SPRITES",sprName+"_offy",0);
        global.dialBox=sprite_add(current_directory()+folname+"\"+_skimg,_skimgnum,0,0,_skimgofx,_skimgofy);}
    sprName="dialogueNamebox"; _skimg=ini_read_string("SPRITES",sprName,"");
    if (file_exists(working_directory+folname+"\"+_skimg)) {_skimgnum=ini_read_real("SPRITES",sprName+"_num",1);
        _skimgofx=ini_read_real("SPRITES",sprName+"_offx",0); _skimgofy=ini_read_real("SPRITES",sprName+"_offy",0);
        global.dialNamebox=sprite_add(current_directory()+folname+"\"+_skimg,_skimgnum,0,0,_skimgofx,_skimgofy);}
    sprName="dialogueFullbox"; _skimg=ini_read_string("SPRITES",sprName,"");
    if (file_exists(working_directory+folname+"\"+_skimg)) {_skimgnum=ini_read_real("SPRITES",sprName+"_num",1);
        _skimgofx=ini_read_real("SPRITES",sprName+"_offx",0); _skimgofy=ini_read_real("SPRITES",sprName+"_offy",0);
        global.dialFullbox=sprite_add(current_directory()+folname+"\"+_skimg,_skimgnum,0,0,_skimgofx,_skimgofy);}
ini_close();}}
