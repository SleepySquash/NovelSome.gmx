/*
chat_add(string);
argument0: the string to add
*/
var i, j, k, length, char, working_string;
draw_set_font(chat_font_a);
if (global.selChatTab!=tab||(!global.chat_open && !alphaOn)) {smNew=1; if (!notNot) {global.smNew=1; if (global.soundIs) {
        audio_play_sound(sndGUI_chat,1,0); audio_sound_gain(sndGUI_chat,0,0); audio_sound_gain(sndGUI_chat,global.soundVolume,0);}
    objChat.notTime=0; if (objChat.notT==2) {objChat.notT=0;}
    if (tab==0) {objChat.frM="Console";} else if (tab==1) {objChat.frM="Chat";}}}

//determine if a line break is necessary
if (string_width(argument0) > chat_x2)
{
    i = 1;
    length = string_length(argument0);
    working_string = "";
    while (i <= length)
    {
        char = string_char_at(argument0,i);
        working_string += char; //probably faster than string_copy for larger strings?
        if (string_width(working_string) > chat_x2)
        {
            for (j = 0; j < chat_totallines-1; j += 1)
            {
                chat_line[j] = chat_line[j+1];
                chat_alpha[j] = chat_alpha[j+1];
                chat_color[j] = chat_color[j+1];
                chat_alpha_t[j] = chat_alpha_t[j+1];
                chat_alpha_time[j] = chat_alpha_time[j+1];
                chat_pretitle[j] = chat_pretitle[j+1];
                chat_posttitle[j] = chat_posttitle[j+1];
            }
            k = 0;
            working_char = string_char_at(argument0,i);
            while (working_char != " ")
            {
                k += 1;
                if (k+1 >= i) {k = 0; break;} //incase there is an uber long word, longer than a line!
                working_char = string_char_at(argument0,i-k);
            }
            chat_line[j] = string_delete(working_string,string_length(working_string)-k,1+k);
            chat_alpha[j] = 0;
            chat_color[j] = c_white;
            chat_alpha_t[j] = 0;
            chat_alpha_time[j] = 0;
            chat_pretitle[j] = "";
            chat_posttitle[j] = "";
            chat_add_color(string_copy(argument0,i-k,string_length(argument0)-i+1+k),argument1);
            exit;
        }    
        i += 1;
    }
}
//otherwise add the single line
for (j = 0; j < chat_totallines-1; j += 1)
{
    chat_line[j] = chat_line[j+1];
    chat_alpha[j] = chat_alpha[j+1];
    chat_color[j] = chat_color[j+1];
    chat_alpha_t[j] = chat_alpha_t[j+1];
    chat_alpha_time[j] = chat_alpha_time[j+1];
    chat_pretitle[j] = chat_pretitle[j+1];
    chat_posttitle[j] = chat_posttitle[j+1];
}
chat_line[j] = argument0;
chat_alpha[j] = 0;
chat_color[j] = argument1;
chat_alpha_t[j] = 0;
chat_alpha_time[j] = 0;
chat_pretitle[j] = "";
chat_posttitle[j] = "";
