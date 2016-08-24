/*
**  Usage:
**      draw_get_button_invisible(x,y,width,height,back,outline)
**
**  Arguments:
**      x,y         position to draw the center of the button
**      str         string to display inside the button
**      width       width of the button
**      height      height of the button
**      color1      color of the text when the mouse is not over the button
**      color2      color of the text when the mouse is over the button
**      color3      color of the background when the mouse is over the button
**
**  Returns:
**      TRUE if the button is clicked on by the mouse, FALSE otherwise
**
**  Notes:
**      This function is designed to be called during the Draw Event.
**      It draws a simple, semi-transparent button on the screen that
**      can be clicked with the mouse. It is primarily intended for
**      debugging and testing purposes. It changes the text alignment
**      settings to horizontal and vertical centering.
**
**  GMLscripts.com
*/
{
    var xx,yy,str,w,h,col1,col2,col3,prev_color,prev_alpha,bl,br,bt,bb,in,b;
    if (global.local_movingButtons) {
        xx1 = argument0;
        yy1 = argument1;
        xx = xx1+((mouse_x-view_xview)*0.01);
        yy = yy1+((mouse_y-view_yview)*0.01);
    } else {
        xx = argument0;
        yy = argument1;}
    w = argument2 / 2;
    h = argument3 / 2;
    b = argument4;
    o = argument5;
    prev_color = draw_get_colour();
    prev_alpha = draw_get_alpha();
    bl = xx - w;
    br = xx + w;
    bt = yy - h;
    bb = yy + h;
    in = (mouse_x>bl && mouse_x<br && mouse_y>bt && mouse_y<bb && !global.mouseUnderNot);
    if (in && global.buttonClickble) {
        if (o) {
            draw_set_colour(c_white); draw_set_alpha(1);
            draw_rectangle_colour(bl,bt,br,bb,c_white,c_white,c_white,c_white,1);}
        if (b) {draw_set_alpha(prev_alpha-0.6);/*0.4*/ draw_rectangle_colour(xx-w,yy-h,xx+w,yy+h,c_black,c_black,c_black,c_black,false);}}
    draw_set_colour(prev_color);
    draw_set_alpha(prev_alpha);
    if (in && global.buttonClickble) {global.underzipButton=1;}
    if (in && mouse_check_button_pressed(mb_left) && global.buttonClickble) {mouse_clear(mb_left); return true;}
    else {return false;}
}
