if (os_type == os_windows && os_browser == browser_not_a_browser && global.FSenabled) {
    return FS_ini_section_exists(argument0);}
else {return ini_section_exists(argument0);}
