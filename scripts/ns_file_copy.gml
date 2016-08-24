if (os_smartphone()) {file_copy(argument0,argument1);} else {
    if (os_type != os_windows) {file_copy(argument0,argument1);}
    else {if (os_browser != browser_not_a_browser || !global.FSenabled) {file_copy(argument0,argument1);}
        else {external_call(global.__nsFileCopy, argument0, argument1);}}}
