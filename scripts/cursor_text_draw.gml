var xx,yy,str,w,h,col1,col2,prev_color,prev_alpha,bl,br,bt,bb,in;
xx = argument0;
yy = argument1;
str = argument2;
w = argument3 / 2;
h = argument4 / 2;
col1 = c_white;
col2 = c_black;
prev_color = draw_get_colour();
prev_alpha = draw_get_alpha();
bl = xx - w;
br = xx + w;
bt = yy - h;
bb = yy + h;
in = (mouse_x>bl && mouse_x<br && mouse_y>bt && mouse_y<bb);
if (str=='') {exit;}
if (in && global.buttonClickble) {
    if ((mouse_x-view_xview)+5+string_width(str)<=view_wview) {
        draw_set_colour(col2);
        draw_set_alpha(0.55); draw_set_font(Arial12);
        draw_rectangle_colour(mouse_x+8,mouse_y-2,mouse_x+12+string_width(str)+2,mouse_y+string_height(str)+2,col2,col2,col2,col2,0);
        draw_set_colour(col1); draw_set_alpha(1);
        draw_rectangle_colour(mouse_x+8,mouse_y-2,mouse_x+10+string_width(str)+2,mouse_y+string_height(str)+2,col1,col1,col1,col1,1);
        draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_font(Arial12);
        draw_text(mouse_x+12,mouse_y,str);}
    else {
        draw_set_colour(col2);
        draw_set_alpha(0.55); draw_set_font(Arial12);
        draw_rectangle_colour(mouse_x-string_width(str)+2,mouse_y-2,mouse_x+2+4,mouse_y+string_height(str)+2,col2,col2,col2,col2,0);
        draw_set_colour(col1); draw_set_alpha(1);
        draw_rectangle_colour(mouse_x-string_width(str)+2,mouse_y-2,mouse_x+2+2,mouse_y+string_height(str)+2,col1,col1,col1,col1,1);
        draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_font(Arial12);
        draw_text(mouse_x-string_width(str),mouse_y,str);}}
draw_set_colour(prev_color);
draw_set_alpha(prev_alpha);
