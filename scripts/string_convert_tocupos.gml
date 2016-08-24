_frstr=argument0; if (_frstr=="") {return 0;}

_frstr=string_convert_standartph_string_cupos(_frstr);
_frstr=string_convert_tovar(_frstr);

_frstr = check_for_nonnumber(_frstr);
if (_frstr=="") {return 0;} if (string_count(" ",_frstr)==string_length(_frstr)) {return 0;}

realres=""; _result=ML_Interpret(global.mParser,_frstr); isok=ML_ResObj_GetCalculated(_result);
if (isok) {realres=ML_ResObj_GetFinalAnswer(_result);} ML_ResObj_Cleanup(_result);
return real(realres);
