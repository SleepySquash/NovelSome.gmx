if (os_type == os_windows && os_browser == browser_not_a_browser && global.FSenabled) {
    return FS_ini_key_exists(argument0,argument1);}
else {return ini_key_exists(argument0,argument1);}
