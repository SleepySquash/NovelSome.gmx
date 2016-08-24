var __frstr,dis_i,_str,_omdone;

__frstr=argument0;

dis_i=1; _omdone=0; if (__frstr!="") {while (1) {if (dis_i<=string_length(__frstr)) {
    _str=string_get_tillsymbol7(__frstr,dis_i,' ','+','-','*','/',')','('); if (_str != "") {switch (_str) {default: break;
        case "xcenter": __frstr=string_replace(__frstr,"xcenter",string(global.wSW/2)); dis_i=dis_i+string_length(string(global.wSW/2)); _omdone=1; break;
        case "ycenter": __frstr=string_replace(__frstr,"ycenter",string(global.wSH/2)); dis_i=dis_i+string_length(string(global.wSH/2)); _omdone=1; break;
        case "wleft": __frstr=string_replace(__frstr,"wleft","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wright": __frstr=string_replace(__frstr,"wright",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wup": __frstr=string_replace(__frstr,"wup","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wdown": __frstr=string_replace(__frstr,"wdown",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "wtop": __frstr=string_replace(__frstr,"wtop","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wbottom": __frstr=string_replace(__frstr,"wbottom",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "wwidth": __frstr=string_replace(__frstr,"wwidth",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wheight": __frstr=string_replace(__frstr,"wheight",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "ww": __frstr=string_replace(__frstr,"ww",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wh": __frstr=string_replace(__frstr,"wh",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "mousex": __frstr=string_replace(__frstr,"mousex",string(mouse_x)); dis_i=dis_i+string_length(string(mouse_x)); _omdone=1; break;
        case "mousey": __frstr=string_replace(__frstr,"mousey",string(mouse_y)); dis_i=dis_i+string_length(string(mouse_y)); _omdone=1; break;
        case "dtext": if (instance_exists(global.dialog)) {__frstr=string_replace(__frstr,"dtext",global.dialog.txt); dis_i=dis_i+string_length(global.dialog.txt); _omdone=1;} break;
        case "dname": if (instance_exists(global.dialog)) {__frstr=string_replace(__frstr,"dname",global.dialog.speaker[0]); dis_i=dis_i+string_length(global.dialog.speaker[0]); _omdone=1;} break;}
   if (!_omdone) {dis_i+=string_length(_str)+1;} else {_omdone=0;}} else {dis_i+=1;}} else {break;}}}

return __frstr;

//__frstr=string_convert_standartph_string(__frstr);

//if (string_count("aspectx",__frstr)>0) {__frstr=string_replace_all(__frstr,"aspectx",string(global.wSW/gcd(global.wSW,global.wSH)));}
//if (string_count("aspecty",__frstr)>0) {__frstr=string_replace_all(__frstr,"aspecty",string(global.wSH/gcd(global.wSW,global.wSH)));}
