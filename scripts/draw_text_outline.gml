prevcolor = draw_get_colour();
if (global.textOutline) {draw_set_colour(c_black);
if (global.textQuality) {
draw_text(argument0+1,argument1+1,argument2);
draw_text(argument0-1,argument1-1,argument2);
draw_text(argument0,argument1+1,argument2);
draw_text(argument0+1,argument1,argument2);
draw_text(argument0,argument1-1,argument2);
draw_text(argument0-1,argument1,argument2);
draw_text(argument0-1,argument1+1,argument2);
draw_text(argument0+1,argument1-1,argument2);} else {
draw_text(argument0+1,argument1+1,argument2);
draw_text(argument0-1,argument1-1,argument2);
draw_text(argument0-1,argument1+1,argument2);
draw_text(argument0+1,argument1-1,argument2);}}
draw_set_colour(c_white)
draw_text(argument0,argument1,argument2)
draw_set_colour(prevcolor);
