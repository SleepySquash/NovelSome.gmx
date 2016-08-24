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
    _xx = argument0;
    _yy = argument1;
    _spr1 = argument2;
    _spr2 = argument3;
    if (sprite_exists(_spr1)) {_w = sprite_get_width(_spr1) / 2;
        _h = sprite_get_height(_spr1) / 2;} else if (sprite_exists(_spr2)) {
        _w = sprite_get_width(_spr2) / 2; _h = sprite_get_height(_spr2) / 2;}
    _prev_color = draw_get_colour();
    _prev_alpha = draw_get_alpha();
    _in=0; if (!global.mouseUnderNot && global.buttonClickble) {if (sprite_exists(_spr1)) {
    _in = (mouse_x>_xx+sprite_get_bbox_left(_spr1) && mouse_x<_xx+sprite_get_bbox_right(_spr1) && mouse_y>_yy+sprite_get_bbox_top(_spr1) && mouse_y<_yy+sprite_get_bbox_bottom(_spr1));}
    else if (sprite_exists(_spr2)) {_in = (mouse_x>_xx+sprite_get_bbox_left(_spr2) && mouse_x<_xx+sprite_get_bbox_right(_spr2) && mouse_y>_yy+sprite_get_bbox_top(_spr2) && mouse_y<_yy+sprite_get_bbox_bottom(_spr2));}}
    //_in = (mouse_x>_bl && mouse_x<_br && mouse_y>_bt && mouse_y<_bb && !global.mouseUnderNot);
    if (_in && global.buttonClickble && global.btCl1) {if (sprite_exists(_spr2)) {draw_sprite_ext(_spr2,0,_xx,_yy,1,1,0,c_white,_prev_alpha);}}
    else {if (sprite_exists(_spr1)) {draw_sprite_ext(_spr1,0,_xx,_yy,1,1,0,c_white,_prev_alpha);}}
    if (_in && global.buttonClickble && global.btCl1) {global.underzipButton=1;}
    if (_in && mouse_check_button_pressed(mb_left) && global.btCl1 && global.buttonClickble) {mouse_clear(mb_left); return 1;} else {return 0;}
    draw_set_colour(_prev_color);
}
