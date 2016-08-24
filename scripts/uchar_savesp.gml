if (os_browser != browser_not_a_browser) {exit;} //if (os_type != os_windows) {exit;}
if (!directory_exists(current_directory()+"Config\")) {
    ns_directory_create(current_directory()+"Config\");}
csini_open(current_directory()+"Config\settings");
    csini_write_real("SETTINGS","sort",global.sortType);
csini_close();
