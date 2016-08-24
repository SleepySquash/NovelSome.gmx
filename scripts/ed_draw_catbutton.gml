text=argument1; clr=global.mButtonClr oclr=global.mButtonOutClr; if (tpStoryType==argument0) {clr=c_lime;}
if (button_outback(view_xview+view_wview/2+xxw,view_yview+yyh,text,clr,oclr,c_black,1)) {rlChan=1;
    if (tpStoryType!=argument0) {tpStoryType=argument0;} else {tpStoryType=-1;}} yyh+=string_height("A")+4;
