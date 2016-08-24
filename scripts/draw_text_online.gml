//Extreemly simple code to make your text have an outline
//example:
//draw_text_outline_ext(x,y,text,textcolor,outlinecolor) And thats it!

prevcolor = draw_get_colour();
draw_set_colour(argument3); _ssizetxt=argument4;
draw_text(argument0+_ssizetxt,argument1+_ssizetxt,argument2)
draw_text(argument0-_ssizetxt,argument1-_ssizetxt,argument2)
draw_text(argument0,argument1+_ssizetxt,argument2)
draw_text(argument0+_ssizetxt,argument1,argument2)
draw_text(argument0,argument1-_ssizetxt,argument2)
draw_text(argument0-_ssizetxt,argument1,argument2)
draw_text(argument0-_ssizetxt,argument1+_ssizetxt,argument2)
draw_text(argument0+_ssizetxt,argument1-_ssizetxt,argument2)
draw_set_colour(prevcolor);
