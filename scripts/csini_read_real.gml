if (os_type == os_windows && os_browser == browser_not_a_browser && global.FSenabled) {
    return FS_ini_read_real(argument0,argument1,argument2);}
else {return ini_read_real(argument0,argument1,argument2);}
