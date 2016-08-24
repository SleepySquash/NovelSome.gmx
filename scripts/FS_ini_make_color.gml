//ini_make_color(SECTION,KEY)
return make_colour_rgb(FS_ini_read_real(string(argument0),string(argument1)+'r',colour_get_red(argument2)),FS_ini_read_real(string(argument0),string(argument1)+'g',colour_get_green(argument2)),FS_ini_read_real(string(argument0),string(argument1)+'b',colour_get_blue(argument2)))
