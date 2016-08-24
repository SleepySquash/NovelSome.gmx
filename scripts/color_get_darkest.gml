if (argument0==c_white) {return c_black; exit;} //if (argument0==c_black) {return c_white; exit;}
if (colour_get_value(argument0)-80>0) {
    return make_colour_hsv(colour_get_hue(argument0),colour_get_saturation(argument0),colour_get_value(argument0)-80);}
else {return make_colour_hsv(colour_get_hue(argument0),colour_get_saturation(argument0),0);}
/*if (argument0==c_white) {return c_black; exit;}
if (argument0==c_black) {return c_white; exit;}
if (color_get_red(argument0)-40<0) {clr_red = 0;} else {clr_red = color_get_red(argument0)-40;}
if (color_get_green(argument0)-40<0) {clr_green = 0;} else {clr_green = color_get_green(argument0)-40;}
if (color_get_blue(argument0)-40<0) {clr_blue = 0;} else {clr_blue = color_get_blue(argument0)-40;}
return make_color_rgb(clr_red,clr_green,clr_blue);
