__count=1; __ph=""; while (1) {if (string_length(argument0)<argument1) {break;}
__ph=string_copy(argument0,argument1,__count);
if (string_copy(__ph,string_length(__ph),string_length(argument2))==argument2
|| string_copy(__ph,string_length(__ph),string_length(argument3))==argument3
|| string_copy(__ph,string_length(__ph),string_length(argument4))==argument4
|| string_copy(__ph,string_length(__ph),string_length(argument5))==argument5
|| string_copy(__ph,string_length(__ph),string_length(argument6))==argument6
|| string_copy(__ph,string_length(__ph),string_length(argument7))==argument7
|| string_copy(__ph,string_length(__ph),string_length(argument8))==argument8) {
    __ph=string_copy(__ph,1,string_length(__ph)-1); break;} else {
    __count+=1; if (argument1+__count-1>string_length(argument0)) {break;} if (__count>=2048) {break;}}}
return (__ph);
