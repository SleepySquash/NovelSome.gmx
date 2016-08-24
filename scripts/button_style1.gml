/*
**  Usage:
**      draw_get_button(x,y,str,color1,color2,color3,back)
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
    var xx,_yy,str,w,h,col1,col2,col3,prev_color,prev_alpha,bl,br,bt,bb,in,b;
    if (global.local_movingButtons) {
        xx1 = argument0;
        yy1 = argument1;
        xx = xx1+((mouse_x-view_xview)*0.01);
        _yy = yy1+((mouse_y-view_yview)*0.01);
    } else {
        xx = argument0;
        _yy = argument1;}
    str = argument2;
    w = (string_width(str)+4) / 2;
    h = (string_height(str)+4) / 2;
    col1 = argument3;
    col2 = argument4;
    col3 = argument5;
    b = argument6;
    prev_color = draw_get_colour();
    prev_alpha = draw_get_alpha();
    bl = xx - w;
    br = xx + w;
    bt = _yy - h;
    bb = _yy + h;
    in = (mouse_x>bl && mouse_x<br && mouse_y>bt && mouse_y<bb && !global.mouseUnderNot);
    if (b && !in) {draw_set_alpha(prev_alpha/2.5); draw_rectangle_colour(xx-w,_yy-h,xx+w,_yy+h,col3,col3,col3,col3,0);}
    if (in && global.buttonClickble) {
        draw_set_colour(col3);
        draw_set_alpha(prev_alpha/2);
        draw_sprite_pos(global.loadedSpriteGUI_buttonShadow,-1,bl-100,bt,br+100,bt,br+100,bb,bl-100,bb,prev_alpha/2);
        draw_set_alpha(prev_alpha);}
    if (in && global.buttonClickble) {_clr1=col2; _outclr1=col1;
    }else{_clr1=col1; _outclr1=col2;}
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (in && global.buttonClickble) {global.underzipButton=1;}
    draw_text_soutline_ext(xx,_yy,str,_clr1,_outclr1);
    draw_set_colour(prev_color);
    draw_set_alpha(prev_alpha);
    if (in && mouse_check_button_pressed(mb_left) && global.buttonClickble) {mouse_clear(mb_left); return true;}
    else {return false;}
}
