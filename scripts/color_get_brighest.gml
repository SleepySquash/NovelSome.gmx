if (argument0==c_white) {return c_white; exit;}
if (argument0==c_black) {return c_white; exit;}
clr_red = color_get_red(argument0)+40;
clr_green = color_get_green(argument0)+40;
clr_blue = color_get_blue(argument0)+40;
return make_color_rgb(clr_red,clr_green,clr_blue);
