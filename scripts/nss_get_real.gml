var _frstr, realres, _result, isok;

_frstr=argument0;
_frstr=string_replace_all(_frstr,"xcenter",string(global.wSW/2));
_frstr=string_replace_all(_frstr,"ycenter",string(global.wSH/2));
_frstr=string_replace_all(_frstr,"wleft","0");
_frstr=string_replace_all(_frstr,"wright",string(global.wSW));
_frstr=string_replace_all(_frstr,"wup","0");
_frstr=string_replace_all(_frstr,"wdown",string(global.wSH));
_frstr=string_replace_all(_frstr,"wtop","0");
_frstr=string_replace_all(_frstr,"wbottom",string(global.wSH));

_frstr=string_replace_all(_frstr,"mousex",string(mouse_x));
_frstr=string_replace_all(_frstr,"mousey",string(mouse_y));

//for (i=0;i<ds_map_size(_linkdb);i+=1) {if (i==0) {__find=ds_map_find_first(_linkdb);}
//    else {__find=ds_map_find_next(_linkdb,__find);} __v=ds_map_find_value(_linkdb,__find);
//    if (!is_undefined(__v)) {_frstr=string_replace_all(_frstr,string(__find),string(__v));}}
if (instance_exists(novel)) {_linkdb=novel.links; _linkdb1=novel.linkstype;
    for (its_ii=0;its_ii<ds_map_size(_linkdb);its_ii+=1) {if (its_ii==0) {__find=ds_map_find_first(_linkdb);}
    else {__find=ds_map_find_next(_linkdb,__find);} __v=ds_map_find_value(_linkdb,__find);
    if (!is_undefined(__v)) {__v1=ds_map_find_value(_linkdb1,__find);
        if (is_undefined(__v1)) {__v1="";} if (__v1!="instance") {
            _frstr=string_replace_all(_frstr,string(__find),string(__v));}}}}

_frstr = check_for_nonnumber(_frstr);

realres=""; _result=ML_Interpret(global.mParser,_frstr); isok=ML_ResObj_GetCalculated(_result);
if (isok) {realres=ML_ResObj_GetFinalAnswer(_result);} ML_ResObj_Cleanup(_result);
return real(realres);
