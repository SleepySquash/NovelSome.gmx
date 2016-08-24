____ipos=1; ____str2=string_get_tillsymbol2(argument0,____ipos,' ',','); ____ipos+=string_length(____str2)+1;
    if (____str2!="") {____str3=string_get_tillsymbol2(argument0,____ipos,' ',','); ____ipos+=string_length(____str3)+1;
        if (____str3!="") {____str4=string_get_tillsymbol2(argument0,____ipos,' ',','); if (____str4!="") {
            return make_colour_rgb(string_convert_topos(____str2),string_convert_topos(____str3),string_convert_topos(____str4));}}}
