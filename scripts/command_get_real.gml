if (string_length(argument0)<string_length("/"+last_command)+2) {command_unknown("Index out of bounds"); return 0; exit;}
return real(string_digits(string_copy(argument0,string_length("/"+last_command)+2,string_length(argument0)-string_length("/"+last_command)+2)));
