/*
**  Usage:
**      cursor_under_button(x,y,width,height)
**
**  Arguments:
**      x,y         position to draw the center of the button
**      width       width of the button
**      height      height of the button
**
**  Returns:
**      TRUE if the button is under the mouse, FALSE otherwise
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
    xx = argument0;
    yy = argument1;
    w = argument2 / 2;
    h = argument3 / 2;
    bl = xx - w;
    br = xx + w;
    bt = yy - h;
    bb = yy + h;
    in = (mouse_x>bl && mouse_x<br && mouse_y>bt && mouse_y<bb);
    if (in) {return true;}else{return false;}
}
