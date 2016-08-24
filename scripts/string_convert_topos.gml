var _frstr,_result,realres,isok;

_frstr=string(argument0); if (_frstr=="") {return 0;}


/*___stepdone=0; while (string_count("widthof(",_frstr)>0) {for (_toposi=1;_toposi<=string_length(_frstr)-string_length("widthof()");_toposi+=1) {
    if (string_copy(_frstr,_toposi,string_length("widthof(")) == "widthof(") {_toposstr=string_get_tillsymbol(_frstr,_toposi,")");
        if (_toposstr=="") {string_replace(_frstr,"widthof(","");} else {_toposstr1=string_convert_topos(_toposstr);
            string_replace(_frstr,"widthof("+_toposstr+")",string(_toposstr1));}}} ___stepdone+=1; if (___stepdone>20) {break;}}*/

/*if (instance_exists(novel)) {_linkdb=novel.links; _linkdb1=novel.linkstype;
    for (its_ii=0;its_ii<ds_map_size(_linkdb);its_ii+=1) {if (its_ii==0) {__find=ds_map_find_first(_linkdb);}
    else {__find=ds_map_find_next(_linkdb,__find);} __v=ds_map_find_value(_linkdb,__find);
    if (!is_undefined(__v)) {__v1=ds_map_find_value(_linkdb1,__find);
        if (is_undefined(__v1)) {__v1="";} if (__v1!="instance") {
            _frstr=string_replace_all(_frstr,string(__find),string(__v));}}}}
if (novid>=0) {_linkdb=novdat.links[novid]; _linkdb1=novdat.linkstype[novid];
    for (its_ii=0;its_ii<ds_map_size(_linkdb);its_ii+=1) {if (its_ii==0) {
    __find=ds_map_find_first(_linkdb);} else {__find=ds_map_find_next(_linkdb,__find);}
    __v=ds_map_find_value(_linkdb,__find); if (!is_undefined(__v)) {__v1=ds_map_find_value(_linkdb1,__find);
        if (is_undefined(__v1)) {__v1="";} if (__v1!="instance") {
            _frstr=string_replace_all(_frstr,string(__find),string(__v));}}}}*/
_frstr=string_convert_tovar(_frstr);
_frstr=string_convert_standartph(_frstr);

if (string_count("!0",_frstr)>0 || string_count("!1",_frstr)>0) {___negative=1;}
_frstr=string_replace_all(_frstr,"!0",string("1"));
_frstr=string_replace_all(_frstr,"!1",string("0"));

if (_frstr!="") {_frstr = check_for_nonnumber(_frstr);}
if (_frstr=="") {return 0;} if (string_count(" ",_frstr)==string_length(_frstr)) {return 0;}
realres=""; _result=ML_Interpret(global.mParser,_frstr); isok=ML_ResObj_GetCalculated(_result);
if (isok) {realres=ML_ResObj_GetFinalAnswer(_result);} ML_ResObj_Cleanup(_result);
return real(realres);
