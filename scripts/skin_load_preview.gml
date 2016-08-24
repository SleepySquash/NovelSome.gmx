_file = file_text_open_read(argument0); if (_file==-1) {return 0; exit;} fstr = file_text_read_string(_file);
_isIni=0; _noread=1; if (string_copy(fstr,1,1) == "[") {_isIni=1; file_text_close(_file);}
if (_isIni) {ini_open(argument0);
    _hName=ini_read_string("SKINDATA","Name","");
        if (_hName=="") {return 0; ini_close(); exit;}
    skindat.FName[argument1]=argument0;
    skindat.Name[argument1]=_hName; skindat.isObsolete[argument1]=1;
    skindat.Description[argument1]="";
    skindat.Version[argument1]=ini_read_real("SKINDATA","Version",0); _fname=filename_path(argument0);
    //skindat.FolName[argument1]=string_copy(_fname,string_length(working_directory+"Skins\")+1,string_length(_fname)-string_length(working_directory+"Skins\"));
    _path=filename_path(argument0); if (_path==current_directory()) {_path="";} else {
        _path=string_copy(_path,string_length(current_directory())+1,string_length(_path)-string_length(current_directory()));}
    skindat.FolName[argument1]=_path;
    if (string_copy(_path,1,string_length("Skins\")) == "Skins\" || string_copy(_path,1,string_length("Skins/")) == "Skins/") {
            skindat.FolderName[argument1] = string_copy(_path,string_length("Skins/")+1,string_length(_path)-string_length("Skins/"));}
    else {skindat.FolderName[argument1]=_path;}
    
    global.skinCount+=1;
ini_close();}
else {skindat.FName[argument1]=argument0; skindat.isObsolete[argument1]=0; skindat.Version[argument1]=0; skindat.Description[argument1]="";
    _isReading=0; _path=filename_path(argument0); if (_path==current_directory()) {_path="";} else {
        _path=string_copy(_path,string_length(current_directory())+1,string_length(_path)-string_length(current_directory()));}
    skindat.FolName[argument1]=_path;
    if (string_copy(_path,1,string_length("Skins\")) == "Skins\" || string_copy(_path,1,string_length("Skins/")) == "Skins/") {
            skindat.FolderName[argument1] = string_copy(_path,string_length("Skins/")+1,string_length(_path)-string_length("Skins/"));}
    else {skindat.FolderName[argument1]=_path;}
    skindat.Name[argument1]=_path; while (!file_text_eof(_file)) {
        if (!_noread) {fstr = file_text_read_string(_file);} else {_noread=0;}
        while (string_copy(fstr,1,1) == " ") {if (string_length(fstr)<=1) {break;} else {fstr = string_copy(fstr,2,string_length(fstr)-1);}}
        if (nss_check("name"+global.localisation)) {_str1=string_get_untillsymbol(fstr,string_length("name"+global.localisation)+1,' ');
            if (_str1!="") {skindat.Name[argument1]=_str1;}}
        else if (nss_check("name")) {if (skindat.Name[argument1]==_path || skindat.Name[argument1]=="") {
            _str1=string_get_untillsymbol(fstr,string_length("name")+1,' '); if (_str1!="") {skindat.Name[argument1]=_str1;}}}
        else if (nss_check("description"+global.localisation)) {_str1=string_get_untillsymbol(fstr,string_length("description"+global.localisation)+1,' ');
            if (_str1!="") {skindat.Description[argument1]=_str1;}}
        else if (nss_check("description")) {if (skindat.Description[argument1]=="") {
            _str1=string_get_untillsymbol(fstr,string_length("description")+1,' '); if (_str1!="") {skindat.Description[argument1]=_str1;}}}
        file_text_readln(_file);} file_text_close(_file);
    
    global.skinCount+=1;}
return 1;
