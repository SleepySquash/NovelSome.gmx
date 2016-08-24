if (string_length(argument0)<string_length("/"+last_command)+2) {command_unknown("Index out of bounds"); return ''; exit;}
return string(string_copy(argument0,string_length("/"+last_command)+2,string_length(argument0)-string_length("/"+last_command)+2))
