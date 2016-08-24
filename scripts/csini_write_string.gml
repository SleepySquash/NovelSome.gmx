if (os_type == os_windows && os_browser == browser_not_a_browser && global.FSenabled) {
    FS_ini_write_string(argument0,argument1,argument2);}
else {ini_write_string(argument0,argument1,argument2);}
