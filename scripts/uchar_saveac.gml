if (os_browser != browser_not_a_browser) {exit;} //if (os_type != os_windows) {exit;}
ini_open("settings");
    ini_write_real("ACCOUNT","remUsername",global.remUsername);
    ini_write_real("ACCOUNT","remPassword",global.remPassword);
    if (global.remUsername) {ini_write_string("ACCOUNT","Username",base64_encode(global.username));}
        else {ini_write_string("ACCOUNT","Username",".");}
    if (global.remPassword) {ini_write_string("ACCOUNT","Password",base64_encode(global.password));}
        else {ini_write_string("ACCOUNT","Password",".");}
ini_close();
