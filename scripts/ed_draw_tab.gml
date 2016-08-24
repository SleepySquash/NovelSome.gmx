txt=argument0; isex[tCount]=xxw+string_width(txt)+60>view_wview; if (isex[tCount]) {exCount+=1; exMenuEnabled=1; if (maxxw==0) {exStart=tCount; maxxw=xxw;}}
else {if (exMenu) {if (mUnderExMenu) {button_set_clickble(0);}}} clr=c_white; outclr=c_dkgray; if (tabSelected==tCount) {clr=c_orange;}
if (!isex[tCount] || (isex[tCount] && exMenu)) {ed_drawcyc_tabs(tCount);} xxws[tCount]=xxw-7; xxw+=string_width(txt)+15; button_set_clickble(1); tCount+=1;
