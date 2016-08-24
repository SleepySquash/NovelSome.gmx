__ph=argument0;
while (string_copy(__ph,1,1) == " ") {if (string_length(__ph)<=1) {break;} else {__ph = string_copy(__ph,2,string_length(__ph)-1);}}
while (string_copy(__ph,1,1) == "=") {if (string_length(__ph)<=1) {break;} else {__ph = string_copy(__ph,2,string_length(__ph)-1);}}
while (string_copy(__ph,1,1) == " ") {if (string_length(__ph)<=1) {break;} else {__ph = string_copy(__ph,2,string_length(__ph)-1);}}
return __ph;
