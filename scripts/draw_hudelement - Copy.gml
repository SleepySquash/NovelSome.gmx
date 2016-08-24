draw_set_alpha(alpha); switch (element[argument0,argument1]) {
    case "title": draw_text_set(elfont[argument0,argument1],c_white,elhalign[argument0,argument1],elvalign[argument0,argument1]);
        moffx=0; moffy=0; if (elparallax[argument0,argument1]!=0) {moffx=-(view_wview*elparallax[argument0,argument1]/2)+(mouse_x-view_xview)*elparallax[argument0,argument1]; moffy=-(view_hview*elparallax[argument0,argument1]/2)+(mouse_y-view_yview)*elparallax[argument0,argument1];}
        draw_text_outline_ext(elx[argument0,argument1]+moffx,ely[argument0,argument1]+moffy,novdat.Name[novid],elcolor[argument0,argument1],elocolor[argument0,argument1]); break;
    case "text": if (elperx[argument0,argument1]!="") {elx[argument0,argument1]=string_convert_topos(elperx[argument0,argument1]);} if (elpery[argument0,argument1]!="") {ely[argument0,argument1]=string_convert_topos(elpery[argument0,argument1]);}
        draw_text_set(elfont[argument0,argument1],c_white,elhalign[argument0,argument1],elvalign[argument0,argument1]);
        moffx=0; moffy=0; if (elparallax[argument0,argument1]!=0) {moffx=-(view_wview*elparallax[argument0,argument1]/2)+(mouse_x-view_xview)*elparallax[argument0,argument1]; moffy=-(view_hview*elparallax[argument0,argument1]/2)+(mouse_y-view_yview)*elparallax[argument0,argument1];}
        draw_text_outline_ext(elx[argument0,argument1]+moffx,ely[argument0,argument1]+moffy,eltext[argument0,argument1],elcolor[argument0,argument1],elocolor[argument0,argument1]); break;
    case "button": if (elperx[argument0,argument1]!="") {elx[argument0,argument1]=string_convert_topos(elperx[argument0,argument1]);} if (elpery[argument0,argument1]!="") {ely[argument0,argument1]=string_convert_topos(elpery[argument0,argument1]);}
        draw_text_set(elfont[argument0,argument1],c_white,elhalign[argument0,argument1],elvalign[argument0,argument1]); addx=0; addy=0; if (elhalign[argument0,argument1]==fa_left) {addx=string_width(eltext[argument0,argument1])/2;} else if (elhalign[argument0,argument1]==fa_right) {addx=-string_width(eltext[argument0,argument1])/2;}
        moffx=0; moffy=0; if (elparallax[argument0,argument1]!=0) {moffx=-(view_wview*elparallax[argument0,argument1]/2)+(mouse_x-view_xview)*elparallax[argument0,argument1]; moffy=-(view_hview*elparallax[argument0,argument1]/2)+(mouse_y-view_yview)*elparallax[argument0,argument1];}
        if (elvalign[argument0,argument1]==fa_top) {addy=string_height(eltext[argument0,argument1])/2;} else if (elvalign[argument0,argument1]==fa_bottom) {addy=-string_height(eltext[argument0,argument1])/2;}
        if (mouse_check_button_pressed(mb_left)) {_leftpressed=0;}
        if (!elnotext[argument0,argument1]) {if (sprite_exists(elspr1[argument0,argument1]) || sprite_exists(elspr2[argument0,argument1])) {if (sprite_exists(elspr1[argument0,argument1])) {rspr=elspr1[argument0,argument1];} else {rspr=elspr2[argument0,argument1];}
            _xscale=elscale[argument0,argument1]*elscalex[argument0,argument1]; _yscale=elscale[argument0,argument1]*elscaley[argument0,argument1]; _xx=elx[argument0,argument1]+moffx; _yy=ely[argument0,argument1]+moffy;
            //if (cursor_under_button(elx[argument0,argument1]+addx,ely[argument0,argument1]+addy,sprite_get_width(rspr),sprite_get_height(rspr))) {
            if (mouse_x>_xx-sprite_get_width(rspr)*_xscale/2+sprite_get_bbox_left(rspr)*_xscale && mouse_x<_xx-sprite_get_width(rspr)*_xscale/2+sprite_get_bbox_right(rspr)*_xscale && mouse_y>_yy-sprite_get_height(rspr)*_yscale/2+sprite_get_bbox_top(rspr)*_yscale && mouse_y<_yy-sprite_get_height(rspr)*_yscale/2+sprite_get_bbox_bottom(rspr)*_yscale) {global.mHUD=1;
                elplayed2[argument0,argument1]=0; if (!elplayed1[argument0,argument1]) {if (elsound1[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound1[argument0,argument1],elsound1[argument0,argument1]);} elplayed1[argument0,argument1]=1;}
                _clr=elcolor2[argument0,argument1]; _clr2=elocolor2[argument0,argument1]; _clr3=elbcolor2[argument0,argument1]; texture_set_interpolation(elint[argument0,argument1]);
                if (sprite_exists(elspr2[argument0,argument1])) {draw_sprite_ext(elspr2[argument0,argument1],0,elx[argument0,argument1]+moffx+addx,ely[argument0,argument1]+addy+moffy,elscale[argument0,argument1]*elscalex[argument0,argument1],elscale[argument0,argument1]*elscaley[argument0,argument1],0,c_white,alpha);}
                texture_set_interpolation(global.isInterpolation); if (mouse_check_button_pressed(mb_left)) {
                    if (elsound3[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound3[argument0,argument1],elsound3[argument0,argument1]);}
                    _leftpressed=1; mouse_clear(mb_left); nsmenu_do_action(argument0,argument1);}}
                else {elplayed1[argument0,argument1]=0; if (!elplayed2[argument0,argument1]) {if (elsound2[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound2[argument0,argument1],elsound2[argument0,argument1]);} elplayed2[argument0,argument1]=1;}
                    _clr=elcolor1[argument0,argument1]; _clr2=elocolor1[argument0,argument1]; _clr3=elbcolor1[argument0,argument1]; texture_set_interpolation(elint[argument0,argument1]);
                    if (sprite_exists(elspr1[argument0,argument1])) {draw_sprite_ext(elspr1[argument0,argument1],0,elx[argument0,argument1]+moffx+addx,ely[argument0,argument1]+addy+moffy,elscale[argument0,argument1]*elscalex[argument0,argument1],elscale[argument0,argument1]*elscaley[argument0,argument1],0,c_white,alpha);}
                        texture_set_interpolation(global.isInterpolation);}} else {
                if (cursor_under_button(elx[argument0,argument1]+moffx+addx,ely[argument0,argument1]+moffy+addy,string_width(eltext[argument0,argument1]),string_height(eltext[argument0,argument1]))) {global.mHUD=1;
                    elplayed2[argument0,argument1]=0; if (!elplayed1[argument0,argument1]) {if (elsound1[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound1[argument0,argument1],elsound1[argument0,argument1]);} elplayed1[argument0,argument1]=1;}
                    _clr=elcolor2[argument0,argument1]; _clr2=elocolor2[argument0,argument1]; _clr3=elbcolor2[argument0,argument1];} else {
                        elplayed1[argument0,argument1]=0; if (!elplayed2[argument0,argument1]) {if (elsound2[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound2[argument0,argument1],elsound2[argument0,argument1]);} elplayed2[argument0,argument1]=1;}
                        _clr=elcolor1[argument0,argument1]; _clr2=elocolor1[argument0,argument1]; _clr3=elbcolor1[argument0,argument1];}}
            if (elcolor1[argument0,argument1]!=elcolor2[argument0,argument1] || elocolor1[argument0,argument1]!=elocolor2[argument0,argument1]) {if (button_outback_nocswitch(elx[argument0,argument1]+moffx+addx,ely[argument0,argument1]+moffy+addy,eltext[argument0,argument1],_clr,_clr2,_clr3,elback[argument0,argument1])) {if (!_leftpressed) {mouse_clear(mb_left); nsmenu_do_action(argument0,argument1);}}}
            else {if (button_outback(elx[argument0,argument1]+moffx+addx,ely[argument0,argument1]+moffy+addy,eltext[argument0,argument1],_clr,_clr2,_clr3,elback[argument0,argument1])) {if (!_leftpressed) {
                if (elsound3[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound3[argument0,argument1],elsound3[argument0,argument1]);} mouse_clear(mb_left); nsmenu_do_action(argument0,argument1);}}}}
        else {if (sprite_exists(elspr1[argument0,argument1]) || sprite_exists(elspr2[argument0,argument1])) {if (sprite_exists(elspr1[argument0,argument1])) {rspr=elspr1[argument0,argument1];} else {rspr=elspr2[argument0,argument1];}
            _xscale=elscale[argument0,argument1]*elscalex[argument0,argument1]; _yscale=elscale[argument0,argument1]*elscaley[argument0,argument1]; _xx=elx[argument0,argument1]+moffx; _yy=ely[argument0,argument1]+moffy;
            if (mouse_x>_xx-sprite_get_width(rspr)*_xscale/2+sprite_get_bbox_left(rspr)*_xscale && mouse_x<_xx-sprite_get_width(rspr)*_xscale/2+sprite_get_bbox_right(rspr)*_xscale && mouse_y>_yy-sprite_get_height(rspr)*_yscale/2+sprite_get_bbox_top(rspr)*_yscale && mouse_y<_yy-sprite_get_height(rspr)*_yscale/2+sprite_get_bbox_bottom(rspr)*_yscale) {global.mHUD=1;
                elplayed2[argument0,argument1]=0; if (!elplayed1[argument0,argument1]) {if (elsound1[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound1[argument0,argument1],elsound1[argument0,argument1]);} elplayed1[argument0,argument1]=1;}}
            else {elplayed1[argument0,argument1]=0; if (!elplayed2[argument0,argument1]) {if (elsound2[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound2[argument0,argument1],elsound2[argument0,argument1]);} elplayed2[argument0,argument1]=1;}} texture_set_interpolation(elint[argument0,argument1]);
            if (button_sprite_single_scaled(elx[argument0,argument1]+moffx,ely[argument0,argument1]+moffy,elspr1[argument0,argument1],elspr2[argument0,argument1],elscale[argument0,argument1]*elscalex[argument0,argument1],elscale[argument0,argument1]*elscaley[argument0,argument1])) {
                if (elsound3[argument0,argument1]!="") {sound_stream_sound(FS_current_directory()+"\"+elsound3[argument0,argument1],elsound3[argument0,argument1]);} mouse_clear(mb_left); nsmenu_do_action(argument0,argument1);}
                texture_set_interpolation(global.isInterpolation);}} break;
    case "mouse_pressed": if (mouse_check_button_pressed(elmb[argument0,argument1]) && !global.trBack) {global.mHUD=1; mouse_clear(elmb[argument0,argument1]); nsmenu_switch_action(argument0,argument1,elaction[argument0,argument1],elaction1[argument0,argument1]);} break;
    case "blackscreen": drbefore=draw_get_alpha(); draw_set_alpha(drbefore*elalpha[argument0,argument1]); draw_rectangle_colour(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,c_black,c_black,c_black,c_black,0); draw_set_alpha(drbefore); break;
    case "image": if (sprite_exists(elspr[argument0,argument1])) {if (elperx[argument0,argument1]!="") {elx[argument0,argument1]=string_convert_topos(elperx[argument0,argument1]);} if (elpery[argument0,argument1]!="") {ely[argument0,argument1]=string_convert_topos(elpery[argument0,argument1]);}
        moffx=0; moffy=0; if (elparallax[argument0,argument1]!=0) {moffx=-(view_wview*elparallax[argument0,argument1]/2)+(mouse_x-view_xview)*elparallax[argument0,argument1]; moffy=-(view_hview*elparallax[argument0,argument1]/2)+(mouse_y-view_yview)*elparallax[argument0,argument1];}
        draw_sprite_ext(elspr[argument0,argument1],0,elx[argument0,argument1]+moffx,ely[argument0,argument1]+moffy,elscale[argument0,argument1]*elscalex[argument0,argument1],elscale[argument0,argument1]*elscaley[argument0,argument1],0,c_white,alpha*elalpha[argument0,argument1]);} break;}
