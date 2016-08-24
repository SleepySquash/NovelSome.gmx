//notcen_add('','key: '+string(keyboard_lastkey)+'; lastchar: '+keyboard_lastchar);
_acond=0; if (string_length(keyboard_string)<=1) {if (argument0==" ") {_acond=1;}
    if (keyboard_lastkey==160||keyboard_lastkey==161||keyboard_lastkey==162
    ||keyboard_lastkey==163||keyboard_lastkey==164||keyboard_lastkey==165) {/*keyboard_string=" ";*/ return 0;}}
if (((ord(argument0) >= 32 && ord(argument0) <= 255) || (ord(argument0) >= 1025 && ord(argument0) <= 1025)
|| (ord(argument0) >= 1040 && ord(argument0) <= 1103) || (ord(argument0) >= 1105 && ord(argument0) <= 1105)) && keyboard_lastkey >= 32
    && argument0!='' && !_acond)
    {/*notcen_add('','returned: '+string(argument0)+'; key: '+string(keyboard_lastkey));*/ return 1;} else {return 0;}
