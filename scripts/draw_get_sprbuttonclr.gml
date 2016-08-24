/*
**  Usage:
**      draw_get_sprbuttonclr(x,y,spr,clr,outclr)
**
**  Arguments:
**      x,y         position to draw the center of the button
**      spr         sprite
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
    var xx,yy,w,h,bl,br,bt,bb,in;
    xx = argument0;
    yy = argument1;
    spr = argument2;
    w = sprite_get_width(spr) / 2;
    h = sprite_get_height(spr) / 2;
    prev_color = draw_get_colour();
    prev_alpha = draw_get_alpha();
    bl = xx - w;
    br = xx + w;
    bt = yy - h;
    bb = yy + h;
    in = (mouse_x>bl && mouse_x<br && mouse_y>bt && mouse_y<bb && !global.mouseUnderNot);
    if (in && global.buttonClickble) {
        draw_sprite_ext(spr,1,xx,yy,1,1,0,argument4,prev_alpha);
    } else {draw_sprite_ext(spr,0,xx,yy,1,1,0,argument3,prev_alpha);}
    if (in && global.buttonClickble) {global.underzipButton=1;}
    if (in && mouse_check_button_pressed(mb_left) && global.buttonClickble) {mouse_clear(mb_left); return true;}
    else {return false;}
    draw_set_colour(prev_color);
}
