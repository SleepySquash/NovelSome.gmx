__adqwfrstr=argument0;

dis_i=1; _omdone=0; if (__adqwfrstr!="") {while (1) {if (dis_i<=string_length(__adqwfrstr)) {
    _str=string_get_tillsymbol7(__adqwfrstr,dis_i,' ','+','-','*','/',')','('); if (_str != "") {switch (_str) {default: break;
        case "xcenter": __adqwfrstr=string_replace(__adqwfrstr,"xcenter","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "ycenter": __adqwfrstr=string_replace(__adqwfrstr,"ycenter",string(-global.wSH/2)); dis_i=dis_i+string_length(string(-global.wSH/2)); _omdone=1; break;
        case "wleft": __adqwfrstr=string_replace(__adqwfrstr,"wleft",string(-global.wSW/2)); dis_i=dis_i+string_length(string(-global.wSW/2)); _omdone=1; break;
        case "wright": __adqwfrstr=string_replace(__adqwfrstr,"wright",string(global.wSW/2)); dis_i=dis_i+string_length(string(global.wSW/2)); _omdone=1; break;
        case "wup": __adqwfrstr=string_replace(__adqwfrstr,"wup",string(-global.wSH)); dis_i=dis_i+string_length(string(-global.wSH)); _omdone=1; break;
        case "wdown": __adqwfrstr=string_replace(__adqwfrstr,"wdown","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wtop": __adqwfrstr=string_replace(__adqwfrstr,"wtop",string(-global.wSH)); dis_i=dis_i+string_length(string(-global.wSH)); _omdone=1; break;
        case "wbottom": __adqwfrstr=string_replace(__adqwfrstr,"wbottom","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wwidth": __adqwfrstr=string_replace(__adqwfrstr,"wwidth",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wheight": __adqwfrstr=string_replace(__adqwfrstr,"wheight",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "ww": __adqwfrstr=string_replace(__adqwfrstr,"ww",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wh": __adqwfrstr=string_replace(__adqwfrstr,"wh",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "mousex": __adqwfrstr=string_replace(__adqwfrstr,"mousex",string(mouse_x)); dis_i=dis_i+string_length(string(mouse_x)); _omdone=1; break;
        case "mousey": __adqwfrstr=string_replace(__adqwfrstr,"mousey",string(mouse_y)); dis_i=dis_i+string_length(string(mouse_y)); _omdone=1; break;
        case "left": __adqwfrstr=string_replace(__adqwfrstr,"left",string(-view_wview/3)); dis_i=dis_i+string_length(string(-view_wview/3)); _omdone=1; break;
        case "cleft": __adqwfrstr=string_replace(__adqwfrstr,"cleft",string(-view_wview/6)); dis_i=dis_i+string_length(string(-view_wview/6)); _omdone=1; break;
        case "center": __adqwfrstr=string_replace(__adqwfrstr,"center","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "cright": __adqwfrstr=string_replace(__adqwfrstr,"cright",string(view_wview/6)); dis_i=dis_i+string_length(string(view_wview/6)); _omdone=1; break;
        case "right": __adqwfrstr=string_replace(__adqwfrstr,"right",string(view_wview/3)); dis_i=dis_i+string_length(string(view_wview/3)); _omdone=1; break;}
   if (!_omdone) {dis_i+=string_length(_str)+1;} else {_omdone=0;}} else {dis_i+=1;}} else {break;}}}

return __adqwfrstr;
