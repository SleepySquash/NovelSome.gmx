dp=1; //if (os_type == os_windows) {if (os_version < 393217) {dp=0;}}
if (os_browser != browser_not_a_browser || !dp) {global.winSW=browser_width; global.winSH=browser_height;
    window_set_size(browser_width,browser_height); window_center(); global.uniqueNumber=0; global.remUsername=0; global.remPassword=0;
    global.localisation="English"; global.musicVolume=0.5; global.soundVolume=0.5; global.ambientVolume=0.5;
    global.sortType=0; global.Skin="default"; global.SkinID=0; global.dialSpdNormal=2; global.dialSpdPress=4;
    global.soundIs=1; global.musicIs=1; global.ambientIs=1; global.lNovel=""; global.lNovel_id=-1; global.sortType=0; exit;}
/*if (os_type != os_windows) {global.winSW=display_get_width(); global.winSH=display_get_height();
    dp=1; if (os_type == os_windows) {if (os_version <= 327682) {dp=0;}} if (dp) {
    window_set_size(global.winSW,global.winSH);} global.uniqueNumber=0; global.remUsername=0; global.remPassword=0;
    global.localisation="English"; global.musicVolume=0.5; global.soundVolume=0.5; global.ambientVolume=0.5;
    global.sortType=0; global.Skin="default"; global.SkinID=0; global.dialSpdNormal=2; global.dialSpdPress=4;
    global.soundIs=1; global.musicIs=1; global.ambientIs=1; global.lNovel=""; global.lNovel_id=-1; global.sortType=0; exit;}*/

ini_open("settings");
    if (ini_key_exists("SETTINGS","unum")) {
        global.uniqueNumber=base64_decode(ini_read_string("SETTINGS","unum",string(real(string(current_year)+string(current_month)+string(current_day)
            +string(current_hour)+string(current_minute)+string(current_second))*irandom_range(1,1000))+string(current_time*irandom_range(1,1000))));} else {
        global.uniqueNumber=string(real(string(current_year)+string(current_month)+string(current_day)
            +string(current_hour)+string(current_minute)+string(current_second))*irandom_range(1,1000))+string(current_time*irandom_range(1,1000));
        ini_write_string("SETTINGS","unum",base64_encode(global.uniqueNumber));}
    global.remUsername=ini_read_real("ACCOUNT","remUsername",1); global.remPassword=ini_read_real("ACCOUNT","remPassword",0);
    if (ini_key_exists("ACCOUNT","Username") && global.remUsername) {global.username=base64_decode(ini_read_string("ACCOUNT","Username","username"));}
        else if (!ini_key_exists("ACCOUNT","Username") && global.remUsername) {ini_write_string("ACCOUNT","Username",base64_encode(global.username));}
    if (ini_key_exists("ACCOUNT","Password") && global.remPassword) {global.password=base64_decode(ini_read_string("ACCOUNT","Password","password"));}
        else if (!ini_key_exists("ACCOUNT","Password") && global.remPassword) {ini_write_string("ACCOUNT","Password",base64_encode(global.password));}
    if (!global.remUsername) {ini_write_string("ACCOUNT","Username",".");} if (!global.remPassword) {ini_write_string("ACCOUNT","Password",".");}
ini_close();

if (!__nonsdll) {if (!directory_exists(current_directory()+"Config\")) {ns_directory_create(current_directory()+"Config\");}}
_flexists=file_exists(current_directory()+"Config\settings");
csini_open(current_directory()+"Config\settings");
    global.localisation=csini_read_string("SETTINGS","localisation","Русский");
    global.musicVolume=csini_read_real("SETTINGS","musicVolume",0.5);
    global.soundVolume=csini_read_real("SETTINGS","soundVolume",0.5);
    global.ambientVolume=csini_read_real("SETTINGS","ambientVolume",0.5);
    global.sortType=csini_read_real("SETTINGS","sortType",0);
    global.Skin=csini_read_string("SETTINGS","Skin","default");
    global.SkinID=csini_read_real("SETTINGS","SkinID",0);
    global.dialSpdNormal=csini_read_real("SETTINGS","dialSpdNormal",2);
    global.dialSpdPress=csini_read_real("SETTINGS","dialSpdPress",4);
    global.dClickAction=csini_read_real("SETTINGS","dClickAction",0);
    global.nSkipRate=csini_read_real("SETTINGS","nSkipRate",global.nSkipRate);
    global.nRefreshRate=csini_read_real("SETTINGS","nRefreshRate",global.nRefreshRate);
    global.soundIs=csini_read_real("SETTINGS","soundIs",1);
    global.musicIs=csini_read_real("SETTINGS","musicIs",1);
    global.ambientIs=csini_read_real("SETTINGS","ambientIs",1);
    if (os_smartphone()) {global.FrameRate=csini_read_real("SETTINGS","Framerate",30);}
    else {global.FrameRate=csini_read_real("SETTINGS","Framerate",60);}
    global.lNovel=csini_read_string("SETTINGS","lNovel","");
    global.lNovel_id=csini_read_real("SETTINGS","lNovel_id",-1);
    _wWidth=csini_read_real("SETTINGS","lNovel_w",-1);
    _wHeight=csini_read_real("SETTINGS","lNovel_h",-1);
    _wFS=csini_read_real("SETTINGS","lNovel_fs",0);
    global.sortType=csini_read_real("SETTINGS","sort",0);
    global.checkUpdates=csini_read_real("SETTINGS","checkUpdates",1);
    global.limTraffic=csini_read_real("SETTINGS","limTraffic",0);
    global.ignoreNovelSkin=csini_read_real("SETTINGS","ignoreNovelSkin",0);
    global.aalevel=csini_read_real("SETTINGS","aalevel",0);
    global.vsync=csini_read_real("SETTINGS","vsync",0); if (global.FrameRate>30) {global.vsync=0;}
    dp=1; if (os_type == os_windows) {if (os_version <= 327682) {dp=0;}} if (dp) {
    switch (display_aa) {case 2: if (global.aalevel==2) {display_reset(global.aalevel,global.vsync);} else {global.aalevel=0; if (global.vsync) {display_reset(0,1);}} break;
        case 6: if (global.aalevel==2 || global.aalevel==4) {display_reset(global.aalevel,global.vsync);} else {global.aalevel=0; if (global.vsync) {display_reset(0,1);}} break;
        case 12: if (global.aalevel==4 || global.aalevel==8) {display_reset(global.aalevel,global.vsync);} else {global.aalevel=0; if (global.vsync) {display_reset(0,1);}} break;
        case 14: if (global.aalevel==2 || global.aalevel==4 || global.aalevel==8) {display_reset(global.aalevel,global.vsync);} else {global.aalevel=0; if (global.vsync) {display_reset(0,1);}} break;
        default: global.aalevel=0; if (global.vsync) {display_reset(0,1);} break;}}
    global.winSW=csini_read_real("SETTINGS","windowWidth",1160); global.wSW=global.winSW;
    global.winSH=csini_read_real("SETTINGS","windowHeight",652); global.wSH=global.winSH;
    dp=1; if (dp) {
        window_set_size(global.winSW,global.winSH); isFS=csini_read_real("SETTINGS","isFullscreen",0);
        window_set_fullscreen(isFS); if (isFS) {global.winSW=display_get_width(); global.winSH=display_get_height();}}
csini_close();
