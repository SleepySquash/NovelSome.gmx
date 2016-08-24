/*draw_set_alpha(alpha1); if (sprite_exists(global.menuBackground)) {
    moffx=-(view_wview*0.008/2)+(mouse_x-view_xview)*0.008; moffy=-(view_hview*0.008/2)+(mouse_y-view_yview)*0.008;
    mbackx=(view_wview+(view_wview*0.008))/((sprite_get_width(global.menuBackground)));
    mbacky=(view_hview+(view_hview*0.008))/((sprite_get_height(global.menuBackground)));
    if (mbackx>mbacky) {mbacky=mbacky;} else {mbackx=mbacky;}
    draw_sprite_ext(global.menuBackground,-1,view_xview+view_wview/2+moffx,
    view_yview+view_hview/2+moffy,_backoff*mbackx,_backoff*mbacky,0,c_white,alpha1);
    if (alpha3>0) {if (sprite_exists(global.menuBackgroundBlur)) {
        draw_sprite_ext(global.menuBackgroundBlur,-1,view_xview+view_wview/2+moffx,
        view_yview+view_hview/2+moffy,_backoff*mbackx,_backoff*mbacky,0,c_white,alpha3);}}}
if (bcimage!=bimage) {bf=2;}
if (sprite_exists(bimage)) {if (bf==0) {if (!bset) {
    mback2x=(view_wview+(view_wview*0.008))/((sprite_get_width(bcimage)));
    mback2y=(view_hview+(view_hview*0.008))/((sprite_get_height(bcimage)));
    if (mback2x>mback2y) {mback2y=mback2x;} else {mback2x=mback2y;} bset=1;} if (balpha<1) {balpha+=0.12;} else {bf=1;}}}
if (bf==2) {amx=0; if (sprite_exists(bcimage)) {amx=0.5;}
    if (balpha>amx) {balpha-=0.12;} else {if (bcimage!=bimage) {if (sprite_exists(bimage)) {sprite_delete(bimage);} bimage=bcimage;} bset=0; bf=0;}}
if (balpha>0) {if (sprite_exists(bimage)) {
    moffx=-(view_wview*global.backOMove/2)+(mouse_x-view_xview)*global.backOMove; moffy=-(view_hview*global.backOMove/2)+(mouse_y-view_yview)*global.backOMove;
    draw_sprite_ext(bimage,-1,view_xview+view_wview/2+moffx,view_yview+view_hview/2+moffy,mback2x,mback2y,0,c_white,balpha);
    } else {bset=0;}} else {bset=0;}
