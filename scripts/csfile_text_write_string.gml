if (os_type == os_windows && os_browser == browser_not_a_browser && global.FSenabled) {
    FS_file_text_write_string(argument0,argument1);}
else {file_text_write_string(argument0,argument1);}
