/*
**  Usage:
**      draw_get_button_outsimple(x,y,str,color1,color2,color3,back)
**
**  Arguments:
**      x,y         position to draw the center of the button
**      str         string to display inside the button
**      color1      color of the text when the mouse is not over the button
**      color2      color of the outline when the mouse is not over the button
**      color3      color of the background when the mouse is over the button
**      back        back
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
if (draw_get_alpha()<=0) {return 0; exit;}
    if (global.local_movingButtons) {
        xx1 = argument0;
        _yy1 = argument1;
        _bxx = xx1+((mouse_x-view_xview)*0.01);
        _yy = _yy1+((mouse_y-view_yview)*0.01);
    } else {
        _bxx = argument0;
        _yy = argument1;}
    _bstr = argument2;
    _btw = (string_width(_bstr)+4) / 2;
    _bth = (string_height(_bstr)+4) / 2;
    col1 = argument3;
    col2 = argument4;
    col3 = argument5;
    b = argument6;
    prev_color = draw_get_colour();
    prev_alpha = draw_get_alpha(); if (prev_alpha<=0) {return 0; exit;}
    bl = _bxx - _btw;
    br = _bxx + _btw;
    bt = _yy - _bth;
    bb = _yy + _bth;
    in = (mouse_x>bl && mouse_x<br && mouse_y>bt && mouse_y<bb && !global.mouseUnderNot);
    if (in && global.buttonClickble && global.btCl1) {_clr1=col1; _outclr1=col2;
        if (b) {draw_set_alpha(prev_alpha/2.5); draw_rectangle_colour(_bxx-_btw,_yy-_bth,_bxx+_btw,_yy+_bth,col3,col3,col3,col3,0);}
    }else{_clr1=col1; _outclr1=col2;}
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (in && global.buttonClickble) {global.underzipButton=1;}
    draw_set_alpha(prev_alpha);
    draw_text_soutline_ext(round(_bxx),round(_yy),_bstr,_clr1,_outclr1);
    draw_set_colour(prev_color);
    draw_set_alpha(prev_alpha);
    if (in && mouse_check_button_pressed(mb_left) && global.buttonClickble && global.btCl1) {mouse_clear(mb_left); return 1;}
    else {return 0;}
