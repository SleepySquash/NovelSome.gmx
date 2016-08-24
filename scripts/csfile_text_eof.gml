if (os_type == os_windows && os_browser == browser_not_a_browser && global.FSenabled) {
    return FS_file_text_eof(argument0);}
else {return file_text_eof(argument0);}
