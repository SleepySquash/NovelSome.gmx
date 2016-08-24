/*
chat_init(font,x,y,x2,y2,lines,chatbar_x,chatbar_y,color,linebreak,chatbar_chars);
argument0: font, the first argument required in font_add();
argument1: top left corner x value
argument2: top left corner y value
argument3: bottom right corner x value, also width in pixels before a line break is necessary
argument4: bottom right corner y value
argument5: lines to be stored
argument6: the x value of the singular line that displays the keyboard_string
argument7: the BOTTOM y value of the singular line that displays the keyboard_string, ie y2
argument8: chat color
argument9: the amount of pixels between lines
argument10: the amount of characters on the chat bar before cut off. I recommend a maximum of the width of chat bar*2, else the while loop will have to do a lot of work.
note:
    these scripts are not native to any one object, so you may initialize them in a and draw them in b, yet add them from c.
    by default these scripts bind the x/y values to the room view[0], if you wish to change this look in chat_draw.
*/
var i, j, widthiest, char;
chat_size = round(((argument4-argument2)-(argument9*argument5)-1)/argument5); //not sure how this rounding works in gm for font_add, so stuck in a round()...
keybstring=""; _justavar=argument0;

//global.chat_font_a = font_add(argument0,global.chat_size,0,0,32,127); //none
//global.chat_font_b = font_add(argument0,global.chat_size,1,0,32,127); //bold
//global.chat_font_c = font_add(argument0,global.chat_size,0,1,32,127); //italics
//global.chat_font_d = font_add(argument0,global.chat_size,1,1,32,127); //both
chat_font_a = LucidaConsole14/*font_add(argument0,global.chat_size,0,0,0,255);*/ //none
chat_font_b = LucidaConsole14/*font_add(argument0,global.chat_size,1,0,0,255);*/ //bold
chat_font_c = LucidaConsole14/*font_add(argument0,global.chat_size,0,1,0,255);*/ //italics
chat_font_d = LucidaConsole14/*font_add(argument0,global.chat_size,1,1,0,255);*/ //both
chat_x = argument1;
chat_y = argument2;
chat_x2 = argument3;
chat_y2 = argument4;
chat_totallines = argument5;
chat_bar_x = argument6;
chat_bar_y = argument7;
/*global.chat_color*/abadsa = argument8;
chat_break = argument9;
chat_bar_chars = argument10;
global.chat_open = 0;
global.typingObject = -1;
global.isTyping = 0;
chat_string="";

for (j = 0; j < chat_totallines; j += 1)
{
    chat_line[j] = "";
    chat_alpha[j] = 0;
    chat_color[j] = c_white;
    chat_alpha_t[j] = 0;
    chat_alpha_time[j] = 0;
    chat_pretitle[j] = "";
    chat_posttitle[j] = "";
}

draw_set_font(chat_font_a); //call this once because if chat_add is called before chat_draw the font size is not set correctly for multiple lined messages

widthiest = 0;
//determine the widest character to speed up the chat bar scrolling
for (i = 32; i <= 127; i += 1)
{
    char = chr(i);
    if (string_width(char) > widthiest)
    {
        widthiest = string_width(char);
        chat_widthiest = widthiest;
    }
}

//chat_add("Chat example with line breaks and word breaks, these scripts are powerful and relatively light on the cpu. They allow you to draw essentially a rectangle of where the chat will be, set the chat font (but the chat size is automatically calculated for you given on how many lines you would like. Color, pixels between lines, chat bar location and amount of characters in one message are customizable. Please read the header comments in all scripts to understand how to best use these scripts.");
