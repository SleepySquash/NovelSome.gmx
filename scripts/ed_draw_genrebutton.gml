sid=argument0; text=argument1; clr=global.mButtonClr oclr=global.mButtonOutClr; if (gsel[sid]) {clr=c_lime;}
if (yyh>=view_hview-70 && glvl!=2) {if (glvl==0) {xxw=0; yyh=50; glvl=1;} else if (glvl==1) {xxw=view_wview/4; yyh=50; glvl=2;}}
if (button_outback(view_xview+view_wview/2+xxw,view_yview+yyh,text,clr,oclr,c_black,1)) {rlChan=1;
    if (!gsel[sid]) {gsel[sid]=1; tpGCount+=1; tpGenre[tpGCount]=sid;} else {strt=0;
        gsel[sid]=0; for(gi=1;gi<=tpGCount;gi+=1) {if (tpGenre[gi]==sid) {strt=1;}
            if (gi!=tpGCount) {if (strt) {tpGenre[gi]=tpGenre[gi+1];}}} tpGCount-=1;}} ct+=1; yyh+=string_height("A")+4;
