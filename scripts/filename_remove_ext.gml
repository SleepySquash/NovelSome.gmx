for (f_i=string_length(argument0);f_i>0;f_i-=1) {if (string_copy(argument0,f_i,1) == ".") {
    return string_copy(argument0,1,f_i-1);}}
return argument0;
