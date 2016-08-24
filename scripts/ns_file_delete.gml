if (os_smartphone()) {file_delete(argument0);} else {
    if (os_type != os_windows) {file_delete(argument0);}
    else {if (os_browser != browser_not_a_browser || !global.FSenabled) {file_delete(argument0);}
        else {external_call(global.__nsFileDelete, argument0);}}}
