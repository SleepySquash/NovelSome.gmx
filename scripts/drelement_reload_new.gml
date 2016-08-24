if (!firstScan) {for (ip=0;ip<ds_list_size(pagelist);ip+=1) {ii=ds_list_find_value(pagelist,ip);
    for (i=0;i<elCount[ii];i+=1) {switch (element[ii,i]) {
        case "button": if (sprite_exists(elspr1[ii,i])) {sprite_delete(elspr1[ii,i]);}
            if (sprite_exists(elspr2[ii,i])) {sprite_delete(elspr2[ii,i]);} break;
        case "image": if (sprite_exists(elspr[ii,i])) {sprite_delete(elspr[ii,i]);} break;}}} ds_list_destroy(pagelist); pagelist=ds_list_create();}
elCount[1]=0; elPage=1; ds_list_add(pagelist,1); elCount[999]=0; elCount[998]=0; elCount[997]=0;
customMenu=file_exists(argument0); if (customMenu) {file=file_text_open_read(argument0);
while (!file_text_eof(file)) {fstr=file_text_read_string(file);
    if (string_copy(fstr,1,string_length("page "))=="page ") {_page=string_copy(fstr,string_length("page ")+1,string_length(fstr)-string_length("page ")); if (_page!="") {
        switch (_page) {
            case "options": elPage=999; ds_list_add(pagelist,999); elCount[elPage]=0; break;
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
                    if (def3!="") {elocolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}} else {break;} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('end'))=='end') {element[elPage,elCount[elPage]]="end"; elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('if '))=='if ') {_var = string_get_sstring(fstr,string_length('if ')+1);
        if (_var!="") {_act = string_get_sstring(fstr,string_length('if  ')+string_length(_var)+1); if (_act!="=" && _act!=">" && _act!="<" && _act!="==" && _act!=">=" && _act!="<=" && _act!="!=") {
            _val=_act; _act="=";} else {_val = string_get_sstring(fstr,string_length('if   ')+string_length(_var)+string_length(_act)+1);}
            element[elPage,elCount[elPage]]="if"; elvar[elPage,elCount[elPage]]=_var; elact[elPage,elCount[elPage]]=_act;
            elval[elPage,elCount[elPage]]=_val; elCount[elPage]+=1;}}
    else if (string_copy(fstr,1,string_length('text:"'))=='text:"') {bldef=""; num="_"; _count=1; while (num!="") {_ph=string_copy(fstr,string_length('text:"')+1,_count);
            if (string_copy(_ph,string_length(_ph),1)=='"') {_ph=string_copy(_ph,1,string_length(_ph)-1); num="";} else {_count+=1; if (_count+(string_length('text:"')+1)>string_length(fstr)+1) {break;}}}
        element[elPage,elCount[elPage]]="text"; eltext[elPage,elCount[elPage]]=""; elnooutline[elPage,elCount[elPage]]=0; if (_ph!="") {eltext[elPage,elCount[elPage]]=_ph;} elx[elPage,elCount[elPage]]=0; ely[elPage,elCount[elPage]]=0; elparallax[elPage,elCount[elPage]]=0;
        elfont[elPage,elCount[elPage]]=Pacifica28; elcolor[elPage,elCount[elPage]]=c_white; elocolor[elPage,elCount[elPage]]=c_dkgray; elhalign[elPage,elCount[elPage]]=fa_center; elvalign[elPage,elCount[elPage]]=fa_middle;
    stpos=string_length('text:"" ')+string_length(_ph)+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {def=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:"));
            if (def!="") {elx[elPage,elCount[elPage]]=string_convert_topos(def);}}
        else if (string_copy(word,1,string_length("y:"))=="y:") {def=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:"));
            if (def!="") {ely[elPage,elCount[elPage]]=string_convert_topos(def);}}
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
            else {def2=string_get_sstring2(word,string_length("ocolor: ")+string_length(def1)+1);
                if (def2!="") {def3=string_get_sstring2(word,string_length("ocolor:  ")+string_length(def1)+string_length(def2)+1);
                    if (def3!="") {elocolor[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}} else {break;} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('button'))=='button') {eltext[elPage,elCount[elPage]]=""; _ust=0; if (string_copy(fstr,1,string_length('button:"'))=='button:"') {_ust=1;
            bldef=""; num="_"; _count=1; while (num!="") {_ph=string_copy(fstr,string_length('button:"')+1,_count);
            if (string_copy(_ph,string_length(_ph),1)=='"') {_ph=string_copy(_ph,1,string_length(_ph)-1); num="";} else {_count+=1; if (_count+(string_length('button:"')+1)>string_length(fstr)+1) {break;}}} if (_ph!="") {eltext[elPage,elCount[elPage]]=_ph;}}
        element[elPage,elCount[elPage]]="button"; elscen[elPage,elCount[elPage]]=""; elx[elPage,elCount[elPage]]=0; ely[elPage,elCount[elPage]]=0; elaction[elPage,elCount[elPage]]=""; elstyle[elPage,elCount[elPage]]=0; elback[elPage,elCount[elPage]]=0;
        elfont[elPage,elCount[elPage]]=Pacifica28; elhalign[elPage,elCount[elPage]]=fa_center; elvalign[elPage,elCount[elPage]]=fa_middle; elspr1[elPage,elCount[elPage]]=noone; elspr2[elPage,elCount[elPage]]=noone; elnotext[elPage,elCount[elPage]]=0;
        elcolor1[elPage,elCount[elPage]]=c_white; elocolor1[elPage,elCount[elPage]]=c_dkgray; elbcolor1[elPage,elCount[elPage]]=c_black; elcolor2[elPage,elCount[elPage]]=c_white; elocolor2[elPage,elCount[elPage]]=c_dkgray; elbcolor2[elPage,elCount[elPage]]=c_black;
        elscale[elPage,elCount[elPage]]=1; elscalex[elPage,elCount[elPage]]=1; elscaley[elPage,elCount[elPage]]=1; elscreen[elPage,elCount[elPage]]=0; elparallax[elPage,elCount[elPage]]=0; elint[elPage,elCount[elPage]]=1; elparallax[elPage,elCount[elPage]]=0;
        elsound1[elPage,elCount[elPage]]=""; elsound2[elPage,elCount[elPage]]=""; elsound3[elPage,elCount[elPage]]=""; elplayed1[elPage,elCount[elPage]]=0; elplayed2[elPage,elCount[elPage]]=1; elplayed3[elPage,elCount[elPage]]=0; elaction1[elPage,elCount[elPage]]="";
        elnooutline[elPage,elCount[elPage]]=0;
    if (_ust) {stpos=string_length('button:"" ')+string_length(_ph)+1;} else {stpos=string_length('button ')+1;} while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {def=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:"));
            if (def!="") {elx[elPage,elCount[elPage]]=string_convert_topos(def);}}
        else if (string_copy(word,1,string_length("y:"))=="y:") {def=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:"));
            if (def!="") {ely[elPage,elCount[elPage]]=string_convert_topos(def);}}
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
            if (def!="") {if (string_copy(def,1,string_length("page"))=="page") {elaction[elPage,elCount[elPage]]="page";
                    _page=string_get_ssnumber(def,string_length("page")+1); elaction1[elPage,elCount[elPage]]=real(_page);}
                else if (string_copy(def,1,string_length("spage"))=="spage") {elaction[elPage,elCount[elPage]]="spage";
                    elaction1[elPage,elCount[elPage]]=real(string_get_ssnumber(def,string_length("spage")+1));}
                else {elaction[elPage,elCount[elPage]]=string(def);}}}
        else if (string_copy(word,1,string_length("parallax:"))=="parallax:") {def=string_copy(word,string_length("parallax:")+1,string_length(word)-string_length("parallax:"));
            if (def!="") {elparallax[elPage,elCount[elPage]]=real(def); if (elscreen[elPage,elCount[elPage]]) {real_wview=global.wSW; real_hview=global.wSH; rspr=noone;
                if (sprite_exists(elspr1[elPage,elCount[elPage]])) {rspr=elspr1[elPage,elCount[elPage]];} else if (sprite_exists(elspr2[elPage,elCount[elPage]])) {rspr=elspr2[elPage,elCount[elPage]];}
                if (sprite_exists(rspr)) {elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(rspr)));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(rspr)));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}}}
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
                    if (def3!="") {elocolor2[elPage,elCount[elPage]]=make_colour_rgb(real(def1),real(def2),real(def3));}}}}}} else {break;} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    else if (string_copy(fstr,1,string_length('background '))=='background ') {_path=string_copy(fstr,string_length('background ')+1,string_length(fstr)-string_length('background ')); tpbackpath=tpFolName+"\"+_path;
        if (string_copy(_path,1,string_length("Stuff\"))=="Stuff\") {tpbackpath=_path;} else if (string_copy(_path,1,string_length("Stuff\"))=="Stuff\") {tpbackpath=_path;}
        tpBack=_path; ext=filename_ext(_path); advBack=1; if (ext==".nsback") {advBack=1;}}
    else if (string_copy(fstr,1,string_length('parallax '))=='parallax ') {def=string_copy(fstr,string_length('parallax ')+1,string_length(fstr)-string_length('parallax ')); backParallax=real(def);}
    else if (string_copy(fstr,1,string_length('interpolation '))=='interpolation ') {def=string_copy(fstr,string_length('interpolation ')+1,string_length(fstr)-string_length('interpolation ')); backInterpolation=real(def);}
    else if (string_copy(fstr,1,string_length('mouse:'))=='mouse:') {_mouse=string_get_sstring(fstr,string_length('mouse:')+1);
        element[elPage,elCount[elPage]]="mouse_pressed"; elscen[elPage,elCount[elPage]]=""; elmb[elPage,elCount[elPage]]=convertToMb(_mouse); elaction[elPage,elCount[elPage]]=""; elaction1[elPage,elCount[elPage]]="";
    stpos=string_length('mouse: ')+string_length(_mouse)+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("action:"))=="action:") {def=string_copy(word,string_length("action:")+1,string_length(word)-string_length("action:"));
            if (def!="") {if (string_copy(def,1,string_length("page"))=="page") {elaction[elPage,elCount[elPage]]="page";
                    _page=string_get_ssnumber(def,string_length("page")+1); elaction1[elPage,elCount[elPage]]=real(_page);}
                else if (string_copy(def,1,string_length("spage"))=="spage") {elaction[elPage,elCount[elPage]]="spage";
                    elaction1[elPage,elCount[elPage]]=real(string_get_ssnumber(def,string_length("spage")+1));}
                else {elaction[elPage,elCount[elPage]]=string(def);}}}
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
        elalpha[elPage,elCount[elPage]]=1; ely[elPage,elCount[elPage]]=0; elscreen[elPage,elCount[elPage]]=0; elscalex[elPage,elCount[elPage]]=1; elscaley[elPage,elCount[elPage]]=1; if (_ph!="") {
            _path=novdat.FolName[novid]+"\"+_ph; if (string_copy(_ph,1,string_length("Stuff\"))=="Stuff\") {_path=_ph;} else if (string_copy(_ph,1,string_length("Stuff/"))=="Stuff/") {_path=_ph;}
            if (file_exists(current_directory()+"\"+_path)) {elspr[elPage,elCount[elPage]]=sprite_add(current_directory()+"\"+_path,1,0,0,0,0);
                if (sprite_exists(elspr[elPage,elCount[elPage]])) {sprite_set_offset(elspr[elPage,elCount[elPage]],sprite_get_width(elspr[elPage,elCount[elPage]])/2,sprite_get_height(elspr[elPage,elCount[elPage]])/2);}}}
    stpos=string_length('image:"" ')+string_length(_ph)+1; while (stpos<string_length(fstr)) {word=string_get_sstring(fstr,stpos); if (word!="") {
        if (string_copy(word,1,string_length("x:"))=="x:") {def=string_copy(word,string_length("x:")+1,string_length(word)-string_length("x:"));
            if (def!="") {elx[elPage,elCount[elPage]]=string_convert_topos(def);}}
        else if (string_copy(word,1,string_length("y:"))=="y:") {def=string_copy(word,string_length("y:")+1,string_length(word)-string_length("y:"));
            if (def!="") {ely[elPage,elCount[elPage]]=string_convert_topos(def);}}
        else if (string_copy(word,1,string_length("alpha:"))=="alpha:") {def=string_copy(word,string_length("alpha:")+1,string_length(word)-string_length("alpha:"));
            if (def!="") {elalpha[elPage,elCount[elPage]]=real(def);}}
        else if (string_copy(word,1,string_length("parallax:"))=="parallax:") {def=string_copy(word,string_length("parallax:")+1,string_length(word)-string_length("parallax:"));
            if (def!="") {elparallax[elPage,elCount[elPage]]=real(def); if (elscreen[elPage,elCount[elPage]]) {real_wview=global.wSW; real_hview=global.wSH;
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(elspr[elPage,elCount[elPage]])));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(elspr[elPage,elCount[elPage]])));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}}}
        else if (string_copy(word,1,string_length("scale:"))=="scale:") {def=string_copy(word,string_length("scale:")+1,string_length(word)-string_length("scale:"));
            if (def!="") {if (def=="screen") {real_wview=global.wSW; real_hview=global.wSH; elscreen[elPage,elCount[elPage]]=1;
                elscalex[elPage,elCount[elPage]]=(real_wview+(real_wview*elparallax[elPage,elCount[elPage]]))/((sprite_get_width(elspr[elPage,elCount[elPage]])));
                elscaley[elPage,elCount[elPage]]=(real_hview+(real_hview*elparallax[elPage,elCount[elPage]]))/((sprite_get_height(elspr[elPage,elCount[elPage]])));
                if (elscalex[elPage,elCount[elPage]]>elscaley[elPage,elCount[elPage]]) {elscaley[elPage,elCount[elPage]]=elscalex[elPage,elCount[elPage]];} else {elscalex[elPage,elCount[elPage]]=elscaley[elPage,elCount[elPage]];}}
                else {elscale[elPage,elCount[elPage]]=real(def);}}}} else {break;} stpos+=string_length(word)+1;} elCount[elPage]+=1;}
    file_text_readln(file);} file_text_close(file);}
