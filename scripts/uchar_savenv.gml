if (os_browser != browser_not_a_browser) {exit;} //if (os_type != os_windows) {exit;}
if (!directory_exists(current_directory()+"Config\")) {
    ns_directory_create(current_directory()+"Config\");}
csini_open(current_directory()+"Config\settings");
    csini_write_real("SETTINGS","lNovel_id",argument0);
    csini_write_string("SETTINGS","lNovel",argument1);
    if (argument2) {csini_write_real("SETTINGS","lNovel_w",global.wSW);
    csini_write_real("SETTINGS","lNovel_h",global.wSH);
    csini_write_real("SETTINGS","lNovel_fs",window_get_fullscreen());}
    else {csini_write_real("SETTINGS","lNovel_w",-1);
    csini_write_real("SETTINGS","lNovel_h",-1);
    csini_write_real("SETTINGS","lNovel_fs",-1);}
csini_close();
