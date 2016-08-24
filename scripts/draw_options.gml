if (mtpskin || mtpres) {button_set_clickble(0);} else {if (mouse_wheel_up()) {stab-=1; optdone=0; if (round(stab)<0) {stab=0;}} if (mouse_wheel_down()) {stab+=1; optdone=0; if (round(stab)>3) {stab=3;}}}
xxw=centeredxx; draw_text_set(Pacifica21,c_white,fa_center,fa_top); draw_options_tab("Кастомизация",0);
draw_options_tab("Графика",1); draw_options_tab("Громкость",2); draw_options_tab("Сеть",3); centeredxx=view_wview/2-(xxw-centeredxx)/2;
optcount=1; optrep=1; if (!optdone) {optcount=2; optdone=1;} repeat(optcount) {if (optrep==optcount) {draw_set_alpha(alpha3);} else {draw_set_alpha(0);}
    yyh=centeredyy; if (round(stab)==0) {draw_text_set(Pacifica28,c_white,fa_center,fa_top);
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.skin+" >",global.mButtonClr,global.mButtonOutClr,c_black,0)) {selSkin=global.SkinID; mtpskin=1;} yyh+=string_height("A")+2;
    draw_text_outline_ext(view_xview+view_wview/2-string_width(global.Skin)/2,view_yview+yyh,lang.current+": ",global.mButtonClr,global.mButtonOutClr); clr=global.mButtonClr; if (global.SkinCorrupted) {clr=c_red;}
    draw_text_outline_ext(view_xview+view_wview/2+string_width(lang.current+": ")/2,view_yview+yyh,global.Skin,clr,global.mButtonOutClr); yyh+=string_height("A")+2;
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.ignore_novel_skin+": "+string(global.ignoreNovelSkin),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.ignoreNovelSkin=!global.ignoreNovelSkin;} yyh+=string_height("A")*2+4;
    draw_text_set(Pacifica28,c_white,fa_center,fa_top); if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.text_appearance_speed+": "+string(global.dialSpdNormal),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
        window_set_fullscreen(0); gts=get_string(lang.text_appearance_speed+": ",global.dialSpdNormal); if (string_digits(gts)!="") {
            if (real(gts)<1) {gts=1;} global.dialSpdNormal=real(gts); global.dialSpdPress=real(gts)*2;}} yyh+=string_height("A")+2;
    draw_text_set(Pacifica19,c_white,fa_center,fa_top); draw_text_outline_ext(view_xview+view_wview/2,view_yview+yyh-string_height("A")/2-4,"("+lang.letter_in_a_step+")",global.mButtonClr,global.mButtonOutClr); yyh+=string_height("A")+2;
    draw_text_set(Pacifica28,c_white,fa_center,fa_top); if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.skip_speed+": "+string(Time._srate),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
        window_set_fullscreen(0); gts=get_string(lang.skip_speed+": ",Time._srate); if (string_digits(gts)!="") {Time._srate=clamp(real(gts),1,480);}} yyh+=string_height("A")+4;
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.do_when_double_clicked+": "+stringGetClStatus(global.dClickAction),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
        global.dClickAction=!global.dClickAction;} yyh+=string_height("A")+2;}
else if (round(stab)==1) {draw_text_set(Pacifica28,c_white,fa_center,fa_top);
    noresolsettings=0; if (room!=room_menu) {if (global.wSW!=global.winSW || global.wSH!=global.winSH || global.gRChanged) {noresolsettings=1;}}
    if (os_browser!=browser_not_a_browser || os_type!=os_windows) {noresolsettings=1;} clr=global.mButtonClr; if (noresolsettings) {clr=c_gray; button_set_clickble(0);}
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.resolution+" >",clr,global.mButtonOutClr,c_black,0)) {swsize=global.winSW; shsize=global.winSH; isFS=window_get_fullscreen(); mtpres=1;} if (noresolsettings) {button_set_clickble(1);} yyh+=string_height("A")+2;
    txt=lang.current+": "+string(global.winSW)+"x"+string(global.winSH); if (noresolsettings) {txt=lang.current+": "+string(global.wSW)+"x"+string(global.wSH);}
    draw_text_outline_ext(view_xview+view_wview/2,view_yview+yyh,txt,global.mButtonClr,global.mButtonOutClr); yyh+=string_height("A")+2;
    
    draw_text_outline_ext(view_xview+view_wview/2-string_width(lang.framerate+": ")/2,view_yview+yyh,lang.framerate+": ",global.mButtonClr,global.mButtonOutClr); exxw=view_wview/2;
    clr=global.mButtonClr; if (global.FrameRate==30) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("30")/2,view_yview+yyh,"30",clr,global.mButtonOutClr,c_black,0)) {global.FrameRate=30; room_speed=global.FrameRate;} exxw+=string_width("30 ");
    clr=global.mButtonClr; if (global.FrameRate==60) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("60")/2,view_yview+yyh,"60",clr,global.mButtonOutClr,c_black,0)) {global.FrameRate=60; room_speed=global.FrameRate; global.vsync=0;} exxw+=string_width("60 ");
    clr=global.mButtonClr; if (global.FrameRate==120) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("120")/2,view_yview+yyh,"120",clr,global.mButtonOutClr,c_black,0)) {global.FrameRate=120; room_speed=global.FrameRate; global.vsync=0;} exxw+=string_width("120 ");
    clr=global.mButtonClr; if (global.FrameRate==240) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("240")/2,view_yview+yyh,"240",clr,global.mButtonOutClr,c_black,0)) {global.FrameRate=240; room_speed=global.FrameRate; global.vsync=0;} exxw+=string_width("240 ");
    //clr=global.mButtonClr; if (global.FrameRate==999) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("999")/2,view_yview+yyh,"999",clr,global.mButtonOutClr,c_black,0)) {global.FrameRate=999; room_speed=global.FrameRate; global.vsync=0;} exxw+=string_width("999 ");
    yyh+=string_height("A")/2; draw_text_set(Pacifica16,c_white,fa_center,fa_top); draw_text_outline_ext(view_xview+view_wview/2,view_yview+yyh,lang.framerateDescription,global.mButtonClr,global.mButtonOutClr);
    draw_text_set(Pacifica28,c_white,fa_center,fa_top); yyh+=string_height("A")*2+4; clr=global.mButtonClr; if (global.FrameRate>30) {clr=c_gray; button_set_clickble(0);}
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,"Вертикальная синхронизация: "+stringGetSwitch(global.vsync),clr,global.mButtonOutClr,c_black,0)) {global.vsync=!global.vsync; display_reset(global.aalevel,global.vsync);} yyh+=string_height("A")+2; if (global.FrameRate>30) {button_set_clickble(1);}
    button_set_clickble(!mtpres); if (display_aa!=0) {draw_text_outline_ext(view_xview+view_wview/2-string_width("Сглаживание: ")/2,view_yview+yyh,"Сглаживание: ",global.mButtonClr,global.mButtonOutClr); exxw=view_wview/2;
    clr=global.mButtonClr; if (global.aalevel==0) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("OFF")/2,view_yview+yyh,"OFF",clr,global.mButtonOutClr,c_black,0)) {global.aalevel=0; display_reset(global.aalevel,global.vsync);} exxw+=string_width("OFF ");
    if (aa_dr2x) {clr=global.mButtonClr; if (global.aalevel==2) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("2x")/2,view_yview+yyh,"2x",clr,global.mButtonOutClr,c_black,0)) {global.aalevel=2; display_reset(global.aalevel,global.vsync);} exxw+=string_width("2x ");}
    if (aa_dr4x) {clr=global.mButtonClr; if (global.aalevel==4) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("4x")/2,view_yview+yyh,"4x",clr,global.mButtonOutClr,c_black,0)) {global.aalevel=4; display_reset(global.aalevel,global.vsync);} exxw+=string_width("4x ");}
    if (aa_dr8x) {clr=global.mButtonClr; if (global.aalevel==8) {clr=c_lime;} if (button_outback(view_xview+exxw+string_width("8x")/2,view_yview+yyh,"8x",clr,global.mButtonOutClr,c_black,0)) {global.aalevel=8; display_reset(global.aalevel,global.vsync);} exxw+=string_width("8x ");} yyh+=string_height("A")+2;}}
else if (round(stab)==2) {draw_text_set(Pacifica28,c_white,fa_center,fa_top);
    if (button_outback(view_xview+view_wview/2-string_width(lang.sambient+": OFF")/2-string_width(lang.smusic+": OFF")/2-8,view_yview+yyh,lang.smusic+": "+stringGetSwitch(global.musicIs),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.musicIs=!global.musicIs;
    if (!global.musicIs) {if (music_get_playing()!="") {music_play("");}} else {if (room==room_nmenu) {if (objNMenu.tpMusic!="") {if (music_get_playing()!=objNMenu.tpFolName+"\"+objNMenu.tpMusic) {music_play_path(objNMenu.tpFolName+"\"+objNMenu.tpMusic);
            objMusic.ch=3; if (!global.musicIs) {objMusic.ch=6;} music_set_seek(objNMenu.tpMPreview);}} else {music_play_path(global.menuMusic); music_set_seek(global.musicMStart);}} else {music_play_path(global.menuMusic); music_set_seek(global.musicMStart);}}}
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.sambient+": "+stringGetSwitch(global.ambientIs),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.ambientIs=!global.ambientIs;}
    if (button_outback(view_xview+view_wview/2+string_width(lang.sambient+": OFF")/2+string_width(lang.ssound+": OFF")/2+8,view_yview+yyh,lang.ssound+": "+stringGetSwitch(global.soundIs),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.soundIs=!global.soundIs;}
    yyh+=string_height("A")+4; if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.music_volume+": "+string(global.musicVolume*100),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
        window_set_fullscreen(0); gts=get_string(lang.music_volume+" (0-100): ",global.musicVolume*100); if (string_digits(gts)!="") {
            if (real(gts)<0) {gts=0;} if (real(gts)>100) {gts=100;} global.musicVolume=real(gts)/100;}} yyh+=string_height("A")+4;
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.ambient_volume+": "+string(global.ambientVolume*100),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
        window_set_fullscreen(0); gts=get_string(lang.ambient_volume+" (0-100): ",global.ambientVolume*100); if (string_digits(gts)!="") {
            if (real(gts)<0) {gts=0;} if (real(gts)>100) {gts=100;} global.ambientVolume=real(gts)/100;}} yyh+=string_height("A")+4;
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.soundvolume+": "+string(global.soundVolume*100),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
        window_set_fullscreen(0); gts=get_string(lang.soundvolume+" (0-100): ",global.soundVolume*100); if (string_digits(gts)!="") {
            if (real(gts)<0) {gts=0;} if (real(gts)>100) {gts=100;} global.soundVolume=real(gts)/100;}} yyh+=string_height("A")+4;}
else if (round(stab)==3) {draw_text_set(Pacifica28,c_white,fa_center,fa_top);
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.check_updates_at_start+": "+stringGetSwitch(global.checkUpdates),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.checkUpdates=!global.checkUpdates;} yyh+=string_height("A")+4;
    if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.limited_traffic+": "+stringGetSwitch(global.limTraffic),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.limTraffic=!global.limTraffic;} yyh+=string_height("A")+4;}
else if (round(stab)==-1) {draw_text_set(Pacifica28,c_white,fa_center,fa_top);
if (button_outback(view_xview+view_wview/2-string_width(lang.sambient+": OFF")/2-string_width(lang.smusic+": OFF")/2-8,view_yview+yyh,lang.smusic+": "+stringGetSwitch(global.musicIs),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.musicIs=!global.musicIs;
    if (!global.musicIs) {if (music_get_playing()!="") {music_play("");}} else {
        if (tpMusic!="") {if (music_get_playing()!=tpFolName+"\"+tpMusic) {music_play_path(tpFolName+"\"+tpMusic);
        objMusic.ch=3; if (!global.musicIs) {objMusic.ch=6;} music_set_seek(tpMPreview);}} else {
            music_play_path(global.menuMusic); music_set_seek(global.musicMStart);}}}
if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.sambient+": "+stringGetSwitch(global.ambientIs),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.ambientIs=!global.ambientIs;}
if (button_outback(view_xview+view_wview/2+string_width(lang.sambient+": OFF")/2+string_width(lang.ssound+": OFF")/2+8,view_yview+yyh,lang.ssound+": "+stringGetSwitch(global.soundIs),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.soundIs=!global.soundIs;}
yyh+=string_height("A")+4; if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.music_volume+": "+string(global.musicVolume*100),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
    window_set_fullscreen(0); gts=get_string(lang.music_volume+" (0-100): ",global.musicVolume*100); if (string_digits(gts)!="") {
        if (real(gts)<0) {gts=0;} if (real(gts)>100) {gts=100;} global.musicVolume=real(gts)/100;}} yyh+=string_height("A")+4;
if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.ambient_volume+": "+string(global.ambientVolume*100),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
    window_set_fullscreen(0); gts=get_string(lang.ambient_volume+" (0-100): ",global.ambientVolume*100); if (string_digits(gts)!="") {
        if (real(gts)<0) {gts=0;} if (real(gts)>100) {gts=100;} global.ambientVolume=real(gts)/100;}} yyh+=string_height("A")+4;
if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.soundvolume+": "+string(global.soundVolume*100),global.mButtonClr,global.mButtonOutClr,c_black,0)) {
    window_set_fullscreen(0); gts=get_string(lang.soundvolume+" (0-100): ",global.soundVolume*100); if (string_digits(gts)!="") {
        if (real(gts)<0) {gts=0;} if (real(gts)>100) {gts=100;} global.soundVolume=real(gts)/100;}} yyh+=string_height("A")*2+8;
if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.skin+" >",global.mButtonClr,global.mButtonOutClr,c_black,0)) {selSkin=global.SkinID; mtpskin=1;} yyh+=string_height("A")+2;
draw_text_outline_ext(view_xview+view_wview/2-string_width(global.Skin)/2,view_yview+yyh,lang.current+": ",global.mButtonClr,global.mButtonOutClr); clr=global.mButtonClr; if (global.SkinCorrupted) {clr=c_red;}
draw_text_outline_ext(view_xview+view_wview/2+string_width(lang.current+": ")/2,view_yview+yyh,global.Skin,clr,global.mButtonOutClr); yyh+=string_height("A")+2;
if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.ignore_novel_skin+": "+stringGetSwitch(global.ignoreNovelSkin),global.mButtonClr,global.mButtonOutClr,c_black,0)) {global.ignoreNovelSkin=!global.ignoreNovelSkin;} yyh+=string_height("A")*2+8;
noresolsettings=0; if (room!=room_menu) {if (global.wSW!=global.winSW or global.wSH!=global.winSH or global.gRChanged) {noresolsettings=1;}}
if (os_browser!=browser_not_a_browser || os_type!=os_windows) {noresolsettings=1;} clr=global.mButtonClr; if (noresolsettings) {clr=c_gray; button_set_clickble(0);}
if (button_outback(view_xview+view_wview/2,view_yview+yyh,lang.resolution+" >",clr,global.mButtonOutClr,c_black,0)) {swsize=global.winSW; shsize=global.winSH; isFS=window_get_fullscreen(); mtpres=1;} if (noresolsettings) {button_set_clickble(1);} yyh+=string_height("A")+2;
txt=lang.current+": "+string(global.winSW)+"x"+string(global.winSH); if (noresolsettings) {txt=lang.current+": "+string(global.wSW)+"x"+string(global.wSH);}
draw_text_outline_ext(view_xview+view_wview/2,view_yview+yyh,txt,global.mButtonClr,global.mButtonOutClr); yyh+=string_height("A")+2;}
centeredyy=view_hview/2-(yyh-centeredyy)/2; optrep+=1;} draw_text_set(Pacifica28,c_white,fa_center,fa_middle);
if (button_outback(view_xview+view_wview/2,view_yview+view_hview-string_height("A")/2-5,"< "+lang.back,global.mButtonClr,global.mButtonOutClr,c_black,0)) {uchar_save(); if (room==room_menu) {menutype=0;} else if (room==room_nmenu) {trTo=0;}}
if (mtpres) {if (room==room_menu) {if (sprite_exists(global.menuBackgroundBlur)) {
    draw_sprite_ext(global.menuBackgroundBlur,-1,view_xview+view_wview/2+rback.moffx,
    view_yview+view_hview/2+rback.moffy,_backoff*rback.mbackx,_backoff*rback.mbacky,0,c_white,alpha3/1.3);}} else {
        draw_set_alpha(alpha3/2.4); draw_rectangle_colour(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,c_black,c_black,c_black,c_black,0); draw_set_alpha(alpha3);}
if (room==room_menu) {if (menutype==3) {button_set_clickble(1);} else {button_set_clickble(0);}} else {button_set_clickble(1);}

repcount=1; if (!resdone) {repcount=2;} repcur=1; repeat (repcount) {if (repcur==repcount) {draw_set_alpha(alpha3);} else {draw_set_alpha(0);}
yyh=rescenteredyy; draw_text_set(Pacifica16,c_white,fa_left,fa_top); draw_text_outline(view_xview+view_wview/2-100,view_yview+yyh,"Standart"); yyh+=string_height("A")+4;
wsize=800; hsize=600; draw_text_set(Pacifica28,c_white,fa_center,fa_top); if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
wsize=1024; hsize=768; if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
wsize=1160; hsize=870; if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
wsize=1280; hsize=1024; if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
draw_text_set(Pacifica16,c_white,fa_left,fa_top); draw_text_outline(view_xview+view_wview/2-100,view_yview+yyh,"Widescreen"); yyh+=string_height("A")+4;
wsize=1160; hsize=652; draw_text_set(Pacifica28,c_white,fa_center,fa_top); if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
wsize=1280; hsize=720; if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
wsize=1280; hsize=800; if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;}
wsize=1920; hsize=1080; if (display_support_size(wsize,hsize)) {
    astr=""; clr=global.mButtonClr; oclr=global.mButtonOutClr; if (swsize==wsize && shsize==hsize) {clr=c_lime;} if (global.winSW==wsize && global.winSH==hsize) {astr=" ("+lang.current+")";}
if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,string(wsize)+"x"+string(hsize)+astr,clr,oclr,c_black,0)) {
    swsize=wsize; shsize=hsize;} yyh+=string_height("A")+4;} yyh+=8;
clr=global.mButtonClr; oclr=global.mButtonOutClr; if (button_outback(view_xview+view_wview/2,view_yview+yyh+string_height("A")/2,lang.is_fullscreen+": "+string(isFS),clr,oclr,c_black,0)) {isFS=!isFS;}
rescenteredyy=view_hview/2-(yyh-rescenteredyy)/2; repcur+=1;}

draw_text_set(Pacifica28,c_white,fa_center,fa_middle);
if (button_outback(view_xview+view_wview/2,view_yview+view_hview-string_height("A")-string_height("A")/2-10,lang.apply,c_white,c_gray,c_black,0)) {
    if ((swsize!=global.winSW || shsize!=global.winSH)||window_get_fullscreen()!=isFS||window_get_width()!=global.winSW||window_get_height()!=global.winSH) {
        global.winSW=swsize; global.winSH=shsize; window_set_size(global.winSW,global.winSH); window_set_fullscreen(isFS);
        if (isFS) {global.winSW=display_get_width(); global.winSH=display_get_height();} global.wSW=global.winSW; global.wSH=global.winSH; game_center();
        if (room==room_nmenu) {lastWidth=global.winSW; lastHeight=global.winSH; lastFS=isFS; reload_nsmenu();} uchar_save();}}
if (button_outback(view_xview+view_wview/2,view_yview+view_hview-string_height("A")/2-5,"< "+lang.back,c_white,c_gray,c_black,0)) {mtpres=0;}}
if (mtpskin) {if (room==room_menu) {if (sprite_exists(global.menuBackgroundBlur)) {
    draw_sprite_ext(global.menuBackgroundBlur,-1,view_xview+view_wview/2+rback.moffx,
    view_yview+view_hview/2+rback.moffy,_backoff*rback.mbackx,_backoff*rback.mbacky,0,c_white,alpha3/1.3);}} else {
        draw_set_alpha(alpha3/2.4); draw_rectangle_colour(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,c_black,c_black,c_black,c_black,0); draw_set_alpha(alpha3);}
if (room==room_menu) {if (menutype==3) {button_set_clickble(1);} else {button_set_clickble(0);}} else {button_set_clickble(1);}

_myy=(global.skinCount*(string_height('A')+5)); if (_myy>400) {yyfixed=-200;} else {yyfixed=-_myy/2;}
if (keyboard_check_pressed(vk_f5)) {notcen_add('N',lang.skin_list_was_updated); skin_scan();}
if (mouse_wheel_down()) {global.yyskzoom-=45; draw_set_font(Pacifica28); if (global.yyskzoom<-((string_height('A')+5)*global.skinCount+yyfixed)) {
    global.yyskzoom=-((string_height('A')+5)*global.skinCount+yyfixed);}} if (mouse_wheel_up()) {global.yyskzoom+=45; if (global.yyskzoom>-yyfixed) {global.yyskzoom=-yyfixed;}}
yy=0; for (i=0;i<global.skinCount;i+=1) {draw_text_set(Pacifica28,c_white,fa_center,fa_top); if (selSkin==i) {_c1=c_lime; _c2=c_gray;} else {_c1=c_white; _c2=c_gray;}
    _adstr=""; if (global.SkinID==i && skindat.Name[i]==global.Skin) {_adstr=" ("+lang.selected+")";}
    if (button_outback(view_xview+view_wview/2,view_yview+view_hview/2+yy+yyfixed+global.yyskzoom,skindat.Name[i]+_adstr,_c1,_c2,c_black,1)) {selSkin=i;}
    yy+=string_height("A")+5;}

draw_set_alpha(alpha3/1.6); draw_rectangle_colour(view_xview+view_wview-2,view_yview+68,view_xview+view_wview-18,view_yview+view_hview-80,
    c_black,c_black,c_black,c_black,0); draw_set_alpha(alpha3); ypreoff=(view_hview-68-80-55)+(view_hview-68-80-55)*((global.yyskzoom+yyfixed)/((string_height('A')+5)*global.skinCount));
ysoff=view_hview-(view_hview-68-80-55)/2+21-ypreoff; draw_rectangle_colour(view_xview+view_wview-2,view_yview+68+ysoff,view_xview+view_wview-18,view_yview+68+ysoff+55,c_white,c_white,c_white,c_white,0);

if (mouse_check_button_pressed(mb_right)) {_lmx=mouse_x; _lmy=mouse_y;} if (mouse_check_button_released(mb_right)) {
    if ((mouse_x==_lmx||mouse_y==_lmy)&&moHld<=6) {mtpskin=0; button_set_clickble(1);}}
if (mouse_check_button(mb_right)) {if (moHld<7) {moHld+=1*Time.deltatime;} if (!window_has_focus()) {mouse_clear(mb_right);}
    if (mouse_x!=_lmx||mouse_y!=_lmy||moHld>6) {global.yyskzoom=(view_hview-(view_hview-68-80-55))-(mouse_y/view_hview)*((string_height('A')+5)*global.skinCount);
    if (global.yyskzoom<-((string_height('A')+5)*global.skinCount+yyfixed)) {global.yyskzoom=-((string_height('A')+5)*global.skinCount+yyfixed);}
    if (global.yyskzoom>-yyfixed) {global.yyskzoom=-yyfixed;}}} else {moHld=0;}

draw_text_set(Pacifica39,c_white,fa_center,fa_middle); draw_set_alpha(alpha3/1.5);
draw_rectangle_colour(view_xview,view_yview,view_xview+view_wview,view_yview+string_height('A')+4,c_black,c_black,c_black,c_black,0); draw_set_alpha(alpha3);
draw_text_outline(view_xview+view_wview/2,view_yview+string_height("A")/2+5,lang.skin_selection); sw=string_width(lang.skin_selection)/2+10; strh=string_height('A');
draw_text_set(Pacifica16,c_white,fa_left,fa_bottom); draw_text_outline(view_xview+view_wview/2+sw,view_yview+strh+2,lang.available+" "+string(global.skinCount)+" "+lang.skins);
draw_text_set(Pacifica28,c_white,fa_center,fa_middle); draw_set_alpha(alpha3/1.5);
draw_rectangle_colour(view_xview,view_yview+view_hview,view_xview+view_wview,view_yview+view_hview-string_height('A')*2-8-28,c_black,c_black,c_black,c_black,0);
draw_set_alpha(alpha3); stra=string_height('A'); draw_text_set(Pacifica16,c_white,fa_center,fa_bottom);
draw_text_outline(view_xview+view_wview/2,view_yview+view_hview-stra*2-14,lang.press+" 'F5' "+lang.to_update_the_list); draw_text_set(Pacifica28,c_white,fa_center,fa_middle);
if (button_outback(view_xview+view_wview/2,view_yview+view_hview-string_height("A")/2-string_height("A")-10,lang.select_this_one,c_lime,c_gray,c_black,0)) {if (global.SkinID!=selSkin) {
    skin_deapply(); global.Skin=skindat.Name[selSkin]; global.SkinID=selSkin; global.SkinCorrupted=0; skin_apply(); uchar_save();}}
if (button_outback(view_xview+view_wview/2,view_yview+view_hview-string_height("A")/2-5,"< "+lang.back,c_white,c_gray,c_black,0)) {mtpskin=0;}}
