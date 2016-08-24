imp=0; if (bnum!=-1) {if (novid!=-1) {if (novdat.charf[novid,bnum]!="") {if (file_exists(novdat.charf[novid,bnum])) {imp=1;
    _file=file_text_open_read(novdat.charf[novid,bnum]); acount=0; reading=0; __sprite_open=0; __itsfirst=1; nss_extbegin(); nss_handle_logic(1);
    while (!file_text_eof(_file)) {fstr=file_text_read_string(_file);
        while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
        while (string_copy(fstr,string_length(fstr),1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,1,string_length(fstr)-1);}}
        if (string_copy(fstr,1,string_length("//"))=="//") {} else if (string_copy(fstr,1,string_length(";"))==";") {}
        else if (nss_check("offset ") && reading) {_ofx=string_get_tillsymbol(fstr,string_length("offset ")+1,' ');
            _ofy=string_get_tillsymbol(fstr,string_length("offset ")+2+string_length(_ofx),' '); osx=1; osy=1; //_ofx=real(_ofx); _ofy=real(_ofy);
            if (path=="") {sosx=1; sosy=1; s_ofx=_ofx; s_ofy=_ofy;} canres[acount]=0;}
        else if (string_copy(fstr,1,string_length("parallax "))=="parallax " && reading) {pset=1; _pset=string_copy(fstr,string_length("parallax ")+1,string_length(fstr)-string_length("parallax "));
            parallax[acount]=person_guess_parallax(); if (path=="") {spset=1; sparallax=parallax[acount];}
            if (!sset && __guess_guessed) {sset=1; _dset=_pset; sdepth[acount]=person_guess_depth(); if (object_index == objSNv_person) {depth=initidepth+sdepth[acount]+shDepth;} if (path=="") {ssset=1; ssdepth=sdepth[acount];}}}
        else if (nss_check("interpolation 1") && reading) {interpolation[acount]=1; if (path=="") {sint=1; fint=1;}}
        else if (nss_check("interpolation 0") && reading) {interpolation[acount]=0; if (path=="") {sint=0;}}
        else if (nss_check("depth ") && reading) {sset=1; _dset=string_copy(fstr,string_length("depth ")+1,string_length(fstr)-string_length("depth "));
            sdepth[acount]=person_guess_depth(); if (object_index == objSNv_person) {depth=initidepth+sdepth[acount]+shDepth;} if (path=="") {ssset=1; ssdepth=sdepth[acount];}
            if (!pset && __guess_guessed) {_pset=_dset; parallax[acount]=person_guess_parallax(); if (path=="") {spset=1; sparallax=parallax[acount];}}}
        else if (nss_check("scale ") && reading) {_def = string_copy(fstr,string_length("scale ")+1,string_length(fstr)-string_length("scale "));
            if (_def=="screen") {isscreen[acount]=1; if (path=="") {sisscreen=isscreen[acount];}}
            else {sscale[acount]=string_convert_topos(_def); if (path=="") {ssscale=sscale[acount];}}}
        else if (nss_check("centered") && reading) {ycentered[acount]=1; if (path=="") {sycentered=ycentered[acount];}}
        else if (nss_check("number ") && reading) {ncount=real(string_digits(string_copy(fstr,string_length("number ")+1,string_length(fstr)-string_length("number ")))); if (path=="") {sncount=ncount;}}
        else if (nss_check("image ")) {_var=string_get_tillsymbol(fstr,string_length("image ")+1,'='); fstr=string_copy(fstr,string_length("image ")+string_length(_var)+2,string_length(fstr)-(string_length("image ")+string_length(_var)+1));
            while (string_copy(_var,1,1) == " ") {if (string_length(_var)<=1) {break;} else {_var = string_copy(_var,2,string_length(_var)-1);}}
            while (string_copy(_var,string_length(_var),1) == " ") {if (string_length(_var)<=1) {break;} else {_var = string_copy(_var,1,string_length(_var)-1);}}
            while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            ds_map_replace(novel.links,_var,fstr); if (ds_map_exists(novel.linkstype,_var)) {ds_map_delete(novel.linkstype,_var);}
            /*_pass=0; _final="#### arrayed"; if (sprState=="####look for array") {_final=""; for (i=0;i<statearrayc;i+=1) {
                if (statearray[i] == _var) {_final=_var;}} if (_final!="") {_pass=1; sprState=_final;}} else {_pass=(_var == sprState);}
            if (_pass) {}
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            /////////////THIS IS IF YOU WANT "image State = " TO BE RECOGNIZED AS A STATE AND NOT ONLY AS A VARIABLE/////////////
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            if (_final!="#### arrayed") {sprState = "####look for array";}*/
        }
        /*else if (nss_check("var ")) {_var=string_get_tillsymbol(fstr,string_length("var ")+1,'='); fstr=string_copy(fstr,string_length("var ")+string_length(_var)+2,string_length(fstr)-(string_length("var ")+string_length(_var)+1));
            while (string_copy(_var,1,1) == " ") {if (string_length(_var)<=1) {break;} else {_var = string_copy(_var,2,string_length(_var)-1);}}
            while (string_copy(_var,string_length(_var),1) == " ") {if (string_length(_var)<=1) {break;} else {_var = string_copy(_var,1,string_length(_var)-1);}}
            while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            if (string_count('"',fstr) > 0) {ds_map_replace(novel.links,_var,string_convert_withpluses(fstr));} else {ds_map_replace(novel.links,_var,string_convert_topos(fstr));}
            if (ds_map_exists(_linkdb1,_linked)) {ds_map_delete(_linkdb1,_linked);}}*/
        else if (nss_check("sprite ")) {__sprite_open=1; __remain=string_copy(fstr,string_length("sprite ")+1,string_length(fstr)-string_length("sprite "));
            _pass=0; _final="#### arrayed"; if (sprState=="####look for array") {_final=""; for (i=0;i<statearrayc;i+=1) {
                if (statearray[i] == __remain) {_final=__remain;}} if (_final!="") {_pass=1; sprState=_final;}} else {_pass=(__remain == sprState);}
            if (!_pass) {if (sprState=="####look for array") {if (statearrayc==0) {_pass=__itsfirst; __itsfirst=0;}} else {if (sprState=="") {_pass=__itsfirst; __itsfirst=0;}}}
            if (_pass) {fint=sfint; person_alarm0_def(); if (acount>=1) {interpolation[acount]=0;} reading=1;}
            if (_final!="#### arrayed") {sprState = "####look for array";}}
        else if (nss_check("end")) {__sprite_open=0; if (reading) {if (path!="" && ncount!=0) {aimage[acount]=sprite_add(path,ncount,0,0,0,0);
            if (!pset) {parallax[acount]=person_set_parallax();} if (!sset) {sdepth[acount]=person_set_depth();} if (object_index == objSNv_person) {depth = initidepth+sdepth[acount]+shDepth;}
            if (sprite_exists(aimage[acount])) {if (isscreen[acount]) {real_wview=global.wSW; real_hview=global.wSH;
                    if (((real_wview+(real_wview*parallax[acount]))/(sprite_get_width(aimage[acount]))) > 
                    ((real_hview+(real_hview*parallax[acount]))/((sprite_get_height(aimage[acount]))))) {sscale[acount]=((real_wview+(real_wview*parallax[acount]))/(sprite_get_width(aimage[acount])));}
                    else {sscale[acount]=((real_hview+(real_hview*parallax[acount]))/((sprite_get_height(aimage[acount]))));}}
                rofx=sprite_get_width(aimage[acount])/2; sheight=sprite_get_height(aimage[acount]); if (sheight<=real_hview*(sheight/(sheight*sscale[acount]))) {rofy=sheight;} else {rofy=real_hview*(sheight/(sheight*sscale[acount]));}
                if (osx) {rofx=string_convert_tooffset(aimage[acount],_ofx);} if (osy) {rofy=string_convert_tooffset(aimage[acount],_ofy);} sprite_set_offset(aimage[acount],rofx,rofy);} acount+=1;} reading=0; break;}}
        else {if (reading) {if (path!="" && ncount!=0) {aimage[acount]=sprite_add(path,ncount,0,0,0,0);
            if (!pset) {parallax[acount]=person_set_parallax();} if (!sset) {sdepth[acount]=person_set_depth();} if (object_index == objSNv_person) {depth = initidepth+sdepth[acount]+shDepth;}
            if (sprite_exists(aimage[acount])) {if (isscreen[acount]) {real_wview=global.wSW; real_hview=global.wSH;
                    if (((real_wview+(real_wview*parallax[acount]))/(sprite_get_width(aimage[acount]))) > 
                    ((real_hview+(real_hview*parallax[acount]))/((sprite_get_height(aimage[acount]))))) {sscale[acount]=((real_wview+(real_wview*parallax[acount]))/(sprite_get_width(aimage[acount])));}
                    else {sscale[acount]=((real_hview+(real_hview*parallax[acount]))/((sprite_get_height(aimage[acount]))));}}
                rofx=sprite_get_width(aimage[acount])/2; sheight=sprite_get_height(aimage[acount]); if (sheight<=real_hview*(sheight/(sheight*sscale[acount]))) {rofy=sheight;} else {rofy=real_hview*(sheight/(sheight*sscale[acount]));}
                if (osx) {rofx=string_convert_tooffset(aimage[acount],_ofx);} if (osy) {rofy=string_convert_tooffset(aimage[acount],_ofy);} sprite_set_offset(aimage[acount],rofx,rofy);}
                acount+=1; person_alarm0_def(); if (!fint) {if (acount>=1) {interpolation[acount]=0;}}} _fstr=fstr;
            if (string_copy(fstr,1,1) == '"') {_fstr=string_get_tillsymbol(fstr,2,'"'); if (string_length(fstr) != 2+string_length(_fstr)) {
                _fstr=string_convert_withpluses(fstr);}} else {_leave_it_be=0; if (string_count('"',fstr) == 0) {
                    if (string_copy(fstr,string_length(fstr)-3,4) == ".png") {_leave_it_be=1;}
                    else if (string_copy(fstr,string_length(fstr)-3,4) == ".jpg") {_leave_it_be=1;}
                    else if (string_copy(fstr,string_length(fstr)-4,5) == ".jpeg") {_leave_it_be=1;}
                    else if (string_copy(fstr,string_length(fstr)-3,4) == ".gif") {_leave_it_be=1;}}
                if (!_leave_it_be) {_fstr=string_convert_withpluses(fstr);}}
            if (string_copy(fstr,1,string_length("Stuff/"))=="Stuff/") {path=current_directory()+fstr;}
            else if (string_copy(fstr,1,string_length("Stuff\"))=="Stuff\") {path=current_directory()+fstr;} else {
            _isitpath=filename_path(novdat.charf[novid,bnum]); if (!file_exists(current_directory()+_isitpath+_fstr)) {
                if (file_exists(_isitpath+"images\"+_fstr)) {_fstr="images\"+_fstr;}
                else if (file_exists(_isitpath+"image\"+_fstr)) {_fstr="image\"+_fstr;}
                else if (file_exists(_isitpath+"sprite\"+_fstr)) {_fstr="sprite\"+_fstr;}
                else if (file_exists(_isitpath+"sprites\"+_fstr)) {_fstr="sprites\"+_fstr;}
                else {_isitpath=novdat.FolName[novid]; if (file_exists(_isitpath+_fstr)) {}
                    else if (file_exists(_isitpath+"images\"+_fstr)) {_fstr="images\"+_fstr;}
                    else if (file_exists(_isitpath+"image\"+_fstr)) {_fstr="image\"+_fstr;}
                    else if (file_exists(_isitpath+"sprite\"+_fstr)) {_fstr="sprite\"+_fstr;}
                    else if (file_exists(_isitpath+"sprites\"+_fstr)) {_fstr="sprites\"+_fstr;}
                    else if (file_exists(_isitpath+"character\"+_fstr)) {_fstr="character\"+_fstr;}
                    else if (file_exists(_isitpath+"characters\"+_fstr)) {_fstr="characters\"+_fstr;}}}
            path=_isitpath+_fstr;}} else {if (!__sprite_open) {if (nss_check("name ")) {} else if (nss_check("dname ")) {}
                else if (nss_check("color ")) {} else if (nss_check("ocolor ")) {} else {novelsomescript(fstr,id);}}}}
        file_text_readln(_file);}
    nss_extend(); file_text_close(_file);
    if (pos=='center') {posx=0;} else if (pos=='cleft') {posx=-view_wview/6;}
    else if (pos=='cright') {posx=view_wview/6;} else if (pos=='left') {posx=-view_wview/3;} else if (pos=='right') {posx=view_wview/3;}}}}}
else {if (!imp) {if (pos=='center') {posx=0;} else if (pos=='cleft') {posx=-view_wview/6;}
    else if (pos=='cright') {posx=view_wview/6;} else if (pos=='left') {posx=-view_wview/3;} else if (pos=='right') {posx=view_wview/3;}
    if (sprite_exists(image)) {sprite_delete(image);} image=sprite_add(itpath+itfname,1,0,0,0,0);
    if (object_index == objSNv_person) {depth=shDepth+initidepth;} if (sprite_exists(image)) {
        rofx=sprite_get_width(image)/2; sheight=sprite_get_height(image); if (sheight<=real_hview*(sheight/(sheight*cuscale*yscale))) {rofy=sheight;} else {rofy=real_hview*(sheight/(sheight*cuscale*yscale));}
        if (sosx) {rofx=string_convert_tooffset(image,_ofx);} if (sosy) {rofy=string_convert_tooffset(image,_ofy);} sprite_set_offset(image,rofx,rofy);}}}
/*if (bnum!=-1) {if (novid!=-1) {if (string(novdat.charanim[novid,bnum])!="") {
if (string(novdat.charanim[novid,bnum])=="stop" || string(novdat.charanim[novid,bnum])=="clear") {exit;}
isok=animation_storevar(string(novdat.charanim[novid,bnum]),novid); if (isok) {animated=1; alarm[1]=1;}}}}*/

image_speed=0.5*Time.deltatime;
