if (ini_key_exists(argument0,argument1)) {
    return ini_read_string(argument0,argument1,argument2)} else {
    ini_write_string(argument0,argument1,argument2);
    return argument2;}
