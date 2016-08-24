if (global.lNovel!="" && global.lNovel_id!=-1) {
    if (init._wWidth!=-1) {global.wSW=init._wWidth;}
    if (init._wHeight!=-1) {global.wSH=init._wHeight;}
    isFS=init.isFS; if (init._wFS!=-1) {isFS=init._wFS;}
    window_set_size(global.winSW,global.winSH);
    window_set_fullscreen(isFS); if (isFS) {
        global.winSW=display_get_width();
        global.winSH=display_get_height();}}
