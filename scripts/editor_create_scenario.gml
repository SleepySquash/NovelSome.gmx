ds_list_clear(tpSList); ds_list_clear(tpSChanList); if (FS_file_exists(argument0)) {FS_file_delete(argument0);}
inRead=FS_file_text_open_write(argument0); tpSLineCount=0;
FS_file_text_write_string(inRead," "); FS_file_text_close(inRead);
ds_list_add(tpSList," "); ds_list_add(tpSChanList,0);
