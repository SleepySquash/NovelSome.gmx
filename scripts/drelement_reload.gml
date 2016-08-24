if (!firstScan) {for (ip=0;ip<ds_list_size(pagelist);ip+=1) {ii=ds_list_find_value(pagelist,ip);
    for (i=0;i<elCount[ii];i+=1) {switch (element[ii,i]) {
        case "button": if (sprite_exists(elspr1[ii,i])) {sprite_delete(elspr1[ii,i]);}
            if (sprite_exists(elspr2[ii,i])) {sprite_delete(elspr2[ii,i]);} break;
        case "image": if (sprite_exists(elspr[ii,i])) {sprite_delete(elspr[ii,i]);} break;}}} ds_list_destroy(pagelist); pagelist=ds_list_create();}
elCount[1]=0; elPage=1; ds_list_add(pagelist,1); elCount[999]=0; elCount[998]=0; elCount[997]=0;
customMenu=file_exists(argument0); if (customMenu) {
_file=file_text_open_read(argument0); nss_extbegin();
noread=0; ois_Reading=argument1; while (!file_text_eof(_file)) {if (!noread) {fstr = file_text_read_string(_file);} else {noread=0;}
    while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
    if (argument2 != "" || argument3 != "") {
        if (nss_check("void ")) {__curvoid = string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "));
            if (__curvoid == argument2 || __curvoid == argument3) {ois_Reading = 1;} else {ois_Reading = 0;}}
        else if (nss_check("end")) {ois_Reading = argument1;}}
    if (ois_Reading) {if (nss_check("page ")) {
        _page=string_copy(fstr,string_length("page ")+1,string_length(fstr)-string_length("page ")); if (_page!="") {
        switch (_page) {case "options": elPage=999; ds_list_add(pagelist,999); elCount[elPage]=0; break;
            case "language": elPage=998; ds_list_add(pagelist,998); elCount[elPage]=0; break;
            case "load": elPage=997; ds_list_add(pagelist,997); elCount[elPage]=0; break;
            default: elPage=real(_page); if (elPage!=1) {ds_list_add(pagelist,real(_page)); elCount[elPage]=0;} break;}}}
    else if (string_copy(fstr,1,string_length("title "))=="title ") {element[elPage,elCount[elPage]]="title"; elx[elPage,elCount[elPage]]=0; ely[elPage,elCount[elPage]]=0;
        elfont[elPage,elCount[elPage]]=Pacifica28; elcolor[elPage,elCount[elPage]]=c_white; elnooutline[elPage,elCount[elPage]]=0;
        elocolor[elPage,elCount[elPage]]=c_dkgray; elhalign[elPage,elCount[elPage]]=fa_center; elvalign[elPage,elCount[elPage]]=fa_middle; elparallax[elPage,elCount[elPage]]=0;
        stpos=string_length("title ")+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {def=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:"));
            if (def!="") {elx[elPage,elCount[elPage]]=string_convert_topos(def);}}
        else if (string_copy(word,1,string_length("y:"))=="y:") {def=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:"));
            if (def!="") {ely[elPage,elCount[elPage]]=string_convert_topos(def);}}
        else if (string_copy(word,1,string_length("font:"))=="font:") {def=string_copy(word,string_length("font:")+1,string_length(word)-string_length("font:"));
            if (def!="") {elfont[elPage,elCount[elPage]]=convertToFont(def);}}
        else if (string_copy(word,1,string_length("halign:"))=="halign:") {def=string_copy(word,string_length("halign:")+1,string_length(word)-string_length("halign:"));
            if (def!="") {elhalign[elPage,elCount[elPage]]=convertToHalign(def);}}
        else if (string_copy(word,1,string_length("valign:"))=="valign:") {def=string_copy(word,string_length("valign:")+1,string_length(word)-string_length("valign:"));
            if (def!="") {elvalign[elPage,elCount[elPage]]=convertToValign(def);}}
        else if (string_copy(word,1,string_length("parallax:"))=="parallax:") {def=string_copy(word,string_length("parallax:")+1,string_length(word)-string_length("parallax:"));
            if (def!="") {elparallax[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("nooutline"))=="nooutline") {elnooutline[elPage,elCount[elPage]]=1;}
        else if (string_copy(word,1,string_length("color:"))=="color:") {
            def1=string_get_sstring2(word,string_length("color:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elcolor[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {def2=string_get_sstring2(word,string_length("color: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("color:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elcolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}
        else if (string_copy(word,1,string_length("ocolor:"))=="ocolor:") {
            def1=string_get_sstring2(word,string_length("ocolor:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elocolor[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
                else {def2=string_get_sstring2(word,string_length("ocolor: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("ocolor:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elocolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (nss_check("end")) {element[elPage,elCount[elPage]]="end"; elCount[elPage]+=1;}
    else if (nss_check("if ") || nss_check("else if ") || nss_check("elseif ")) {if (nss_check("else if ")) {__elseif="else if ";} else if (nss_check("else if ")) {__elseif="elseif ";} else {__elseif="if ";}
        _var = string_get_sstring(fstr,string_length(__elseif)+1);
        _whole=string_copy(fstr,string_length(__elseif)+1,string_length(fstr)-string_length(__elseif));
        while (string_copy(_whole,1,1) == " ") {if (string_length(_whole)<=1) {break;} _whole = string_copy(_whole,2,string_length(_whole)-1);}
        if (_whole!="") {if (string_copy(_whole,1,1)=="(" && string_copy(_whole,string_length(_whole),1) == ")") {
                _whole=string_copy(_whole,2,string_length(_whole)-2);}
            _act=""; _val=""; _var=""; __isstring=0;
            for (__ivar=1;__ivar<=string_length(_whole);__ivar+=1) {__wordsize=0;
                if (string_copy(_whole,__ivar,2) == "==") {__wordsize=2; _act="=";}
                else if (string_copy(_whole,__ivar,1) == "=") {__wordsize=1; _act="=";}
                else if (string_copy(_whole,__ivar,2) == "<=") {__wordsize=2; _act="<=";}
                else if (string_copy(_whole,__ivar,2) == ">=") {__wordsize=2; _act=">=";}
                else if (string_copy(_whole,__ivar,1) == "<") {__wordsize=1; _act="<";}
                else if (string_copy(_whole,__ivar,1) == ">") {__wordsize=1; _act=">";}
                else if (string_copy(_whole,__ivar,2) == "!=") {__wordsize=2; _act="!=";}
                if (__wordsize>0) {_var=string_copy(_whole,1,__ivar-1);
                    _val=string_copy(_whole,__ivar+__wordsize,string_length(_whole)-__ivar);
                    break;}} if (__wordsize<=0) {_var=_whole;}
            if (string_length(_var)>0) {while (string_copy(_var,string_length(_var),1) == " ") {if (string_length(_var)<=1) {break;} _var = string_copy(_var,1,string_length(_var)-1);}}
            if (string_length(_val)>0) {while (string_copy(_val,1,1) == " ") {if (string_length(_val)<=1) {break;} _val = string_copy(_val,2,string_length(_val)-1);}}
            if (string_count('"',_val) > 0) {__isstring=1; _val=string_replace_all(_val,'"',"");}
            if (__elseif=="if ") {element[elPage,elCount[elPage]]="if";} else {element[elPage,elCount[elPage]]="elseif";}
            elvar[elPage,elCount[elPage]]=_var; elact[elPage,elCount[elPage]]=_act;
            elval[elPage,elCount[elPage]]=_val; elisstring[elPage,elCount[elPage]]=__isstring; elCount[elPage]+=1;}}
    else if (nss_check("else")) {element[elPage,elCount[elPage]]="else"; elCount[elPage]+=1;}
    else if (nss_check("text")) {_count=0; eltext[elPage,elCount[elPage]]=""; eltdyn[elPage,elCount[elPage]]=0;
        if (string_copy(fstr,string_length('text')+1,1)==':') {_count+=1;
            _str=string_get_tillsymbol_as_string(fstr,string_length('text')+2,' '); _str1=string_convert_withpluses(_str);
            if (_str1!=string_replace_all(_str,'"',"")) {eltdyn[elPage,elCount[elPage]]=1; eltraw[elPage,elCount[elPage]]=_str;}
            eltext[elPage,elCount[elPage]]=_str1; _count+=string_length(_str);}
        element[elPage,elCount[elPage]]="text"; elnooutline[elPage,elCount[elPage]]=0; elx[elPage,elCount[elPage]]=0; ely[elPage,elCount[elPage]]=0; elparallax[elPage,elCount[elPage]]=0;
        elfont[elPage,elCount[elPage]]=Pacifica28; elcolor[elPage,elCount[elPage]]=c_white; elocolor[elPage,elCount[elPage]]=c_dkgray; elhalign[elPage,elCount[elPage]]=fa_center; elvalign[elPage,elCount[elPage]]=fa_middle;
        elperx[elPage,elCount[elPage]]=""; elpery[elPage,elCount[elPage]]="";
        stpos=string_length('text ')+_count+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {def=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:"));
            if (def!="") {if (def!="") {if (string_count("mousex",def)>0) {elperx[elPage,elCount[elPage]]=def;} else {elx[elPage,elCount[elPage]]=string_convert_topos(def);}}}}
        else if (string_copy(word,1,string_length("y:"))=="y:") {def=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:"));
            if (def!="") {if (def!="") {if (string_count("mousey",def)>0) {elperx[elPage,elCount[elPage]]=def;} else {ely[elPage,elCount[elPage]]=string_convert_topos(def);}}}}
        else if (string_copy(word,1,string_length("font:"))=="font:") {def=string_copy(word,string_length("font:")+1,string_length(word)-string_length("font:"));
            if (def!="") {elfont[elPage,elCount[elPage]]=convertToFont(def);}}
        else if (string_copy(word,1,string_length("nooutline"))=="nooutline") {elnooutline[elPage,elCount[elPage]]=1;}
        else if (string_copy(word,1,string_length("parallax:"))=="parallax:") {def=string_copy(word,string_length("parallax:")+1,string_length(word)-string_length("parallax:"));
            if (def!="") {elparallax[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("halign:"))=="halign:") {def=string_copy(word,string_length("halign:")+1,string_length(word)-string_length("halign:"));
            if (def!="") {elhalign[elPage,elCount[elPage]]=convertToHalign(def);}}
        else if (string_copy(word,1,string_length("valign:"))=="valign:") {def=string_copy(word,string_length("valign:")+1,string_length(word)-string_length("valign:"));
            if (def!="") {elvalign[elPage,elCount[elPage]]=convertToValign(def);}}
        else if (string_copy(word,1,string_length("color:"))=="color:") {
            def1=string_get_sstring2(word,string_length("color:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elcolor[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {def2=string_get_sstring2(word,string_length("color: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("color:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elcolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}
        else if (string_copy(word,1,string_length("ocolor:"))=="ocolor:") {
            def1=string_get_sstring2(word,string_length("ocolor:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elocolor[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {__d=convertToColor(string_lower(def1)); if (__d!=c_white || __d=="white") {elocolor[elPage,elCount[elPage]]=__d;} else {
                def2=string_get_sstring2(word,string_length("ocolor: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("ocolor:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elocolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}}} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (nss_check('button')) {eltext[elPage,elCount[elPage]]=""; eltdyn[elPage,elCount[elPage]]=0;
        _count=0; if (string_copy(fstr,string_length('button')+1,1)==':') {_count+=1;
            _str=string_get_tillsymbol_as_string(fstr,string_length('button')+2,' '); _str1=string_convert_withpluses(_str);
            if (_str1!=string_replace_all(_str,'"',"")) {eltdyn[elPage,elCount[elPage]]=1; eltraw[elPage,elCount[elPage]]=_str;}
            eltext[elPage,elCount[elPage]]=_str1; _count+=string_length(_str);}
        element[elPage,elCount[elPage]]="button"; elscen[elPage,elCount[elPage]]=""; elx[elPage,elCount[elPage]]=0; ely[elPage,elCount[elPage]]=0; elstyle[elPage,elCount[elPage]]=0; elback[elPage,elCount[elPage]]=0;
        elfont[elPage,elCount[elPage]]=Pacifica28; elhalign[elPage,elCount[elPage]]=fa_center; elvalign[elPage,elCount[elPage]]=fa_middle; elspr1[elPage,elCount[elPage]]=-1; elspr2[elPage,elCount[elPage]]=-1; elnotext[elPage,elCount[elPage]]=0;
        elcolor1[elPage,elCount[elPage]]=c_white; elocolor1[elPage,elCount[elPage]]=c_dkgray; elbcolor1[elPage,elCount[elPage]]=c_black; elcolor2[elPage,elCount[elPage]]=c_white; elocolor2[elPage,elCount[elPage]]=c_dkgray; elbcolor2[elPage,elCount[elPage]]=c_black;
        elscale[elPage,elCount[elPage]]=1; elscreenas[elPage,elCount[elPage]]=0; elscalex[elPage,elCount[elPage]]=1; elscaley[elPage,elCount[elPage]]=1; elscreen[elPage,elCount[elPage]]=0; elparallax[elPage,elCount[elPage]]=0; elint[elPage,elCount[elPage]]=1; elparallax[elPage,elCount[elPage]]=0;
        elsound1[elPage,elCount[elPage]]=""; elsound2[elPage,elCount[elPage]]=""; elsound3[elPage,elCount[elPage]]=""; elplayed1[elPage,elCount[elPage]]=0; elplayed2[elPage,elCount[elPage]]=1; elplayed3[elPage,elCount[elPage]]=0;
        elperx[elPage,elCount[elPage]]=""; elpery[elPage,elCount[elPage]]=""; elaction[elPage,elCount[elPage]]=ds_list_create();
        __xs="" __ys=""; elnooutline[elPage,elCount[elPage]]=0;
    stpos=string_length('button ')+_count+1; while (stpos<string_length(fstr)) {word=string_get_tillsymbol(fstr,stpos," "); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {def=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:")); if (def!="") {__xs = def;}}
        else if (string_copy(word,1,string_length("y:"))=="y:") {def=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:")); if (def!="") {__ys = def;}}
        else if (string_copy(word,1,string_length("font:"))=="font:") {def=string_copy(word,string_length("font:")+1,string_length(word)-string_length("font:"));
            if (def!="") {elfont[elPage,elCount[elPage]]=convertToFont(def);}}
        else if (string_copy(word,1,string_length("scenario:"))=="scenario:") {def=string_copy(word,string_length("scenario:")+1,string_length(word)-string_length("scenario:"));
            if (def!="") {elscen[elPage,elCount[elPage]]=string(def);}}
        else if (string_copy(word,1,string_length("nooutline"))=="nooutline") {elnooutline[elPage,elCount[elPage]]=1;}
        else if (string_copy(word,1,string_length("sprite1:"))=="sprite1:") {def=string_copy(word,string_length("sprite1:")+1,string_length(word)-string_length("sprite1:"));
            if (def!="") {_path=novdat.FolName[novid]+"\"+def; if (string_copy(def,1,string_length("Stuff\"))=="Stuff\") {_path=def;} else if (string_copy(def,1,string_length("Stuff/"))=="Stuff/") {_path=def;}
                if (file_exists(current_directory()+"\"+_path)) {if (sprite_exists(elspr1[elPage,elCount[elPage]])) {sprite_delete(elspr1[elPage,elCount[elPage]]);}
                    elspr1[elPage,elCount[elPage]]=sprite_add(current_directory()+"\"+_path,1,0,0,0,0); if (sprite_exists(elspr1[elPage,elCount[elPage]])) {
                    if (elscreen[elPage,elCount[elPage]]) {real_wview=global.wSW; real_hview=global.wSH; elscreen[elPage,elCount[elPage]]=1;
                        rspr=noone; if (sprite_exists(elspr1[elPage,elCount[elPage]])) {rspr=elspr1[elPage,elCount[elPage]];} else if (sprite_exists(elspr2[elPage,elCount[elPage]])) {rspr=elspr2[elPage,elCount[elPage]];}
                        if (sprite_exists(rspr)) {elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(rspr)));
                        elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(rspr)));
                        if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}
                    sprite_set_offset(elspr1[elPage,elCount[elPage]],sprite_get_width(elspr1[elPage,elCount[elPage]])/2,sprite_get_height(elspr1[elPage,elCount[elPage]])/2);}}}}
        else if (string_copy(word,1,string_length("sprite2:"))=="sprite2:") {def=string_copy(word,string_length("sprite2:")+1,string_length(word)-string_length("sprite2:"));
            if (def!="") {_path=novdat.FolName[novid]+"\"+def; if (string_copy(def,1,string_length("Stuff\"))=="Stuff\") {_path=def;} else if (string_copy(def,1,string_length("Stuff/"))=="Stuff/") {_path=def;}
                if (file_exists(current_directory()+"\"+_path)) {if (sprite_exists(elspr2[elPage,elCount[elPage]])) {sprite_delete(elspr2[elPage,elCount[elPage]]);}
                    elspr2[elPage,elCount[elPage]]=sprite_add(current_directory()+"\"+_path,1,0,0,0,0); if (sprite_exists(elspr2[elPage,elCount[elPage]])) {
                    if (elscreen[elPage,elCount[elPage]] && !sprite_exists(elspr1[elPage,elCount[elPage]])) {real_wview=global.wSW; real_hview=global.wSH; elscreen[elPage,elCount[elPage]]=1;
                        rspr=noone; if (sprite_exists(elspr1[elPage,elCount[elPage]])) {rspr=elspr1[elPage,elCount[elPage]];} else if (sprite_exists(elspr2[elPage,elCount[elPage]])) {rspr=elspr2[elPage,elCount[elPage]];}
                        if (sprite_exists(rspr)) {elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(rspr)));
                        elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(rspr)));
                        if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}
                    sprite_set_offset(elspr2[elPage,elCount[elPage]],sprite_get_width(elspr2[elPage,elCount[elPage]])/2,sprite_get_height(elspr2[elPage,elCount[elPage]])/2);}}}}
        else if (string_copy(word,1,string_length("sprite:"))=="sprite:") {def=string_copy(word,string_length("sprite:")+1,string_length(word)-string_length("sprite:"));
            if (def!="") {_path=novdat.FolName[novid]+"\"+def; if (string_copy(def,1,string_length("Stuff\"))=="Stuff\") {_path=def;} else if (string_copy(def,1,string_length("Stuff/"))=="Stuff/") {_path=def;}
                if (file_exists(current_directory()+"\"+_path)) {if (sprite_exists(elspr1[elPage,elCount[elPage]])) {sprite_delete(elspr1[elPage,elCount[elPage]]);} if (sprite_exists(elspr2[elPage,elCount[elPage]])) {sprite_delete(elspr2[elPage,elCount[elPage]]);}
                    elspr1[elPage,elCount[elPage]]=sprite_add(current_directory()+"\"+_path,1,0,0,0,0); if (sprite_exists(elspr1[elPage,elCount[elPage]])) {
                    if (elscreen[elPage,elCount[elPage]]) {real_wview=global.wSW; real_hview=global.wSH; elscreen[elPage,elCount[elPage]]=1;
                        rspr=noone; if (sprite_exists(elspr1[elPage,elCount[elPage]])) {rspr=elspr1[elPage,elCount[elPage]];} else if (sprite_exists(elspr2[elPage,elCount[elPage]])) {rspr=elspr2[elPage,elCount[elPage]];}
                        if (sprite_exists(rspr)) {elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(rspr)));
                        elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(rspr)));
                        if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}
                    sprite_set_offset(elspr1[elPage,elCount[elPage]],sprite_get_width(elspr1[elPage,elCount[elPage]])/2,sprite_get_height(elspr1[elPage,elCount[elPage]])/2); elspr2[elPage,elCount[elPage]]=elspr1[elPage,elCount[elPage]];}}}}
        else if (string_copy(word,1,string_length("action:"))=="action:") {def=string_copy(word,string_length("action:")+1,string_length(word)-string_length("action:"));
            if (def!="") {if (string_copy(def,1,string_length("code("))=="code(") {
                    _ocnt=0; for (yi=stpos+string_length("action:code(");yi<=string_length(fstr);yi+=1) {
                        if (string_copy(fstr,yi,1) == "(") {_ocnt+=1;} else if (string_copy(fstr,yi,1) == ")") {_ocnt-=1;
                            if (_ocnt<0) {_str=string_copy(fstr,stpos+string_length("action:code("),-(stpos+string_length("action:code("))+yi);
                                word="action:code("+_str+")"; ds_list_add(elaction[elPage,elCount[elPage]],"code "+_str); break;}}}}
                else if (string_copy(def,1,string_length("("))=="(") {
                    _ocnt=0; for (yi=stpos+string_length("action:(");yi<=string_length(fstr);yi+=1) {
                        if (string_copy(fstr,yi,1) == "(") {_ocnt+=1;} else if (string_copy(fstr,yi,1) == ")") {_ocnt-=1;
                            if (_ocnt<0) {_str=string_copy(fstr,stpos+string_length("action:("),-(stpos+string_length("action:("))+yi);
                                word="action:("+_str+")"; ds_list_add(elaction[elPage,elCount[elPage]],"code "+_str); break;}}}}
                else {if (string_count('"',def) > 0) {ds_list_add(elaction[elPage,elCount[elPage]],string_get_tillsymbolskip(fstr,stpos+string_length("action:"),'"',1));}
                    else {ds_list_add(elaction[elPage,elCount[elPage]],(def));}}}}
        else if (string_copy(word,1,string_length("parallax:"))=="parallax:") {def=string_copy(word,string_length("parallax:")+1,string_length(word)-string_length("parallax:"));
            if (def!="") {elparallax[elPage,elCount[elPage]]=real(def); if (elscreen[elPage,elCount[elPage]]) {real_wview=global.wSW; real_hview=global.wSH; rspr=noone;
                if (elscreenas[elPage,elCount[elPage]]) {__swidth=elscreenas1[elPage,elCount[elPage]]; __sheight=elscreenas2[elPage,elCount[elPage]];}
                else {if (sprite_exists(elspr1[elPage,elCount[elPage]])) {rspr=elspr1[elPage,elCount[elPage]];} else if (sprite_exists(elspr2[elPage,elCount[elPage]])) {rspr=elspr2[elPage,elCount[elPage]];}
                    if (sprite_exists(rspr)) {__swidth = sprite_get_width(rspr); __sheight = sprite_get_height(rspr);}}
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((__swidth));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((__sheight));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}}
        else if (string_copy(word,1,string_length("scalescreenas:"))=="scalescreenas:") {def=string_copy(word,string_length("scalescreenas:")+1,string_length(word)-string_length("scalescreenas:"));
            if (def!="") {_def1 = string_get_sstring3(def,1); if (_def1!="") {_def2 = string_get_sstring3(def,string_length(_def1)+2); if (_def2!="") {
                real_wview=global.wSW; real_hview=global.wSH; __sprw=real(_def1); __sprh=real(_def2); if (__sprw>=10 && __sprh>=10) {elscreen[elPage,elCount[elPage]]=1; elscreenas[elPage,elCount[elPage]]=1; elscreenas1[elPage,elCount[elPage]]=real(_def1); elscreenas2[elPage,elCount[elPage]]=real(_def2);
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((__sprw));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((__sprh));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}}}}
        else if (string_copy(word,1,string_length("scale:"))=="scale:") {def=string_copy(word,string_length("scale:")+1,string_length(word)-string_length("scale:"));
            if (def!="") {if (def=="screen") {real_wview=global.wSW; real_hview=global.wSH; elscreen[elPage,elCount[elPage]]=1;
                rspr=noone; if (sprite_exists(elspr1[elPage,elCount[elPage]])) {rspr=elspr1[elPage,elCount[elPage]];} else if (sprite_exists(elspr2[elPage,elCount[elPage]])) {rspr=elspr2[elPage,elCount[elPage]];}
                if (sprite_exists(rspr)) {elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(rspr)));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(rspr)));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}
                else {elscale[elPage,elCount[elPage]]=real(def);}}}
        else if (string_copy(word,1,string_length("sound1:"))=="sound1:") {def=string_copy(word,string_length("sound1:")+1,string_length(word)-string_length("sound1:"));
            if (def!="") {_path=novdat.FolName[novid]+"\"+def; if (string_copy(def,1,string_length("Stuff\"))=="Stuff\") {_path=def;} else if (string_copy(def,1,string_length("Stuff/"))=="Stuff/") {_path=def;}
                if (file_exists(current_directory()+"\"+_path)) {elsound1[elPage,elCount[elPage]]=_path;}}}
        else if (string_copy(word,1,string_length("sound2:"))=="sound2:") {def=string_copy(word,string_length("sound2:")+1,string_length(word)-string_length("sound2:"));
            if (def!="") {_path=novdat.FolName[novid]+"\"+def; if (string_copy(def,1,string_length("Stuff\"))=="Stuff\") {_path=def;} else if (string_copy(def,1,string_length("Stuff/"))=="Stuff/") {_path=def;}
                if (file_exists(current_directory()+"\"+_path)) {elsound2[elPage,elCount[elPage]]=_path;}}}
        else if (string_copy(word,1,string_length("sound3:"))=="sound3:") {def=string_copy(word,string_length("sound3:")+1,string_length(word)-string_length("sound3:"));
            if (def!="") {_path=novdat.FolName[novid]+"\"+def; if (string_copy(def,1,string_length("Stuff\"))=="Stuff\") {_path=def;} else if (string_copy(def,1,string_length("Stuff/"))=="Stuff/") {_path=def;}
                if (file_exists(current_directory()+"\"+_path)) {elsound3[elPage,elCount[elPage]]=_path;}}}
        else if (string_copy(word,1,string_length("style:"))=="style:") {def=string_copy(word,string_length("style:")+1,string_length(word)-string_length("style:"));
            if (def!="") {elstyle[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("notext:"))=="notext:") {def=string_copy(word,string_length("notext:")+1,string_length(word)-string_length("notext:"));
            if (def!="") {elnotext[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("interpolation:"))=="interpolation:") {def=string_copy(word,string_length("interpolation:")+1,string_length(word)-string_length("interpolation:"));
            if (def!="") {elint[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("halign:"))=="halign:") {def=string_copy(word,string_length("halign:")+1,string_length(word)-string_length("halign:"));
            if (def!="") {elhalign[elPage,elCount[elPage]]=convertToHalign(def);}}
        else if (string_copy(word,1,string_length("valign:"))=="valign:") {def=string_copy(word,string_length("valign:")+1,string_length(word)-string_length("valign:"));
            if (def!="") {elvalign[elPage,elCount[elPage]]=convertToValign(def);}}
        else if (string_copy(word,1,string_length("backcolor:"))=="backcolor:") {
            def1=string_get_sstring2(word,string_length("backcolor:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elbcolor1[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1)); elbcolor2[elPage,elCount[elPage]]=elbcolor1[elPage,elCount[elPage]]; elback[elPage,elCount[elPage]]=1;}
            else {def2=string_get_sstring2(word,string_length("backcolor: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("backcolor:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elbcolor1[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3)); elbcolor2[elPage,elCount[elPage]]=elbcolor1[elPage,elCount[elPage]]; elback[elPage,elCount[elPage]]=1;}}}}}
        else if (string_copy(word,1,string_length("color:"))=="color:") {
            def1=string_get_sstring2(word,string_length("color:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elcolor1[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1)); elcolor2[elPage,elCount[elPage]]=elcolor1[elPage,elCount[elPage]];}
            else {def2=string_get_sstring2(word,string_length("color: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("color:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elcolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3)); elcolor2[elPage,elCount[elPage]]=elcolor1[elPage,elCount[elPage]];}}}}}
        else if (string_copy(word,1,string_length("ocolor:"))=="ocolor:") {
            def1=string_get_sstring2(word,string_length("ocolor:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elocolor1[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1)); elocolor2[elPage,elCount[elPage]]=elocolor1[elPage,elCount[elPage]];}
            else {def2=string_get_sstring2(word,string_length("ocolor: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("ocolor:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elocolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3)); elocolor2[elPage,elCount[elPage]]=elocolor1[elPage,elCount[elPage]];}}}}}
        else if (string_copy(word,1,string_length("backcolor1:"))=="backcolor1:") {
            def1=string_get_sstring2(word,string_length("backcolor1:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elbcolor1[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1)); elback[elPage,elCount[elPage]]=1;}
            else {def2=string_get_sstring2(word,string_length("backcolor1: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("backcolor1:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elbcolor1[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3)); elback[elPage,elCount[elPage]]=1;}}}}}
        else if (string_copy(word,1,string_length("color1:"))=="color1:") {
            def1=string_get_sstring2(word,string_length("color1:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elcolor1[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {def2=string_get_sstring2(word,string_length("color1: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("color1:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elcolor1[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}
        else if (string_copy(word,1,string_length("ocolor1:"))=="ocolor1:") {
            def1=string_get_sstring2(word,string_length("ocolor1:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elocolor1[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {def2=string_get_sstring2(word,string_length("ocolor1: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("ocolor1:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elocolor1[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}
        else if (string_copy(word,1,string_length("backcolor2:"))=="backcolor2:") {
            def1=string_get_sstring2(word,string_length("backcolor2:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elbcolor2[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1)); elback[elPage,elCount[elPage]]=1;}
            else {def2=string_get_sstring2(word,string_length("backcolor2: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("backcolor2:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elbcolor2[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3)); elback[elPage,elCount[elPage]]=1;}}}}}
        else if (string_copy(word,1,string_length("color2:"))=="color2:") {
            def1=string_get_sstring2(word,string_length("color2:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elcolor2[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {def2=string_get_sstring2(word,string_length("color2: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("color2:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elcolor2[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}
        else if (string_copy(word,1,string_length("ocolor2:"))=="ocolor2:") {
            def1=string_get_sstring2(word,string_length("ocolor2:")+1); if (def1!="") {if (string_copy(def1,1,1)=="@") {elocolor2[elPage,elCount[elPage]]=convertToColor(string_copy(def1,2,string_length(def1)-1));}
            else {def2=string_get_sstring2(word,string_length("ocolor2: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("ocolor2:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elocolor2[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}} stpos+=string_length(word)+1;}
        if (__xs!="") {__xs1=string_convert_tovar(__xs);//if (string_count("scale",__xs)>0) {__xs=string_replace_all(__xs,"scale",string(elscalex[elPage,elCount[elPage]]));}
            if (__xs1 != __xs || string_count("mousex",__xs)>0) {elperx[elPage,elCount[elPage]]=__xs;} else {elx[elPage,elCount[elPage]]=string_convert_topos(__xs);}}
        if (__ys!="") {__ys1=string_convert_tovar(__ys);//if (string_count("scale",__ys)>0) {__ys=string_replace_all(__ys,"scale",string(elscalex[elPage,elCount[elPage]]));}
            if (__ys1 != __ys || string_count("mousey",__ys)>0) {elpery[elPage,elCount[elPage]]=__ys;} else {ely[elPage,elCount[elPage]]=string_convert_topos(__ys);}}
        elCount[elPage]+=1;}
    else if (nss_check('background ') && object_index == objNMenu) {_path=string_copy(fstr,string_length('background ')+1,string_length(fstr)-string_length('background ')); tpbackpath=tpFolName+"\"+_path;
        if (string_copy(_path,1,string_length("Stuff\"))=="Stuff\") {tpbackpath=_path;} else if (string_copy(_path,1,string_length("Stuff\"))=="Stuff\") {tpbackpath=_path;}
        tpBack=_path; ext=filename_ext(_path); advBack=1; if (ext==".nsback") {advBack=1;}}
    else if (nss_check('parallax ') && object_index == objNMenu) {def=string_copy(fstr,string_length('parallax ')+1,string_length(fstr)-string_length('parallax ')); backParallax=real(def);}
    else if (string_copy(fstr,1,string_length('depth '))=='depth ') {def=string_copy(fstr,string_length('depth ')+1,string_length(fstr)-string_length('depth ')); depth=real(def);}
    else if (nss_check('interpolation ') && object_index == objNMenu) {def=string_copy(fstr,string_length('interpolation ')+1,string_length(fstr)-string_length('interpolation ')); backInterpolation=real(def);}
    else if (string_copy(fstr,1,string_length('mouse:'))=='mouse:') {_mouse=string_get_sstring(fstr,string_length('mouse:')+1);
        element[elPage,elCount[elPage]]="mouse_pressed"; elscen[elPage,elCount[elPage]]=""; elmb[elPage,elCount[elPage]]=convertToMb(_mouse); elaction[elPage,elCount[elPage]]=ds_list_create();
        stpos=string_length('mouse: ')+string_length(_mouse)+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("action:"))=="action:") {def=string_copy(word,string_length("action:")+1,string_length(word)-string_length("action:"));
            if (def!="") {if (string_copy(def,1,string_length("code("))=="code(") {
                    _ocnt=0; for (yi=stpos+string_length("action:code(");yi<=string_length(fstr);yi+=1) {
                        if (string_copy(fstr,yi,1) == "(") {_ocnt+=1;} else if (string_copy(fstr,yi,1) == ")") {_ocnt-=1;
                            if (_ocnt<0) {_str=string_copy(fstr,stpos+string_length("action:code("),-(stpos+string_length("action:code("))+yi);
                                word="action:code("+_str+")"; ds_list_add(elaction[elPage,elCount[elPage]],"code "+_str); break;}}}}
                else if (string_copy(def,1,string_length("("))=="(") {
                    _ocnt=0; for (yi=stpos+string_length("action:(");yi<=string_length(fstr);yi+=1) {
                        if (string_copy(fstr,yi,1) == "(") {_ocnt+=1;} else if (string_copy(fstr,yi,1) == ")") {_ocnt-=1;
                            if (_ocnt<0) {_str=string_copy(fstr,stpos+string_length("action:("),-(stpos+string_length("action:("))+yi);
                                word="action:("+_str+")"; ds_list_add(elaction[elPage,elCount[elPage]],"code "+_str); break;}}}}
                else {if (string_count('"',def) > 0) {ds_list_add(elaction[elPage,elCount[elPage]],string_get_tillsymbolskip(fstr,stpos+string_length("action:"),'"',1));}
                    else {ds_list_add(elaction[elPage,elCount[elPage]],(def));}}}}
        else if (string_copy(word,1,string_length("scenario:"))=="scenario:") {def=string_copy(word,string_length("scenario:")+1,string_length(word)-string_length("scenario:"));
            if (def!="") {elscen[elPage,elCount[elPage]]=def;}}} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('keyboard:'))=='keyboard:') {_keyboard=string_get_sstring(fstr,string_length('keyboard:')+1);
        element[elPage,elCount[elPage]]="keyboard_pressed"; elscen[elPage,elCount[elPage]]=""; elkb[elPage,elCount[elPage]]=convertToKb(_keyboard); elaction[elPage,elCount[elPage]]=ds_list_create();
        stpos=string_length('keyboard: ')+string_length(_keyboard)+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("action:"))=="action:") {def=string_copy(word,string_length("action:")+1,string_length(word)-string_length("action:"));
            if (def!="") {if (string_copy(def,1,string_length("code("))=="code(") {
                    _ocnt=0; for (yi=stpos+string_length("action:code(");yi<=string_length(fstr);yi+=1) {
                        if (string_copy(fstr,yi,1) == "(") {_ocnt+=1;} else if (string_copy(fstr,yi,1) == ")") {_ocnt-=1;
                            if (_ocnt<0) {_str=string_copy(fstr,stpos+string_length("action:code("),-(stpos+string_length("action:code("))+yi);
                                word="action:code("+_str+")"; ds_list_add(elaction[elPage,elCount[elPage]],"code "+_str); break;}}}}
                else if (string_copy(def,1,string_length("("))=="(") {
                    _ocnt=0; for (yi=stpos+string_length("action:(");yi<=string_length(fstr);yi+=1) {
                        if (string_copy(fstr,yi,1) == "(") {_ocnt+=1;} else if (string_copy(fstr,yi,1) == ")") {_ocnt-=1;
                            if (_ocnt<0) {_str=string_copy(fstr,stpos+string_length("action:("),-(stpos+string_length("action:("))+yi);
                                word="action:("+_str+")"; ds_list_add(elaction[elPage,elCount[elPage]],"code "+_str); break;}}}}
                else {if (string_count('"',def) > 0) {ds_list_add(elaction[elPage,elCount[elPage]],string_get_tillsymbolskip(fstr,stpos+string_length("action:"),'"',1));}
                    else {ds_list_add(elaction[elPage,elCount[elPage]],(def));}}}}
        else if (string_copy(word,1,string_length("scenario:"))=="scenario:") {def=string_copy(word,string_length("scenario:")+1,string_length(word)-string_length("scenario:"));
            if (def!="") {elscen[elPage,elCount[elPage]]=def;}}} else {break;} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('blackscreen'))=='blackscreen') {_mouse=string_get_sstring(fstr,string_length('blackscreen')+1);
        element[elPage,elCount[elPage]]="blackscreen"; elalpha[elPage,elCount[elPage]]=1;
        stpos=string_length('blackscreen ')+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("alpha:"))=="alpha:") {def=string_copy(word,string_length("alpha:")+1,string_length(word)-string_length("alpha:"));
            if (def!="") {elalpha[elPage,elCount[elPage]]=real(def);}}} else {break;} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('image:"'))=='image:"') {bldef=""; num="_"; _count=1; while (num!="") {_ph=string_copy(fstr,string_length('image:"')+1,_count);
            if (string_copy(_ph,string_length(_ph),1)=='"') {_ph=string_copy(_ph,1,string_length(_ph)-1); num="";} else {_count+=1; if (_count+(string_length('image:"')+1)>string_length(fstr)+1) {break;}}}
        element[elPage,elCount[elPage]]="image"; elparallax[elPage,elCount[elPage]]=0; elscale[elPage,elCount[elPage]]=1; elspr[elPage,elCount[elPage]]=noone; elx[elPage,elCount[elPage]]=0;
        elperx[elPage,elCount[elPage]]=""; elpery[elPage,elCount[elPage]]=""; elrot[elPage,elCount[elPage]]=0; elangle[elPage,elCount[elPage]]=0; __xs=""; __ys="";
        elalpha[elPage,elCount[elPage]]=1; ely[elPage,elCount[elPage]]=0; elscreen[elPage,elCount[elPage]]=0; elscalex[elPage,elCount[elPage]]=1; elscaley[elPage,elCount[elPage]]=1; if (_ph!="") {
            _path=novdat.FolName[novid]+"\"+_ph; if (string_copy(_ph,1,string_length("Stuff\"))=="Stuff\") {_path=_ph;} else if (string_copy(_ph,1,string_length("Stuff/"))=="Stuff/") {_path=_ph;}
            if (file_exists(current_directory()+"\"+_path)) {elspr[elPage,elCount[elPage]]=sprite_add(current_directory()+"\"+_path,1,0,0,0,0);
                if (sprite_exists(elspr[elPage,elCount[elPage]])) {sprite_set_offset(elspr[elPage,elCount[elPage]],sprite_get_width(elspr[elPage,elCount[elPage]])/2,sprite_get_height(elspr[elPage,elCount[elPage]])/2);}}}
        stpos=string_length('image:"" ')+string_length(_ph)+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {__xs=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:"));}
        else if (string_copy(word,1,string_length("y:"))=="y:") {__ys=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:"));}
        else if (string_copy(word,1,string_length("alpha:"))=="alpha:") {def=string_copy(word,string_length("alpha:")+1,string_length(word)-string_length("alpha:"));
            if (def!="") {elalpha[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("rot:"))=="rot:") {def=string_copy(word,string_length("rot:")+1,string_length(word)-string_length("rot:"));
            if (def!="") {elrot[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("angle:"))=="angle:") {def=string_copy(word,string_length("angle:")+1,string_length(word)-string_length("angle:"));
            if (def!="") {elangle[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("parallax:"))=="parallax:") {def=string_copy(word,string_length("parallax:")+1,string_length(word)-string_length("parallax:"));
            if (def!="") {elparallax[elPage,elCount[elPage]]=real(def); if (elscreen[elPage,elCount[elPage]]) {real_wview=global.wSW; real_hview=global.wSH;
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(elspr[elPage,elCount[elPage]])));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(elspr[elPage,elCount[elPage]])));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}}
        else if (string_copy(word,1,string_length("scalescreenas:"))=="scalescreenas:") {def=string_copy(word,string_length("scalescreenas:")+1,string_length(word)-string_length("scalescreenas:"));
            if (def!="") {_def1 = string_get_sstring3(def,1); if (_def1!="") {_def2 = string_get_sstring3(def,string_length(_def1)+2); if (_def2!="") {
                real_wview=global.wSW; real_hview=global.wSH; __sprw=real(_def1); __sprh=real(_def2); if (__sprw>=10 && __sprh>=10) {elscreen[elPage,elCount[elPage]]=1;
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((__sprw));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((__sprh));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}}}}
        else if (string_copy(word,1,string_length("scale:"))=="scale:") {def=string_copy(word,string_length("scale:")+1,string_length(word)-string_length("scale:"));
            if (def!="") {if (def=="screen") {real_wview=global.wSW; real_hview=global.wSH; elscreen[elPage,elCount[elPage]]=1;
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(elspr[elPage,elCount[elPage]])));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(elspr[elPage,elCount[elPage]])));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}
                else {elscale[elPage,elCount[elPage]]=real(def);}}}} stpos+=string_length(word)+1;}
        if (__xs!="") {if (string_count("scale",__xs)>0) {__xs=string_replace_all(__xs,"scale",string(elscalex[elPage,elCount[elPage]]));}
            if (string_count("mousex",__xs)>0) {elperx[elPage,elCount[elPage]]=__xs;} else {elx[elPage,elCount[elPage]]=string_convert_topos(__xs);}}
        if (__ys!="") {if (string_count("scale",__ys)>0) {__ys=string_replace_all(__ys,"scale",string(elscaley[elPage,elCount[elPage]]));}
            if (string_count("mousey",__ys)>0) {elpery[elPage,elCount[elPage]]=__ys;} else {ely[elPage,elCount[elPage]]=string_convert_topos(__ys);}}
        elCount[elPage]+=1;}
    else if (nss_check('fadein ')) {_strcopy=string_convert_topos(string_copy(fstr,string_length("fadein ")+1,string_length(fstr)-string_length("fadein "))); if (_strcopy!=0) {fadein=_strcopy/30;} else {fadein=0;}}
    else if (nss_check('fadeout ')) {_strcopy=string_convert_topos(string_copy(fstr,string_length("fadeout ")+1,string_length(fstr)-string_length("fadeout "))); if (_strcopy!=0) {fadeout=_strcopy/30;} else {fadeout=0;}}
    else if (nss_check('fade ')) {_strcopy=string_convert_topos(string_copy(fstr,string_length("fade ")+1,string_length(fstr)-string_length("fade "))); if (_strcopy!=0) {fadein=_strcopy/30;} else {fadein=0;} fadeout=fadein;}
    else {novelsomescript(fstr,id);}}
    if (!noread) {file_text_readln(_file); _nss_progress+=1;}} file_text_close(_file); firstScan=0; nss_extend();}
