__adqwfrstr=argument0;

dis_i=1; _omdone=0; if (__adqwfrstr!="") {while (1) {if (dis_i<=string_length(__adqwfrstr)) {
    _str=string_get_tillsymbol7(__adqwfrstr,dis_i,' ','+','-','*','/',')','('); if (_str != "") {switch (_str) {default: break;
        case "normal": __adqwfrstr=string_replace(__adqwfrstr,"normal","-100"); dis_i=dis_i+string_length("-100"); _omdone=1; break;
        case "close": __adqwfrstr=string_replace(__adqwfrstr,"close","-110"); dis_i=dis_i+string_length("-110"); _omdone=1; break;
        case "far": __adqwfrstr=string_replace(__adqwfrstr,"far","-90"); dis_i=dis_i+string_length("-90"); _omdone=1; break;
        case "n": __adqwfrstr=string_replace(__adqwfrstr,"n","-100"); dis_i=dis_i+string_length("-100"); _omdone=1; break;
        case "c": __adqwfrstr=string_replace(__adqwfrstr,"c","-110"); dis_i=dis_i+string_length("-110"); _omdone=1; break;
        case "f": __adqwfrstr=string_replace(__adqwfrstr,"f","-90"); dis_i=dis_i+string_length("-90"); _omdone=1; break;}
   if (!_omdone) {dis_i+=string_length(_str)+1;} else {_omdone=0;}} else {dis_i+=1;}} else {break;}}}

return __adqwfrstr;
