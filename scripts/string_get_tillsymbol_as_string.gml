__count=1; __ph=""; _n1_count=0; _n2_count=0;

while (1) {if (string_length(argument0)<argument1) {break;} if (string_length(argument0)<__count) {break;}
__ph=string_copy(argument0,argument1,__count);
if (string_copy(__ph,string_length(__ph),1)=='(') {_n1_count+=1; __count+=1;}
else if (string_copy(__ph,string_length(__ph),1)==')') {_n1_count-=1; __count+=1;}
else if (string_copy(__ph,string_length(__ph),1)=='"') {_n2_count=!_n2_count; __count+=1;}
else if (string_copy(__ph,string_length(__ph),string_length(argument2))==argument2 && _n1_count<=0 && _n2_count<=0) {
    __ph=string_copy(__ph,1,string_length(__ph)-1); break;}
else {__count+=1; if (argument1+__count-1>string_length(argument0)) {break;} if (__count>=2048) {break;}}}

return (__ph);
