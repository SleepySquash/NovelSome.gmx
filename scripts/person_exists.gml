//chnum=-1; for (i=1;i<=novdat.charCount[novid];i+=1) {if (string(novdat.char[novid,i])==string(argument0)) {chnum=i; break;}}
//return (chnum);
if (ds_map_exists(novdat.charlist,(argument0))) {return ds_map_find_value(novdat.charlist,(argument0));} else {return -1;}
