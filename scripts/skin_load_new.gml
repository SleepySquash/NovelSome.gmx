_lcsk=global.SkinID; if (global.SkinCorrupted) {global.SkinID=0;} global.dialMaxAlpha=0.6; global.dialTxtOffx=20;
global.dialBox=sprDial_box; global.dialNamebox=sprDial_namebox; global.dialForcedBClr=0; global.dialTxtOffy=20; global.dialChooseClr=c_orange;
global.dialAlphaGain=0.9; global.dialBoxOffx=20; global.dialBoxOffy=20; global.dialBoxHeight=110; global.dialNBoxOff=3;
global.dialNBoxWidth=160; global.dialNBoxHeight=36; global.dialTextSep=25; global.dialTextClr=c_white; global.dialTextFont=Neucha18;
global.dialIsCback=1; global.dialBackClr=c_dkgray; global.dialBackOutclr=c_white; global.dialBackAlpha=0.5; global.dDrawFont=global.dialTextFont;
if (global.SkinID!=0) {if (file_exists(skindat.FName[global.SkinID])) {ini_open(skindat.FName[global.SkinID]);
    skindat.FolName[global.SkinID]=ini_read_string("SKINDATA","FolderName","");
    global.dialMaxAlpha=ini_read_real("SKINDATA","DialogueMaxAlpha",global.dialMaxAlpha);
    global.dialTxtOffx=ini_read_real("SKINDATA","DialogueTextOffx",global.dialTxtOffx);
    global.dialTxtOffy=ini_read_real("SKINDATA","DialogueTextOffy",global.dialTxtOffy);
    global.dialAlphaGain=ini_read_real("SKINDATA","DialogueAlphaGain",global.dialAlphaGain);
    global.dialBoxOffx=ini_read_real("SKINDATA","DialogueBoxOffx",global.dialBoxOffx);
    global.dialBoxOffy=ini_read_real("SKINDATA","DialogueBoxOffy",global.dialBoxOffy);
    global.dialBoxHeight=ini_read_real("SKINDATA","DialogueBoxHeight",global.dialBoxHeight);
    global.dialNBoxOff=ini_read_real("SKINDATA","DialogueNBoxOff",global.dialNBoxOff);
    global.dialNBoxWidth=ini_read_real("SKINDATA","DialogueNBoxWidth",global.dialNBoxWidth);
    global.dialNBoxHeight=ini_read_real("SKINDATA","DialogueNBoxHeight",global.dialNBoxHeight);
    global.dialBackAlpha=ini_read_real("SKINDATA","DialogueBackMaxAlpha",global.dialBackAlpha);
    global.dialTextSep=ini_read_real("SKINDATA","DialogueTextSep",global.dialTextSep);
    global.dialChooseClr=ini_make_color("SKINDATA","DialogueChooseClr_",global.dialChooseClr);
    global.dialTextClr=ini_make_color("SKINDATA","DialogueTextClr_",global.dialTextClr);
    _txt=ini_read_string("SKINDATA","DialogueTextFont",global.dialTextFont);
        if (string(_txt)!=string(global.dialTextFont)) {global.dialTextFont=convertToFont(_txt);}
        global.dDrawFont=global.dialTextFont;
    global.dialIsCback=ini_read_real("SKINDATA","DialogueColoredBack",global.dialIsCback);
    global.dialForcedBClr=ini_read_real("SKINDATA","DialogueForcedBackColor",global.dialForcedBClr);
    global.dialBackClr=ini_make_color("SKINDATA","DialogueBackClr_",global.dialBackClr);
    global.dialBackOutclr=ini_make_color("SKINDATA","DialogueBackOutclr_",global.dialBackOutclr);
    sprName="dialogueBox"; _skimg=ini_read_string("SPRITES",sprName,"");
    if (file_exists(working_directory+"Skins\"+skindat.FolName[global.SkinID]+"\"+_skimg)) {_skimgnum=ini_read_real("SPRITES",sprName+"_num",1);
        _skimgofx=ini_read_real("SPRITES",sprName+"_offx",0); _skimgofy=ini_read_real("SPRITES",sprName+"_offy",0);
        global.dialBox=sprite_add(working_directory+"Skins\"+skindat.FolName[global.SkinID]+"\"+_skimg,_skimgnum,0,0,_skimgofx,_skimgofy);}
    sprName="dialogueNamebox"; _skimg=ini_read_string("SPRITES",sprName,"");
    if (file_exists(working_directory+"Skins\"+skindat.FolName[global.SkinID]+"\"+_skimg)) {_skimgnum=ini_read_real("SPRITES",sprName+"_num",1);
        _skimgofx=ini_read_real("SPRITES",sprName+"_offx",0); _skimgofy=ini_read_real("SPRITES",sprName+"_offy",0);
        global.dialNamebox=sprite_add(working_directory+"Skins\"+skindat.FolName[global.SkinID]+"\"+_skimg,_skimgnum,0,0,_skimgofx,_skimgofy);} ini_close();}}
if (global.SkinCorrupted) {global.SkinID=_lcsk;}
