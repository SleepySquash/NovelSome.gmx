for (_rstr=string_length(argument0)-1;_rstr>=0;_rstr-=1) {
    if (string_copy(argument0,_rstr,1) == "\" || string_copy(argument0,_rstr,1) == "/") {
        return string_copy(argument0,1,_rstr-1);}} return "\";
