_lcsk=global.SkinID; if (global.SkinCorrupted) {global.SkinID=0;}
if (global.SkinID!=0) {skin_load(skindat.FName[global.SkinID],global.SkinID);}
    else {if (global.menuMusic!=global.menuSMusic) {
        global.menuMusic=global.menuSMusic; cp=0; if (!global.frSkScan && !global.isTesting && !instance_exists(objScr_gameInit)) {cp=(room==room_menu);}
        //if (!global.frSkScan && !global.isTesting && !instance_exists(objScr_gameInit)) {cp=1; if (global.menuInited) {if (room==room_nmenu) {cp=0;}}
            if (cp) {music_play_path(global.menuMusic);}
        global.mFadeOut=300; global.mFadeIn=300;}
    if (global.mBack_path!=global.mSBack_path) {global.mBack_path=global.mSBack_path; if (sprite_exists(global.menuBackground)) {sprite_delete(global.menuBackground);}
        global.menuBackground=sprite_add(working_directory+global.mBack_path,1,0,0,0,0);}
    sprite_set_offset(global.menuBackground,sprite_get_width(global.menuBackground)/2,sprite_get_height(global.menuBackground)/2);
    if (global.mBackBlur_path!=global.mSBackBlur_path) {global.mBackBlur_path=global.mSBackBlur_path; if (sprite_exists(global.menuBackgroundBlur)) {sprite_delete(global.menuBackgroundBlur);}
        global.menuBackgroundBlur=sprite_add(working_directory+global.mBackBlur_path,1,0,0,0,0);}
    sprite_set_offset(global.menuBackgroundBlur,sprite_get_width(global.menuBackgroundBlur)/2,sprite_get_height(global.menuBackgroundBlur)/2);
    skin_reset();}
if (global.SkinCorrupted) {global.SkinID=_lcsk;}
