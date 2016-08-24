bldef=""; num="_"; _count=1; while (num!="") {_ph=string_copy(argument0,argument1,_count);
if (string_copy(_ph,string_length(_ph),1)=="=" || string_copy(_ph,string_length(_ph),1)=="+" || string_copy(_ph,string_length(_ph),1)=="-") {
    _ph=string_copy(_ph,1,string_length(_ph)-1); num="";} else {_count+=1; if (_count+(argument1)>string_length(argument0)+1) {break;}}}
return (_ph);
