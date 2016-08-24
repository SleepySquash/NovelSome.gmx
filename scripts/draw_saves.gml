cUnder=0; _mbrpressed=0; if (mouse_check_button_pressed(mb_right)) {if (dprd!=-1) {_mbrpressed=1;} dprd=-1;}
slxc=floor((view_wview-80)/220); slyc=floor((view_hview-80)/140); yyh=(view_hview-(((view_hview-80)/140)*140))/2;
xxw=(view_wview-(((view_wview-80)/220)*220))/2+(view_wview/2-(((view_wview-80)/220)*220/2)); //xxw=(view_wview-((slxc)*220))/2+220/4;
pcount=floor(global.savCount/(slxc*slyc)); lpage=0; if (pcount!=global.savCount/(slxc*slyc)) {pcount+=1; lpage=1; lpcount=(slxc*slyc)+(global.savCount-(pcount*(slxc*slyc)));}
if (global.resChanged) {if (selPage-1>pcount) {selPage=pcount-1;}} draw_set_alpha(gpalpha*2);
snum=(selPage*(slxc*slyc))+1; if (selPage==pcount && lpage) {_ctx=0; _cty=1; repeat (lpcount) {_ctx+=1; if (_ctx>=slxc) {actsx=_ctx; _cty+=1; _ctx=0;} actsy=_cty;}} else {actsx=slxc; actsy=slyc;}
draw_text_set(Pacifica16,c_white,fa_center,fa_middle); yyh2=70; for (i=0;i<pcount;i+=1) {clr=c_white; if (selPage==i) {clr=c_lime; button_set_clickble(0);}
    if (button_outback(5+string_width("Page "+string(i+1))/2,yyh2,"Page "+string(i+1),clr,c_dkgray,c_black,1)) {dprd=-1;
        for (ii=snum;ii<snum+(slxc*slyc);ii+=1) {if (selPage==pcount-1 && lpage) {if (ii>lpcount) {break;}}
            if (sprite_exists(thspr[ii])) {sprite_delete(thspr[ii]);}}
        selPage=i;} yyh2+=string_height("A")+4; if (selPage==i) {button_set_clickble(1);}}
draw_text_set(Arial12,c_white,fa_left,fa_top); crcycle=0; repeat (actsy) {if (selPage==pcount-1 && lpage) {if (crcycle>lpcount) {break;}} repeat (actsx) {crcycle+=1; if (selPage==pcount-1 && lpage) {if (crcycle>lpcount) {break;}}
    draw_set_alpha(gpalpha-gpalpha/4); draw_rectangle_colour(view_xview+xxw,view_yview+yyh,view_xview+xxw+200,view_yview+yyh+120,c_black,c_black,c_black,c_black,0);
    if (global.gameBundle!=-1) {_savefolder="";} else {
    if (novdat.prefix[novid]!="") {_savefolder = novdat.prefix[novid];}
    else {_savefolder=string_replace_all(novdat.FolderName[novid],"/",".");
        _savefolder=string_replace_all(_savefolder,"\","."); _savefolder="local\"+_savefolder;}}
    draw_set_alpha(gpalpha*2); saved=0; if (file_exists(current_directory()+"\Saves\"+_savefolder+"\Save"+string(snum)+".nsave")) {saved=1;}
    if (!saved) {draw_text_outline_sep(view_xview+xxw+5,view_yview+yyh+5,"Save "+string(snum)+"#Unsaved",190); thspr[snum]=noone;} else {
        if (global.thuAppData) {fname=current_directory()+"Saves\"+_savefolder+"\Thumbnail"+string(snum)+".png";} else {
            fname=current_directory()+"\Saves\"+_savefolder+"\Thumbnail"+string(snum)+".png";}
        if (file_exists(fname)) {if (!sprite_exists(thspr[snum])) {thspr[snum]=sprite_add(fname,1,0,0,0,0);}
            else {draw_sprite_ext(thspr[snum],-1,view_xview+xxw,view_yview+yyh,200/sprite_get_width(thspr[snum]),120/sprite_get_height(thspr[snum]),0,c_white,gpalpha*2);}} else {thspr[snum]=noone;}
        draw_text_outline_sep(view_xview+xxw+5,view_yview+yyh+5,"Save "+string(snum),190);}
    if (dprd==snum && saved) {draw_set_alpha(gpalpha/3); draw_rectangle_colour(view_xview+xxw,view_yview+yyh,view_xview+xxw+200,view_yview+yyh+120,c_red,c_red,c_red,c_red,0); draw_set_alpha(gpalpha*2);
        draw_rectangle_colour(view_xview+xxw,view_yview+yyh,view_xview+xxw+200,view_yview+yyh+120,c_red,c_red,c_red,c_red,1);
        draw_text_set(Arial12,c_white,fa_center,fa_middle); draw_text_outline(view_xview+xxw+200/2,view_yview+yyh+120/2,"Удалить?"); draw_text_set(Arial12,c_white,fa_left,fa_top);}
    if (cursor_under_button(view_xview+xxw+100,view_yview+yyh+60,200,120)) {if (global.btCl1) {cUnder=1; draw_rectangle_colour(view_xview+xxw,view_yview+yyh,view_xview+xxw+200,view_yview+yyh+120,c_white,c_white,c_white,c_white,gpalpha*2);
        if (mouse_check_button_pressed(mb_right) && saved) {if (!_mbrpressed) {dprd=snum;} mouse_clear(mb_right);}
        if (mouse_check_button_pressed(mb_right) && !saved) {if (!_mbrpressed && dprd==-1) {cUnder=0;} dprd=-1; for (ii=1;ii<=global.savCount;ii+=1) {if (sprite_exists(thspr[ii])) {sprite_delete(thspr[ii]);}}}
        if (mouse_check_button_pressed(mb_left)) {if (dprd==snum) {dprd=-1;
            if (file_exists(current_directory()+"\Saves\"+_savefolder+"\Save"+string(snum)+".nsave")) {
                ns_file_delete(current_directory()+"\Saves\"+_savefolder+"\Save"+string(snum)+".nsave");}
            if (file_exists(current_directory()+"\Saves\"+_savefolder+"\Thumbnail"+string(snum)+".png")) {
                ns_file_delete(current_directory()+"\Saves\"+_savefolder+"\Thumbnail"+string(snum)+".png");}
            if (sprite_exists(thspr[snum])) {sprite_delete(thspr[snum]);}}
            else {if (savemode==1) {savenum=snum; if (saved) {/*quest=show_question_async("Заменить?"); waiting=1;*/instance_create(0,0,objGUI_overwrite); mouse_clear(mb_left);} else {saving=1;}}
                else if (savemode==0) {if (saved) {if (global.inGame) {
                    ab=instance_create(0,0,objGUI_load); ab.file=current_directory()+"\Saves\"+_savefolder+"\Save"+string(snum)+".nsave";}
                    else {file=current_directory()+"\Saves\"+_savefolder+"\Save"+string(snum)+".nsave"; if (file_exists(file)) {
                        for (ii=1;ii<=global.savCount;ii+=1) {if (sprite_exists(thspr[ii])) {sprite_delete(thspr[ii]);}} game_loadgame(novid,file);}}
                mouse_clear(mb_left);}}} dprd=-1; mouse_clear(mb_left);}}}
    xxw+=220; snum+=1;} yyh+=140; xxw=(view_wview-(((view_wview-80)/220)*220))/2+(view_wview/2-(((view_wview-80)/220)*220/2));}
if (global.btCl1) {if (mouse_check_button_pressed(mb_left)) {dprd=-1;}
    if (mouse_wheel_up()) {if (selPage-1>=0) {selPage-=1;}} if (mouse_wheel_down()) {if (selPage+1<pcount) {selPage+=1;}}}
