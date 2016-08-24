ds_map_clear(novdat.novels);
if (os_browser != browser_not_a_browser) {global.novelCount=0; global.delCount=0;
    novdat.priority=ds_priority_create(); novdat.prchanged=ds_priority_create();
    
    if (story_load_preview(current_directory()+"Novels\Sample\sample.ndata",global.novelCount)) {
        ds_map_replace(novdat.novels,current_directory()+"Novels\Sample\sample.ndata",global.novelCount-1);}
    //story_load_preview(working_directory+"Novels/Darker_than_Black/Darker than Black.nsndat",0);
    //story_load_preview(working_directory+"Novels/13 FEVRALYA/13 FEVRALYA.nsndat",0);
    
    exit;}
//if (os_type != os_windows) {global.novelCount=0; global.delCount=0;
//    novdat.priority=ds_priority_create(); novdat.prchanged=ds_priority_create(); exit;}
if (string_length(string(current_month))>1) {mt=string(current_month);} else {mt="0"+string(current_month);}
if (string_length(string(current_day))>1) {dt=string(current_day);} else {dt="0"+string(current_day);}
if (string_length(string(current_hour))>1) {ht=string(current_hour);} else {ht="0"+string(current_hour);}
if (string_length(string(current_minute))>1) {mmt=string(current_minute);} else {mmt="0"+string(current_minute);}
if (string_length(string(current_second))>1) {st=string(current_second);} else {st="0"+string(current_second);}
global.delCount=0; crTime=real(string(current_year)+string(mt)+string(dt)+string(ht)+string(mmt)+string(st));
for (i=0;i<global.novelCount;i+=1) {if (ds_exists(novdat.links[i],ds_type_map)) {ds_map_destroy(novdat.links[i]);}
    if (ds_exists(novdat.linkstype[i],ds_type_map)) {ds_map_destroy(novdat.linkstype[i]);}
    if (!novdat.isObsolete[i]) {if (ds_exists(novdat.events[i],ds_type_map)) {ds_map_destroy(novdat.events[i]);}}}
global.novelCount=0; othchar=file_find_all_dir(working_directory+"Novels","nsndat");
othchar=file_find_add_dir(working_directory+"Novels","ndata");
if (ds_exists(novdat.expid,ds_type_map)) {ds_map_destroy(novdat.expid);} novdat.expid=ds_map_create();
if (ds_exists(novdat.priority,ds_type_priority)) {ds_priority_destroy(novdat.priority);} novdat.priority=ds_priority_create();
if (ds_exists(novdat.prchanged,ds_type_priority)) {ds_priority_destroy(novdat.prchanged);} novdat.prchanged=ds_priority_create();
if (othchar) {for (ii=0;ii<global.file_find_all_count;ii+=1) {if (file_exists(global.file_find_all_file[ii])) {
    if (!ds_map_exists(novdat.novels,global.file_find_all_file[ii])) {
        if (story_load_preview(global.file_find_all_file[ii],global.novelCount)) {
            ds_map_replace(novdat.novels,global.file_find_all_file[ii],global.novelCount-1);}}}}}
novel_refresh_sort(2); if (upddat.inited && !upddat.chUpdates) {if (global.stScanned) {upddat.alarm[1]=2;}}
/*_grid=ds_grid_create(global.novelCount,2); for (i=0;i<global.novelCount;i+=1) {
    ds_grid_add(_grid,i,1,i); ds_grid_add(_grid,i,2,novdat.ATpose[i]);}
for (i=0;i<global.novelCount;i+=1) {novdat.sortPose[i]=ds_grid_get_min(_grid,1,2,global.novelCount,2);} ds_grid_destroy(_grid);*/
//_prlist=ds_priority_create(); ds_priority_copy(_prlist,novdat.priority); for (i=0;i<global.novelCount;i+=1) {
//    novdat.sortPose[i]=ds_priority_delete_min(_prlist);} ds_priority_destroy(_prlist);
//_prlist=ds_priority_create(); ds_priority_copy(_prlist,novdat.prchanged); for (i=0;i<global.novelCount;i+=1) {
//    novdat.chanPose[i]=ds_priority_delete_min(_prlist);} ds_priority_destroy(_prlist);
