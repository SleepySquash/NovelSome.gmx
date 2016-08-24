nvsort=argument1; __f = file_text_open_read(argument0); if (__f==-1) {return 0; exit;} __fstr = file_text_read_string(__f);
_isIni=0; if (string_copy(__fstr,1,1) == "[") {_isIni=1; file_text_close(__f);}
if (_isIni) {ini_open(argument0);
    isDel=ini_read_real("NOVELDATA","deleted",0); if (isDel) {ini_close(); return 0; exit;}
    _hName=ini_read_string("NOVELDATA","Name","");
        if (_hName=="") {return 0; ini_close(); exit;} novdat.isObsolete[nvsort]=1;
    novdat.links[nvsort]=ds_map_create(); novdat.linkstype[nvsort]=ds_map_create(); novdat.fonts[nvsort]=ds_map_create();
    //ds_map_replace(novdat.novelwasused,argument0,nvsort);
    novdat.novelID[nvsort]=ini_read_real("NOVELDATA","novelid",-1); novdat.prefix[nvsort]="";
    _prefix=""; if (novdat.novelID[nvsort]!=-1) {_prefix=string(novdat.novelID[nvsort]); novdat.prefix[nvsort]=_prefix+" ";}
    
    if (os_browser != browser_not_a_browser) {_path=filepath_find(argument0);
    novdat.FolderName[nvsort]=string_copy(_path,string_length(working_directory+"Novels\")+1,string_length(_path)-string_length("Novels\"));
    novdat.FolName[nvsort]="Novels\"+novdat.FolderName[nvsort];} else {
    
    _path=filename_path(argument0); if (_path==current_directory()) {_path="";} else {
        _path=string_copy(_path,string_length(current_directory())+1,string_length(_path)-string_length(current_directory()));}
    novdat.FolName[nvsort]=_path; if (string_copy(_path,1,string_length("Novels\")) == "Novels\"
        || string_copy(_path,1,string_length("Novels/")) == "Novels/") {
            novdat.FolderName[nvsort] = string_copy(_path,string_length("Novels/")+1,string_length(_path)-string_length("Novels/"));
        } else {novdat.FolderName[nvsort]=_path;}}
    flname=""; if (_prefix=="") {flname=ini_read_string("NOVELDATA","Folder",""); if (flname=="") {
        flname=ini_read_string("NOVELDATA","FolderName",""); if (flname=="") {flname=_hName;}}}}
else {novdat.novelID[nvsort]=-1; novdat.events[nvsort]=ds_map_create(); _hName=""; novdat.prefix[nvsort]=""; _prefix=""; while (!file_text_eof(__f)) {
    if (string_lower(string_copy(__fstr,1,string_length("deleted"))) == "deleted") {file_text_close(__f); return 0; break;}
    else if (string_lower(string_copy(__fstr,1,string_length("void "))) == "void ") {_what=string_copy(__fstr,string_length("void ")+1,string_length(__fstr)-string_length("void "));
        if (_what!="" && _what!=" ") {while (string_copy(_what,1,1) == " ") {if (string_length(_what)<=1) {break;} _what=string_copy(_what,2,string_length(_what)-1);}
            while (string_copy(_what,string_length(_what),1) == " ") {if (string_length(_what)<=1) {break;} _what=string_copy(_what,1,string_length(_what)-1);}
            ds_map_replace(novdat.events[nvsort],string_lower(_what),0);}}
    else if (string_lower(string_copy(__fstr,1,string_length("name "))) == "name ") {__as=1;
        if (string_copy(__fstr,string_length("name ")+1,1) == '"') {__as=2;}
        _hName = string_get_tillsymbol(__fstr,string_length("name ")+__as,'"');}
    else if (string_lower(string_copy(__fstr,1,string_length("novelid "))) == "novelid ") {
        novdat.novelID[nvsort] = real(string_copy(__fstr,string_length("novelid ")+1,string_length(__fstr)-string_length("novelid ")));}
    file_text_readln(__f); __fstr = file_text_read_string(__f);} file_text_close(__f);
    if (_hName=="") {_hName = string_copy(argument0,string_length(current_directory())+1,string_length(argument0)-string_length(current_directory()));
        if (_hName=="") {return 0;}} if (novdat.novelID[nvsort]!=-1) {_prefix=string(novdat.novelID[nvsort]); novdat.prefix[nvsort]=_prefix+" ";}
    
    if (os_browser != browser_not_a_browser) {_path=filepath_find(argument0);
    novdat.FolderName[nvsort]=string_copy(_path,string_length(working_directory+"Novels\")+1,string_length(_path)-string_length("Novels\"));
    novdat.FolName[nvsort]="Novels\"+novdat.FolderName[nvsort];} else {
    
    _path=filename_path(argument0); if (_path==current_directory()) {_path="";} else {
        _path=string_copy(_path,string_length(current_directory())+1,string_length(_path)-string_length(current_directory()));}
    novdat.FolName[nvsort]=_path; if (string_copy(_path,1,string_length("Novels\")) == "Novels\"
        || string_copy(_path,1,string_length("Novels/")) == "Novels/") {
            novdat.FolderName[nvsort] = string_copy(_path,string_length("Novels/")+1,string_length(_path)-string_length("Novels/"));
        } else {novdat.FolderName[nvsort]=_path;}}
    flname=""; if (_prefix=="") {flname=string_replace_all(novdat.FolderName[nvsort],"/","."); flname=string_replace_all(flname,"\",".");}}
if (global.isBundle!="") {if (novdat.FolName[nvsort]+filename_name(argument0) == global.isBundle) {_bundleid=nvsort;}}
if (os_browser != browser_not_a_browser) {
    novdat.TimePlayed[nvsort]=0; novdat.AUpose[nvsort]=0; novdat.ACpose[nvsort]=0; novdat.ATpose[nvsort]=0;
    tpose=0; cpose=0; upose=0;} else {
if (argument2) {if (_isIni) {ini_close();} else {file_text_close(__f);} if (_prefix=="" && flname!="") {flname="local\"+flname;
    if (string_copy(flname,string_length(flname),1) == ".") {flname=string_copy(flname,1,string_length(flname)-1);}}
ini_open("Data\ndb\"+string(_prefix+flname)+".nsldb"); crTime=real(crTime);
    if (!ini_section_exists(global.uniqueNumber) && ini_section_exists("USERID")) {
        tpose=ini_read_real("USERID","date",crTime); ini_write_real(global.uniqueNumber,"date",tpose);
        cpose=ini_read_real("USERID","changed",crTime); ini_write_real(global.uniqueNumber,"changed",cpose); _cpose=cpose;
        upose=ini_read_real("USERID","updated",crTime); ini_write_real(global.uniqueNumber,"updated",upose);}
    else {tpose=ini_read_real(global.uniqueNumber,"date",crTime);
        cpose=ini_read_real(global.uniqueNumber,"changed",crTime); _cpose=cpose;
        upose=ini_read_real(global.uniqueNumber,"updated",crTime);}
    if (tpose==0) {tpose=crTime;} if (cpose==0) {cpose=crTime;} if (upose==0) {upose=crTime;} novdat.updated[nvsort]=upose;
    ds_priority_add(novdat.priority,nvsort,real(tpose)); ini_write_real(global.uniqueNumber,"updated",upose);
    if (tpose==crTime) {ini_write_real(global.uniqueNumber,"date",real(crTime));}
    if (cpose==crTime) {if (tpose==crTime) {ini_write_real(global.uniqueNumber,"changed",real(crTime));
        ds_priority_add(novdat.prchanged,nvsort,real(cpose)); _cpose=cpose;} else {ini_write_real(global.uniqueNumber,"changed",real(tpose));
        ds_priority_add(novdat.prchanged,nvsort,real(tpose)); _cpose=tpose;}} else {ds_priority_add(novdat.prchanged,nvsort,real(cpose)); _cpose=cpose;}
    novdat.TimePlayed[nvsort]=ini_read_real(global.uniqueNumber,"timeplayed",0);
    novdat.AUpose[nvsort]=real(string(upose)+"."+string(argument1)+string(irandom(9999)));
    novdat.ACpose[nvsort]=real(string(_cpose)+"."+string(argument1)+string(irandom(9999)));
    novdat.ATpose[nvsort]=real(string(tpose)+"."+string(argument1)+string(irandom(9999)));
ini_close(); if (_isIni) {ini_open(argument0);}} else {tpose=crTime;}}
    if (_isIni) {_hName=ini_read_string("NOVELDATA","Name","");
        if (_hName=="") {return 0; ini_close(); exit;}
    ds_map_add(novdat.expid,novdat.novelID[nvsort],nvsort);
    novdat.needUpdate[nvsort]=0; novdat.DName[nvsort]=_hName;
    //if (!global.stScanned || !argument2 || (argument2 && object_index==objDownloadManager && argument1==global.novelCount)) {novdat.needUpdate[nvsort]=0;}
    novdat.FName[nvsort]=argument0; novdat.Deleted[nvsort]=0;
    novdat.FileName[nvsort]=filename_change_ext(filename_name(novdat.FName[nvsort]),"");
    novdat.RName[nvsort]=ini_read_string("NOVELDATA","Name","");
    novdat.Folder[nvsort]=ini_read_string("NOVELDATA","Folder","");
    novdat.ASCIIName[nvsort]=ini_read_string("NOVELDATA","ASCIIName","");
    if (novdat.ASCIIName[nvsort]=="") {novdat.ASCIIName[nvsort]=ini_read_string("NOVELDATA","FolderName","");
        if (novdat.ASCIIName[nvsort]=="") {novdat.ASCIIName[nvsort]=novdat.RName[nvsort];}}
    if (novdat.Folder[nvsort]=="") {novdat.Folder[nvsort]=novdat.ASCIIName[nvsort];}
    _gname=ini_read_string("NOVELDATA","Name:"+global.localisation,""); if (_gname!="") {novdat.Name[nvsort]=_gname;} else {
        novdat.Name[nvsort]=ini_read_string("NOVELDATA","Name","");} novdat.DName[nvsort]=novdat.Name[nvsort]; novdat.TPose[nvsort]=tpose;
    novdat.Version[nvsort]=ini_read_string("NOVELDATA","Version","");
    novdat.GenreCount[nvsort]=0; for (ji=1;ini_key_exists("NOVELDATA","Genre"+string(ji));ji+=1) {
        novdat.Genre[nvsort,ji]=ini_read_real("NOVELDATA","Genre"+string(ji),-1);} novdat.GenreCount[nvsort]=ji-1;
    novdat.Size[nvsort]=get_novel_size(ini_read_real("NOVELDATA","Length",0));
    novdat.HasViolence[nvsort]=ini_read_real("NOVELDATA","HasViolence",0);
    novdat.HasNSFW[nvsort]=ini_read_real("NOVELDATA","HasNSFW",0);
    _gname=ini_read_string("NOVELDATA","CustomMenu:"+global.localisation,""); if (_gname!="") {novdat.CustomMenu[nvsort]=_gname;} else {
        novdat.CustomMenu[nvsort]=ini_read_string("NOVELDATA","CustomMenu","");}
    novdat.HasMenu[nvsort]=(novdat.CustomMenu[nvsort]!="");
    _gname=ini_read_string("NOVELDATA","Description:"+global.localisation,""); if (_gname!="") {novdat.Description[nvsort]=_gname;} else {
        novdat.Description[nvsort]=ini_read_string("NOVELDATA","Description","");}
    novdat.StoryType[nvsort]=ini_read_real("NOVELDATA","StoryType",-1);
    novdat.Author[nvsort]=ini_read_string("NOVELDATA","Author","");
    novdat.Creator[nvsort]=ini_read_string("NOVELDATA","Creator","");
    novdat.Background[nvsort]=ini_read_string("NOVELDATA","Background","");
    novdat.Music[nvsort]=ini_read_string("NOVELDATA","Music","");
    novdat.MusicPreview[nvsort]=ini_read_real("NOVELDATA","MusicPreviewStart",0);
    //novdat.FolderName[nvsort]=ini_read_string("NOVELDATA","FolderName",_hName);
    //novdat.FolName[nvsort]="Novels\"+ini_read_string("NOVELDATA","FolderName",_hName);
    novdat.isActive[nvsort]=0; novdat.scenario[nvsort]=ini_read_string("EVENT:START","scenario","");
    if (novdat.Background[nvsort]!="") {if (!file_exists(working_directory+novdat.FolName[nvsort]+"\"+novdat.Background[nvsort])) {novdat.Background[nvsort]="";}}
    if (novdat.Music[nvsort]!="") {if (!file_exists(working_directory+novdat.FolName[nvsort]+"\"+novdat.Music[nvsort])) {novdat.Music[nvsort]="";}}
    if (novdat.scenario[nvsort]!="") {if (file_exists(working_directory+novdat.FolName[nvsort]+"\"+novdat.scenario[nvsort])) {novdat.isActive[nvsort]=1;}}
    if (!novdat.isActive[nvsort]) {if (novdat.CustomMenu[nvsort]!="") {if (file_exists(working_directory+novdat.FolName[nvsort]+"\"+novdat.CustomMenu[nvsort])) {novdat.isActive[nvsort]=1;}}}
    if (novdat.isActive[nvsort]) {novdat.Color[nvsort]=ini_make_color("NOVELDATA","Color_",global.mButtonClr);
        novdat.OutColor[nvsort]=ini_make_color("NOVELDATA","OutColor_",c_black);} else {novdat.Color[nvsort]=c_gray; novdat.OutColor[nvsort]=c_black;}
    } else {story_imitate_blank_scan(nvsort); novdat.Name[nvsort] = _hName;
        ds_map_add(novdat.expid,novdat.novelID[nvsort],nvsort); novdat.needUpdate[nvsort]=0; novdat.DName[nvsort] = _hName;
        _str=check_for_folder_available(_hName); if (_str!="") {novdat.ASCIIName[nvsort] = _str;} else {novdat.ASCIIName[nvsort] = _hName;}
        novdat.FName[nvsort]=argument0; novdat.FileName[nvsort]=filename_change_ext(filename_name(novdat.FName[nvsort]),"");
        
        if (ds_map_exists(novdat.events[nvsort],"onscan")) {_file = file_text_open_read(argument0); _isReading=0; noread=0; nss_extbegin();
        while (!file_text_eof(_file)) {if (!_isReading) {while (!_isReading) {if (file_text_eof(_file)) {break;} fstr = file_text_read_string(_file);
            while(string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
            if (string_lower(string_copy(fstr,1,string_length("void onscan"))) == "void onscan") {_isReading = 1;} else {
                if (string_lower(string_copy(fstr,1,string_length('name:'+global.localisation+" "))) == string_lower('name:'+global.localisation+" ")) {
                    __strlength=string_length('name:'+global.localisation+" ");
                    _str1 = string_copy(fstr,__strlength+1,string_length(fstr)-__strlength);
                    _str1 = string_replace_all(_str1,'"',""); novdat.DName[nvsort] = _str1;}}
                file_text_readln(_file); _nss_progress+=1;}
            } else {if (!noread) {fstr = file_text_read_string(_file);} else {noread=0;}
                while(string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
                if (string_lower(string_copy(fstr,1,string_length("end"))) == "end") {_isReading = 0;}
                else if (string_lower(string_copy(fstr,1,string_length("void "))) == "void ") {
                    if (string_lower(string_copy(fstr,string_length("void ")+1,string_length(fstr)-string_length("void "))) != "onscan") {_isReading = 0;}}
                else {novid=nvsort; novelsomescript(fstr,lang);}
                if (!noread) {file_text_readln(_file); _nss_progress+=1;}}}
        file_text_close(_file); nss_extend();}
        
        if (novdat.Background[nvsort]!="") {if (file_exists(current_directory()+novdat.FolName[nvsort]+"\"+novdat.Background[nvsort])) {}
            else if (file_exists(current_directory()+novdat.FolName[nvsort]+"\backgrounds\"+novdat.Background[nvsort])) {novdat.Background[nvsort]="backgrounds\"+novdat.Background[nvsort];}
            else {novdat.Background[nvsort]="";}}
        if (novdat.Music[nvsort]!="") {if (file_exists(current_directory()+novdat.FolName[nvsort]+"\"+novdat.Music[nvsort])) {}
            else if (file_exists(current_directory()+novdat.FolName[nvsort]+"\music\"+novdat.Music[nvsort])) {novdat.Music[nvsort]="music\"+novdat.Music[nvsort];}
            else {/*novdat.Music[nvsort]="";*/}}
        if (novdat.scenario[nvsort]!="") {if (file_exists(current_directory()+novdat.FolName[nvsort]+novdat.scenario[nvsort])) {novdat.isActive[nvsort]=1;}
            else if (file_exists(current_directory()+novdat.FolName[nvsort]+"\scenarios\"+novdat.scenario[nvsort])) {novdat.scenario[nvsort]="scenarios\"+novdat.scenario[nvsort]; novdat.isActive[nvsort]=1;}
            else if (file_exists(current_directory()+novdat.FolName[nvsort]+"\episodes\"+novdat.scenario[nvsort])) {novdat.scenario[nvsort]="episodes\"+novdat.scenario[nvsort]; novdat.isActive[nvsort]=1;}}
        if (!novdat.isActive[nvsort]) {if (novdat.CustomMenu[nvsort]!="") {if (file_exists(current_directory()+novdat.FolName[nvsort]+"\"+novdat.CustomMenu[nvsort])) {novdat.isActive[nvsort]=1;}}}}
    
    if (argument2) {global.novelCount+=1;}
if (_isIni) {ini_close();} return 1;
