//var chat_string;
if (!typing_is() && typing_are()) {exit;}
if (global.chat_open && keyboard_string != "" && keyboard_string != " ")
{
    chat_string = string_replace_all(keyboard_string,"#","\#");
    if (string_copy(chat_string,1,1)==" ") {chat_string=string_copy(chat_string,2,string_length(chat_string)-1);}
    if (string_count(" ",chat_string) != string_length(chat_string))
    {
        if (chat_string!='') {
            if (string_copy(chat_string,0,1)=='/') {
                chat_add('('+chat_string+')');
                console_check(chat_string);
            } else {if (object_index==objGUI_chat) {
                chat_add('('+chat_string+')');} else {
            if (global.hConnected) {client_send_chat(chat_string);} else {chat_add('('+chat_string+')');}}}}
        keyboard_string = "";
        //global.chat_open = 0;
        //typing_set(0);
    }
}
else
{
    global.chat_open = !global.chat_open;
    if (global.chat_open) {typing_set(id); keyboard_string="";}else{typing_set(0); keyboard_string="";}
}
