if (!global.skinChanged) {if (global.SkinCorrupted) {exit;} if (global.SkinID==0) {exit;}}
ds_map_clear(skindat.events);
skindat.drawDialogueFrom="";
skindat.drawGamePauseFrom=""; with (objGUI_ingame) {drelement_clear(); lastCustomMenu=""; customMenu=0;}
skindat.drawLoadingFrom="";
skindat.drawSaveFrom="";
skindat.drawLoadFrom="";
skindat.drawOptionsFrom="";
if (global.dialBox!=sprDial_box) {if (sprite_exists(global.dialBox)) {sprite_delete(global.dialBox);}}
if (global.dialNamebox!=sprDial_namebox) {if (sprite_exists(global.dialNamebox)) {sprite_delete(global.dialNamebox);}}
if (global.dialFullbox!=sprDial_fullbox) {if (sprite_exists(global.dialFullbox)) {sprite_delete(global.dialFullbox);}}
if (global.mBack_path!=global.mSBack_path) {if (sprite_exists(global.menuBackground)) {sprite_delete(global.menuBackground);}}
if (global.mBackBlur_path!=global.mSBackBlur_path) {if (sprite_exists(global.menuBackgroundBlur)) {sprite_delete(global.menuBackgroundBlur);}}
