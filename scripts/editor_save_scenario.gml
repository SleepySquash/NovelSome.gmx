if (ds_list_size(tpSList)>0) {ds_list_clear(tpSChanList); if (FS_file_exists(argument0)) {FS_file_copy(argument0,argument0+".bak"); FS_file_delete(argument0);}
_lncount=0; inRead=FS_file_text_open_write(argument0); if (inRead==-1) {return 0; exit;}
ds_list_clear(tpSChanList); for (i=0;i<ds_list_size(tpSList);i+=1) {skipline=0; info=ds_list_find_value(tpSList,i); if (ds_list_size(tpSList)<=1) {
        if (info==" " || info=="" || info==lang.insert_action_here) {skipline=1;}} if (!skipline) {
    FS_file_text_write_string(inRead,info);} ds_list_add(tpSChanList,0); _lncount+=1; if (!skipline) {
        FS_file_text_writeln(inRead);}} FS_file_text_close(inRead);

with (objGUI_chat) {chat_add_color("Scenario saved with "+string(other._lncount)+" lines.",c_lime);}
return 1;} else {return 0;}
