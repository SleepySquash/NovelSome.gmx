/*__count=1; __ph=""; while (1) {if (string_length(argument0)<argument1) {break;}
__ph=string_copy(argument0,argument1,__count); ___tspass=1;
if (string_copy(__ph,string_length(__ph),string_length(argument2))==argument2
|| string_copy(__ph,string_length(__ph),string_length(argument3))==argument3) {___tspass1=1;
    if (string_copy(argument0,string_length(__ph),1)) {
        if (___tspass1) {__ph=string_copy(__ph,1,string_length(__ph)-1); ___tspass=0; break;}}}
    if (___tspass) {__count+=1; if (argument1+__count-1>string_length(argument0)) {break;} if (__count>=2048) {break;}}}
return (__ph);*/
