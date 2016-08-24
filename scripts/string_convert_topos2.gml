_frstr=string(argument0); if (_frstr=="") {return 0;}

if (_frstr!="") {_frstr = check_for_nonnumber(_frstr);}
if (_frstr=="") {return 0;}
realres=""; _result=ML_Interpret(global.mParser,_frstr); isok=ML_ResObj_GetCalculated(_result);
if (isok) {realres=ML_ResObj_GetFinalAnswer(_result);} ML_ResObj_Cleanup(_result);
return real(realres);
