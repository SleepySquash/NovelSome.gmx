if (os_browser != browser_not_a_browser) {global.skinCount=1; skin_load_default(); global.SkinCorrupted=0; exit;}
//if (os_type != os_windows) {global.skinCount=1; skin_load_default(); global.SkinCorrupted=0; exit;}
global.SkinCorrupted=0; skcor=1; global.skinCount=1; skin_load_default(); if (global.SkinID==0) {skcor=0;}
hisid=1; othchar=file_find_all_dir(working_directory+"Skins","nskin");
if (othchar) {for (i=0;i<global.file_find_all_count;i+=1) {if (file_exists(global.file_find_all_file[i])) {
    if (skin_load_preview(global.file_find_all_file[i],hisid)) {if (global.SkinID==hisid && global.Skin==skindat.Name[hisid]) {skcor=0;} hisid+=1;}}}}
if (skcor) {_comp=0; for (i=0;i<global.skinCount;i+=1) {if (global.Skin==skindat.Name[i]) {global.SkinID=i; _comp=1;}}
    if (!_comp) {global.SkinCorrupted=1; notcen_add("W",lang.your_skin+" ("+string(global.Skin)+") "+lang.is_corrupted);}}
