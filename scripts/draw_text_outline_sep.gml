aprevcolor = draw_get_colour();
if (global.textOutline) {draw_set_colour(c_black);
if (global.textQuality) {
draw_text_ext(argument0+1,argument1+1,argument2,string_height("A"),argument3);
draw_text_ext(argument0-1,argument1-1,argument2,string_height("A"),argument3);
draw_text_ext(argument0,argument1+1,argument2,string_height("A"),argument3);
draw_text_ext(argument0+1,argument1,argument2,string_height("A"),argument3);
draw_text_ext(argument0,argument1-1,argument2,string_height("A"),argument3);
draw_text_ext(argument0-1,argument1,argument2,string_height("A"),argument3);
draw_text_ext(argument0-1,argument1+1,argument2,string_height("A"),argument3);
draw_text_ext(argument0+1,argument1-1,argument2,string_height("A"),argument3);} else {
draw_text_ext(argument0+1,argument1+1,argument2,string_height("A"),argument3);
draw_text_ext(argument0-1,argument1-1,argument2,string_height("A"),argument3);
draw_text_ext(argument0-1,argument1+1,argument2,string_height("A"),argument3);
draw_text_ext(argument0+1,argument1-1,argument2,string_height("A"),argument3);}}
draw_set_colour(c_white)
draw_text_ext(argument0,argument1,argument2,string_height("A"),argument3)
draw_set_colour(aprevcolor);
