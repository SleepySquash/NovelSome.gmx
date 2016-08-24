ds_list_clear(tpSList); ds_list_clear(tpSChanList); if (!FS_file_exists(argument0)) {
    with (objGUI_chat) {chat_add_color("Failed to load scenario.",c_red);} return 0; exit;}
tpSLineCount=0; inRead=FS_file_text_open_read(argument0); if (inRead==-1) {return 0; exit;}
while (!FS_file_text_eof(inRead)) {skipline=0; str=FS_file_text_read_string(inRead);
    if (str=="") {skipline=1;} if (!skipline) {ds_list_add(tpSList,str);
    ds_list_add(tpSChanList,0); tpSLineCount+=1;} FS_file_text_readln(inRead);}
if (ds_list_size(tpSList)==0) {ds_list_add(tpSList," "); ds_list_add(tpSChanList,0);}
FS_file_text_close(inRead);

with (objGUI_chat) {chat_add_color("Scenario loaded with "+string(other.tpSLineCount)+" lines.",c_orange);}
return (tpSLineCount>0);
