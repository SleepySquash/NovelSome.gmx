var __chosen,_argument2,__argument2,___tochoose,__s_listsize,__wordsize,__ivar,__act,__odef,__ovar,__opass,__ofound,__odothe,__oistr,_ooi;

//elaction, elaction1
if (!ds_exists(argument2,ds_type_list)) {exit;} if (ds_list_empty(argument2)) {exit;} __s_listsize=ds_list_size(argument2);
for (c_i=0;c_i<__s_listsize;c_i+=1) {if (!ds_exists(argument2,ds_type_list)) {exit;}
if (ds_list_empty(argument2)) {exit;} if (ds_list_size(argument2)<=c_i) {exit;}
_argument2 = ds_list_find_value(argument2,c_i);
if (string_copy(_argument2,1,string_length("page"))=="page") {__argument2=_argument2; _argument2="page;"}
else if (string_copy(_argument2,1,string_length("spage"))=="spage") {__argument2=_argument2; _argument2="spage;"}
__chosen=1; ___tochoose=string_get_tillsymbol(_argument2,1," "); switch (___tochoose) {
    case "play": if (object_index==obj3DObject) {}
        else {global.isTesting=0; if (elscen[argument0,argument1]!="") {
            game_init_ext(novid,elscen[argument0,argument1]);} else {game_init(novid);}} break;
    case "jumpto": if (object_index==obj3DObject) {
            if (scenario!="") {if (instance_exists(objSNv_wait)) {with (objSNv_wait) {instance_destroy();}}
                if (instance_exists(novel)) {if (novel.scenario == scenario) {novel.inRead_l="";} else {novel.scenario = scenario;}}}}
        else {if (elscen[argument0,argument1]!="") {
            if (instance_exists(novel)) {if (novel.scenario==elscen[argument0,argument1]) {novel.inRead_l="";} else {
                novel.scenario = elscen[argument0,argument1];}}}} break;
    case "jump": if (object_index==obj3DObject) {
            if (scenario!="") {if (instance_exists(objSNv_wait)) {with (objSNv_wait) {instance_destroy();}}
                if (instance_exists(novel)) {if (novel.scenario == scenario) {novel.inRead_l="";} else {novel.scenario = scenario;}}}}
        else {if (elscen[argument0,argument1]!="") {
            if (instance_exists(novel)) {if (novel.scenario==elscen[argument0,argument1]) {novel.inRead_l="";} else {
                novel.scenario = elscen[argument0,argument1];}}}} break;
    case "load": if (object_index==objGUI_ingame) {gpage=2;} else {
        for (ii=1;ii<=global.savCount;ii+=1) {if (sprite_exists(thspr[ii])) {sprite_delete(thspr[ii]);}} trTo=1;} break;
    case "save": if (object_index==objGUI_ingame) {gpage=1;} break;
    case "edit": if (!global.inGame) {goToEditor=1; global.nEDid=novid; global.isNExists=novid;} break;
    case "exit": game_end(); break;
    case "continue": if (global.canGamePause) {global.gamePause=0; objGUI_ingame.gpage=0;} break;
    case "pause": if (global.canGamePause) {global.gamePause=1; objGUI_ingame.gpage=0;} break;
    case "gamepause": if (global.canGamePause) {global.gamePause=!global.gamePause; objGUI_ingame.gpage=0;} break;
    case "menu": if (global.inGame) {novid=-1; game_deinit(); if (!global.isTesting) {room_goto(global.lRMenu);} else {if (instance_exists(novel)) {
        global.nEDid=novel.novid; global.isNExists=novel.novid;} room_goto(room_editor);}} break;
    case "options": if (object_index==objNMenu) {trTo=3;} else {if (global.canGamePause) {global.gamePause=1; objGUI_ingame.gpage=3;}} break;
    case "code": ____a_d=string_copy(_argument2,string_length("code ")+1,string_length(_argument2)-string_length("code "));
        with (skindat) {nss_extbegin(); _file=-1; handleLogic=0; __from=id;
        if (instance_exists(novel)) {__from=novel; novid=novel.novid;} else {novid=other.novid;}
        novelsomescript(other.____a_d,__from); nss_extend();} break;
    case "language": trTo=4; break;
    case "hudreset": hud_set(""); break;
    case "shudreset": hud_set_smooth(""); break;
    case "page": elCPage=real(string_copy(__argument2,string_length("page")+1,string_length(__argument2)-string_length("page"))); hudi=0; break;
    case "spage": trTo=5; elTPage=real(string_copy(__argument2,string_length("spage")+1,string_length(__argument2)-string_length("spage"))); break;
    default: __chosen=0; break;}
if (!__chosen) {
    __wordsize=0; for (__ivar=1;__ivar<=string_length(_argument2);__ivar+=1) {
        if (string_copy(_argument2,__ivar,1) == "=") {__wordsize=1; __act="=";}
        else if (string_copy(_argument2,__ivar,2) == "*=") {__wordsize=2; __act="*";}
        else if (string_copy(_argument2,__ivar,2) == "/=") {__wordsize=2; __act="/";}
        else if (string_copy(_argument2,__ivar,2) == "+=") {__wordsize=2; __act="+";}
        else if (string_copy(_argument2,__ivar,2) == "-=") {__wordsize=2; __act="-";}
        else if (string_copy(_argument2,__ivar,1) == "+") {__wordsize=1; __act="+";}
        else if (string_copy(_argument2,__ivar,1) == "-") {__wordsize=1; __act="-";}
        else if (string_copy(_argument2,__ivar,1) == "*") {__wordsize=1; __act="*";}
        else if (string_copy(_argument2,__ivar,1) == "/") {__wordsize=1; __act="/";}
        if (__wordsize>0) {break;}} if (__wordsize>0) {__oact=__act;
    __odef=string_copy(_argument2,__ivar+__wordsize,string_length(_argument2)-__ivar);
    __ovar=string_copy(_argument2,1,__ivar-1); __oistr=0; if (string_count('"',__odef) > 0) {
        __oistr=1; __odef = string_replace_all(__odef,'"',"");}
    if (__ovar!="" && __odef!="" && __oact!="") {__opass=1; if (__oistr) {if (__oact == "-" || __oact == "*") {__opass=0;}}
        if (__opass) {__ofound=0; for (_ooi=0;_ooi<2;_ooi+=1) {if (!__ofound) {__odothe=0;
            if (_ooi==0) {if (instance_exists(novel)) {_linkdb=novel.links; __odothe=1;}}
            else {if (novid>=-1) {_linkdb=novdat.links[novid]; __odothe=1;}}
            if (__odothe) {if (ds_exists(_linkdb,ds_type_map)) {if (ds_map_exists(_linkdb,__ovar)) {__ofound=1;
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
                        else {if (is_string(__oval)) {ds_map_replace(_linkdb,__ovar,string_replace_all(__oval,__odef,""));}} break;}}}}}}}}}}}
