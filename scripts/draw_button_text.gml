if (draw_get_colour()==c_white) {outcolor=c_gray;
} else if (draw_get_colour()==c_black) {outcolor=c_gray;
} else if (draw_get_colour()==c_gray) {outcolor=c_white;
} else {outcolor=color_get_darkest(draw_get_colour());}
//outcolor=make_color_rgb(color_get_red(draw_get_color())-30,color_get_green(draw_get_color())-30,color_get_blue(draw_get_color())-30);
if (draw_get_colour()==outcolor) {outcolor=c_white;}
if (draw_get_colour()==outcolor) {outcolor=c_gray;}
draw_text_soutline_ext(argument0,argument1,argument2,draw_get_colour(),outcolor);
