__adqwfrstr=argument0;

dis_i=1; _omdone=0; if (__adqwfrstr!="") {while (1) {if (dis_i<=string_length(__adqwfrstr)) {
    _str=string_get_tillsymbol7(__adqwfrstr,dis_i,' ','+','-','*','/',')','('); if (_str != "") {switch (_str) {default: break;
        case "back": __adqwfrstr=string_replace(__adqwfrstr,"back",string(global.backOMove)); dis_i=dis_i+string_length(string(global.backOMove)); _omdone=1; break;
        case "b": __adqwfrstr=string_replace(__adqwfrstr,"b",string(global.backOMove)); dis_i=dis_i+string_length(string(global.backOMove)); _omdone=1; break;
        case "normal": __adqwfrstr=string_replace(__adqwfrstr,"normal",string(global.charOMove_n)); dis_i=dis_i+string_length(string(global.charOMove_n)); _omdone=1; break;
        case "close": __adqwfrstr=string_replace(__adqwfrstr,"close",string(global.charOMove_c)); dis_i=dis_i+string_length(string(global.charOMove_c)); _omdone=1; break;
        case "far": __adqwfrstr=string_replace(__adqwfrstr,"far",string(global.charOMove_f)); dis_i=dis_i+string_length(string(global.charOMove_f)); _omdone=1; break;
        case "n": __adqwfrstr=string_replace(__adqwfrstr,"n",string(global.charOMove_n)); dis_i=dis_i+string_length(string(global.charOMove_n)); _omdone=1; break;
        case "c": __adqwfrstr=string_replace(__adqwfrstr,"c",string(global.charOMove_c)); dis_i=dis_i+string_length(string(global.charOMove_c)); _omdone=1; break;
        case "f": __adqwfrstr=string_replace(__adqwfrstr,"f",string(global.charOMove_f)); dis_i=dis_i+string_length(string(global.charOMove_f)); _omdone=1; break;}
   if (!_omdone) {dis_i+=string_length(_str)+1;} else {_omdone=0;}} else {dis_i+=1;}} else {break;}}}

return __adqwfrstr;
