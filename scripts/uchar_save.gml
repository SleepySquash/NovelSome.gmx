if (os_browser != browser_not_a_browser) {exit;} //if (os_type != os_windows) {exit;}
if (!directory_exists(current_directory()+"Config\")) {
    ns_directory_create(current_directory()+"Config\");}
csini_open(current_directory()+"Config\settings");
    csini_write_string("SETTINGS","localisation",global.localisation);
    csini_write_string("SETTINGS","Skin",global.Skin);
    csini_write_real("SETTINGS","SkinID",global.SkinID);
    csini_write_real("SETTINGS","musicVolume",global.musicVolume);
    csini_write_real("SETTINGS","soundVolume",global.soundVolume);
    csini_write_real("SETTINGS","ambientVolume",global.ambientVolume);
    csini_write_real("SETTINGS","dialSpdNormal",global.dialSpdNormal);
    csini_write_real("SETTINGS","dialSpdPress",global.dialSpdPress);
    csini_write_real("SETTINGS","nSkipRate",Time._srate);
    csini_write_real("SETTINGS","nRefreshRate",Time._nrate);
    csini_write_real("SETTINGS","dClickAction",global.dClickAction);
    noresolsettings=0; if (room!=room_menu) {if (global.wSW!=global.winSW||global.wSH!=global.winSH||global.gRChanged) {noresolsettings=1;}}
    if (!noresolsettings) {csini_write_real("SETTINGS","windowWidth",window_get_width());
        csini_write_real("SETTINGS","windowHeight",window_get_height());
        csini_write_real("SETTINGS","isFullscreen",window_get_fullscreen());}
    csini_write_real("SETTINGS","soundIs",global.soundIs);
    csini_write_real("SETTINGS","musicIs",global.musicIs);
    csini_write_real("SETTINGS","ambientIs",global.ambientIs);
    csini_write_real("SETTINGS","Framerate",global.FrameRate);
    csini_write_real("SETTINGS","limTraffic",global.limTraffic);
    csini_write_real("SETTINGS","checkUpdates",global.checkUpdates);
    csini_write_real("SETTINGS","ignoreNovelSkin",global.ignoreNovelSkin);
    csini_write_real("SETTINGS","aalevel",global.aalevel); if (global.FrameRate>30) {global.vsync=0;}
    csini_write_real("SETTINGS","vsync",global.vsync);
csini_close();
