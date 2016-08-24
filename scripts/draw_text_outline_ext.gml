//Extreemly simple code to make your text have an outline
//example:
//draw_text_outline_ext(x,y,text,textcolor,outlinecolor) And thats it!
if (draw_get_alpha()<=0) {exit;}

prevcolor = draw_get_colour();
if (global.textOutline) {draw_set_colour(argument4)
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
draw_set_colour(argument3)
draw_text(argument0,argument1,argument2) 
draw_set_colour(prevcolor);
