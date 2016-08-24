_frstr=string(argument0);

if (_frstr!="") {_frstr=string_convert_standartph(_frstr);
_frstr=string_convert_tovar(_frstr);

if (string_count("!0",_frstr)>0 || string_count("!1",_frstr)>0) {___negative=1;}
_frstr=string_replace_all(_frstr,"!0",string("1"));
_frstr=string_replace_all(_frstr,"!1",string("0"));}

return _frstr;
