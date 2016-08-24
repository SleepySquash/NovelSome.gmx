animation_initl(); wasAnimated=0;
if (!file_exists(working_directory+novdat.FolName[argument1]+"\"+argument0)) {return 0; exit;}
currentAnim=novdat.FolName[argument1]+"\"+argument0; cranim=novdat.FolName[argument1]+"\"+argument0;
lineCount=0; inRead=file_text_open_read(working_directory+novdat.FolName[argument1]+"\"+argument0); if (inRead==-1) {return 0; exit;}
while (!file_text_eof(inRead)) {line[lineCount]=file_text_read_string(inRead); lineCount+=1; file_text_readln(inRead);}
file_text_close(inRead); crline=0; areseted=0; atelled=0; xmoving=0; ymoving=0; zmoving=0; _time1=0; _time2=0; _time6=0;
waitingForComplete=0; nowait=0; anotell=0;

if (global.debug) {with (objGUI_chat) {chat_add_color("Animation loaded with "+string(other.lineCount)+" lines",c_orange);}}
return (lineCount>0);
