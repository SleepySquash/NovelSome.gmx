//elaction, elaction1
if (argument2=="") {exit;} __chosen=1; ___tochoose=string_get_tillsymbol(argument2,1," ");
switch (argument2) {case "play": global.isTesting=0; if (elscen[argument0,argument1]!="") {
        game_init_ext(novid,elscen[argument0,argument1]);} else {game_init(novid);} break;
    case "jumpto": if (elscen[argument0,argument1]!="") {
        if (instance_exists(novel)) {if (novel.scenario==elscen[argument0,argument1]) {novel.inRead_l="";} else {
            novel.scenario = elscen[argument0,argument1];}}} break;
    case "jump": if (elscen[argument0,argument1]!="") {
        if (instance_exists(novel)) {if (novel.scenario==elscen[argument0,argument1]) {novel.inRead_l="";} else {
            novel.scenario = elscen[argument0,argument1];}}} break;
    case "load": for (ii=1;ii<=global.savCount;ii+=1) {if (sprite_exists(thspr[ii])) {sprite_delete(thspr[ii]);}} trTo=1; break;
    case "edit": goToEditor=1; global.nEDid=novid; global.isNExists=novid; break;
    case "exit": game_end(); break;
    case "options": trTo=3; break;
    case "code": with (skindat) {nss_extbegin(); _file=-1; handleLogic=0; __from=id;
        if (instance_exists(novel)) {__from=novel;} novelsomescript(argument3,__from); nss_extend();} break;
    case "language": trTo=4; break;
    case "hudreset": hud_set(""); break;
    case "shudreset": hud_set_smooth(""); break;
    case "page": elCPage=argument3; hudi=0; break;
    case "spage": trTo=5; elTPage=argument3; break;
    default: __chosen=0; break;}
if (!__chosen) {
    __wordsize=0; for (__ivar=1;__ivar<=string_length(argument2);__ivar+=1) {
        if (string_copy(argument2,__ivar,1) == "=") {__wordsize=1; __act="=";}
        else if (string_copy(argument2,__ivar,2) == "*=") {__wordsize=2; __act="*";}
        else if (string_copy(argument2,__ivar,2) == "/=") {__wordsize=2; __act="/";}
        else if (string_copy(argument2,__ivar,2) == "+=") {__wordsize=2; __act="+";}
        else if (string_copy(argument2,__ivar,2) == "-=") {__wordsize=2; __act="-";}
        else if (string_copy(argument2,__ivar,1) == "+") {__wordsize=1; __act="+";}
        else if (string_copy(argument2,__ivar,1) == "-") {__wordsize=1; __act="-";}
        else if (string_copy(argument2,__ivar,1) == "*") {__wordsize=1; __act="*";}
        else if (string_copy(argument2,__ivar,1) == "/") {__wordsize=1; __act="/";}
        if (__wordsize>0) {break;}} if (__wordsize>0) {__oact=__act;
    __odef=string_copy(argument2,__ivar+__wordsize,string_length(argument2)-__ivar);
    __ovar=string_copy(argument2,1,__ivar-1); __oistr=0; if (string_count('"',__odef) > 0) {
        __oistr=1; __odef = string_replace_all(__odef,'"',"");}
    if (__ovar!="" && __odef!="" && __oact!="") {__opass=1; if (__oistr) {if (__oact == "-" || __oact == "*") {__opass=0;}}
        if (__opass) {__ofound=0; for (_ooi=0;_ooi<2;_ooi+=1) {if (!__ofound) {__odothe=0;
            if (_ooi==0) {if (instance_exists(novel)) {_linkdb=novel.links; __odothe=1;}}
            else {if (novid>=-1) {_linkdb=novdat.links[novid]; __odothe=1;}}
            if (__odothe) {if (ds_map_exists(_linkdb,__ovar)) {__ofound=1;
                __oval=ds_map_find_value(_linkdb,__ovar); if (!__oistr) {__odef = string_convert_topos(__odef);}
                switch (__oact) {case "=": ds_map_replace(_linkdb,__ovar,__odef); break;
                    case "+": if (!__oistr) {if (is_real(__oval)) {ds_map_replace(_linkdb,__ovar,__oval+__odef);}
                            else {if (is_undefined(__oval)) {ds_map_replace(_linkdb,__ovar,__odef);}}}
                        else {if (is_string(__oval)) {ds_map_replace(_linkdb,__ovar,__oval+__odef);}
                            else {if (is_undefined(__oval)) {ds_map_replace(_linkdb,__ovar,__odef);}}} break;
                    case "-": if (!__oistr) {if (is_real(__oval)) {ds_map_replace(_linkdb,__ovar,__oval-__odef);}
                            else {if (is_undefined(__oval)) {ds_map_replace(_linkdb,__ovar,-__odef);}}} break;
                    case "*": if (!__oistr) {if (is_real(__oval)) {ds_map_replace(_linkdb,__ovar,__oval*__odef);}
                            else {if (is_undefined(__oval)) {ds_map_replace(_linkdb,__ovar,__odef);}}} break;
                    case "/": if (!__oistr) {if (is_real(__oval)) {ds_map_replace(_linkdb,__ovar,__oval/__odef);}
                            else {if (is_undefined(__oval)) {ds_map_replace(_linkdb,__ovar,__odef);}}}
                        else {if (is_string(__oval)) {ds_map_replace(_linkdb,__ovar,string_replace_all(__oval,__odef,""));}} break;}}}}}}}}}
