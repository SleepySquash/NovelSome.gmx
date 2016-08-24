if (os_browser != browser_not_a_browser) {return working_directory;}
if (os_type == os_windows) {if (os_version>=393218 || os_version<393217) {
    return working_directory;} else {return working_directory;}}// else {return FS_current_directory()+"\";}}
else {return working_directory;}
