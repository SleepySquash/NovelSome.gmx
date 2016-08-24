if (os_smartphone()) {directory_create(argument0);} else {
    if (os_type != os_windows) {directory_create(argument0);}
    else {if (os_browser != browser_not_a_browser || !global.FSenabled) {directory_create(argument0);}
        else {external_call(global.__nsDirectoryCreate, argument0);}}}
