if (string(argument0)!="") {invalid_comment=": "+string(argument0);}else{invalid_comment="";}
with (global.commandWriting_id) {
    if (object_index==objGUI_chat) {chat_add("Unknown command"+other.invalid_comment);}}
