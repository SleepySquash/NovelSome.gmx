__count=1; __ph=""; while (1) {if (string_length(argument0)<argument1) {break;}
__ph=string_copy(argument0,argument1-__count+1,__count);
if (string_copy(__ph,string_length(__ph),1)==argument2) {__ph=string_copy(__ph,1,string_length(__ph)-1); break;} else {
    __count+=1; if (argument1-__count+1<=0) {break;} if (__count>=2048) {break;}}}
return (__ph);
