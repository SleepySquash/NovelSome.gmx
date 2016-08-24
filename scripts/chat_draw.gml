/*
chat_draw();
*/
var j, key_str;

draw_text_set(chat_font_a,c_white,fa_left,fa_top);
if (global.chat_open)
{    
    draw_text_set(chat_font_c,c_white,fa_left,fa_top);
    key_str = keyboard_string+"|";
    if (object_index==objChat) {if (!global.loggedIn) {key_str=lang.you_cant_write_untill_login;}}
    if (string_width(key_str) > chat_x2)
    {
        //key_str = string_delete(key_str,1,floor((string_width(key_str)-global.chat_x2)/global.chat_widthiest)); //delete known excess to reduce the while loop.
        //this might be expensive on the cpu if the key_str is several hundred characters. On my machine 200characters needs 6% cpu, but 1000 45%. Exponential by nature.
        while (string_width(key_str) > chat_x2)
        {
            key_str = string_delete(key_str,1,1);
        }
    }
    draw_text_set(chat_font_c,c_white,fa_left,fa_top);
    draw_text_soutline(view_xview[0]+chat_bar_x,view_yview[0]+chat_bar_y-chat_size,key_str);
}

if (global.chat_open) {draw_set_alpha(0.39);
draw_rectangle_colour(view_xview+10,view_yview[0]+chat_y,view_xview+view_wview-10,view_yview[0]+chat_y+chat_totallines*(chat_size+chat_break)+9,c_black,c_black,c_black,c_black,0);
draw_set_alpha(1);}
for (j = 0; j < chat_totallines; j += 1)
{
    if (global.chat_open||chat_alpha[j]>0) {
    draw_text_set(chat_font_a,chat_color[j],fa_left,fa_top);
    if (!global.chat_open) {draw_set_alpha(chat_alpha[j]);}
    draw_text_soutline_ext(view_xview[0]+chat_x,view_yview[0]+chat_y+j*(chat_size+chat_break),chat_pretitle[j]+chat_line[j]+chat_posttitle[j],chat_color[j],color_get_darkest(chat_color[j]));}
}
