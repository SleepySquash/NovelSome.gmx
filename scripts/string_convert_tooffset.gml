_frstr=argument1; if (_frstr=="") {return 0;}

dis_i=1; _omdone=0; if (_frstr!="") {while (1) {if (dis_i<=string_length(_frstr)) {
    _str=string_get_tillsymbol7(_frstr,dis_i,' ','+','-','*','/',')','('); if (_str != "") {switch (_str) {default: break;
        case "xcenter": _frstr=string_replace(_frstr,"xcenter",string(sprite_get_width(argument0)/2)); dis_i=dis_i+string_length(string(sprite_get_width(argument0)/2)); _omdone=1; break;
        case "ycenter": _frstr=string_replace(_frstr,"ycenter",string(sprite_get_height(argument0)/2)); dis_i=dis_i+string_length(string(sprite_get_height(argument0)/2)); _omdone=1; break;
        
        case "width": _frstr=string_replace(_frstr,"width",string(sprite_get_width(argument0))); dis_i=dis_i+string_length(string(sprite_get_width(argument0))); _omdone=1; break;
        case "height": _frstr=string_replace(_frstr,"height",string(sprite_get_height(argument0))); dis_i=dis_i+string_length(string(sprite_get_height(argument0))); _omdone=1; break;
        case "left": _frstr=string_replace(_frstr,"left","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "right": _frstr=string_replace(_frstr,"right",string(sprite_get_width(argument0))); dis_i=dis_i+string_length(string(sprite_get_width(argument0))); _omdone=1; break;
        case "up": _frstr=string_replace(_frstr,"up","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "down": _frstr=string_replace(_frstr,"down",string(sprite_get_height(argument0))); dis_i=dis_i+string_length(string(sprite_get_height(argument0))); _omdone=1; break;
        case "top": _frstr=string_replace(_frstr,"top","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "bottom": _frstr=string_replace(_frstr,"bottom",string(sprite_get_height(argument0))); dis_i=dis_i+string_length(string(sprite_get_height(argument0))); _omdone=1; break;
        
        case "wleft": _frstr=string_replace(_frstr,"wleft","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wright": _frstr=string_replace(_frstr,"wright",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wup": _frstr=string_replace(_frstr,"wup","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wdown": _frstr=string_replace(_frstr,"wdown",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "wtop": _frstr=string_replace(_frstr,"wtop","0"); dis_i=dis_i+string_length("0"); _omdone=1; break;
        case "wbottom": _frstr=string_replace(_frstr,"wbottom",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "wwidth": _frstr=string_replace(_frstr,"wwidth",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wheight": _frstr=string_replace(_frstr,"wheight",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        case "ww": _frstr=string_replace(_frstr,"ww",string(global.wSW)); dis_i=dis_i+string_length(string(global.wSW)); _omdone=1; break;
        case "wh": _frstr=string_replace(_frstr,"wh",string(global.wSH)); dis_i=dis_i+string_length(string(global.wSH)); _omdone=1; break;
        }
   if (!_omdone) {dis_i+=string_length(_str)+1;} else {_omdone=0;}} else {dis_i+=1;}} else {break;}}}

_frstr = check_for_nonnumber(_frstr); if (_frstr=="") {return 0;}

realres=""; _result=ML_Interpret(global.mParser,_frstr); isok=ML_ResObj_GetCalculated(_result);
if (isok) {realres=ML_ResObj_GetFinalAnswer(_result);} ML_ResObj_Cleanup(_result);
return real(realres);
