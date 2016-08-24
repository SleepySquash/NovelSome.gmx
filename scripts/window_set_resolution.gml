var ___oldw, ___oldh, ___wsize, ___hsize, ratio;
___oldw=global.winSW; ___oldh=global.winSH; ___wsize=argument0; ___hsize=argument1;
if (___wsize!=global.winSW||___hsize!=global.winSH) {window_set_fullscreen(0);
    if (display_support_size(___wsize,___hsize)) {global.wSH=___hsize; global.wSW=___wsize; global.gRChanged=1;
        window_set_size(___wsize,___hsize); view_wview=___wsize; view_hview=___hsize;} else {
    if (window_get_width()<___wsize) {ratio=___hsize/___wsize;
        ___wsize=window_get_width()-10; ___hsize=___wsize*ratio;}
    if (window_get_height()<___hsize) {ratio=___wsize/___hsize;
        ___hsize=window_get_height()-10; ___wsize=___hsize*ratio;}
    global.wSH=___hsize; global.wSW=___wsize; global.gRChanged=1;
    window_set_size(___wsize,___hsize); view_wview=___wsize; view_hview=___hsize;}
window_center(); game_center();}
