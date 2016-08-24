__count=1; __ph=""; __found=0; __addpos=0;
while (1) {if (string_length(argument0)<argument1+__addpos) {break;}
    __ph=string_copy(argument0,argument1+__addpos,__count);
    if (string_copy(__ph,string_length(__ph),1)==argument2 && __found) {
        __ph=string_copy(__ph,1,string_length(__ph)-1); break;}
    else {if (string_copy(__ph,string_length(__ph),1) != "=") {__found=1;
        __count+=1; if (argument1+__addpos+__count-1>string_length(argument0)) {
        break;} if (__count>=2048) {break;}} else {__addpos+=1;}}}
while (string_copy(__ph,1,1) == " ") {if (string_length(__ph)<=1) {break;} else {__ph = string_copy(__ph,2,string_length(__ph)-1);}} return (__ph);
