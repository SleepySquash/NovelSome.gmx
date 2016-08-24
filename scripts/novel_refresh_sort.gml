/*if (argument0==0 || argument0==2) {_list=ds_list_create(); _map=ds_map_create(); for (i=0;i<global.novelCount;i+=1) {
    ds_list_add(_list,novdat.ATpose[i]); ds_map_add(_map,novdat.ATpose[i],i);} ds_list_sort(_list,1); for (i=0;i<global.novelCount;i+=1) {
    novdat.sortPose[i]=ds_map_find_value(_map,ds_list_find_value(_list,i));} ds_list_destroy(_list); ds_map_destroy(_map);}
if (argument0==1 || argument0==2) {_list=ds_list_create(); _map=ds_map_create(); for (i=0;i<global.novelCount;i+=1) {
    show_debug_message(string(i)+" "+string(novdat.ACpose[i]));
    ds_list_add(_list,novdat.ACpose[i]); ds_map_add(_map,novdat.ACpose[i],i);} ds_list_sort(_list,1); for (i=0;i<global.novelCount;i+=1) {
    show_debug_message(string(ds_map_find_value(_map,ds_list_find_value(_list,i)))+" "+string(ds_list_find_value(_list,i)));
    novdat.chanPose[i]=ds_map_find_value(_map,ds_list_find_value(_list,i));} ds_list_destroy(_list); ds_map_destroy(_map);}*/

if (argument0==0 || argument0==2) {_grid=ds_grid_create(1,global.novelCount); _map=ds_map_create(); for (i=0;i<global.novelCount;i+=1) {
    ds_grid_add(_grid,0,i,novdat.ATpose[i]); ds_map_add(_map,novdat.ATpose[i],i);} ds_grid_sort(_grid,0,1); for (i=0;i<global.novelCount;i+=1) {
        novdat.sortPose[i]=ds_map_find_value(_map,ds_grid_get(_grid,0,i));} ds_grid_destroy(_grid); ds_map_destroy(_map);}
if (argument0==1 || argument0==2) {_grid=ds_grid_create(1,global.novelCount); _map=ds_map_create(); for (i=0;i<global.novelCount;i+=1) {
    ds_grid_add(_grid,0,i,novdat.ACpose[i]); ds_map_add(_map,novdat.ACpose[i],i);} ds_grid_sort(_grid,0,1); for (i=0;i<global.novelCount;i+=1) {
        novdat.chanPose[i]=ds_map_find_value(_map,ds_grid_get(_grid,0,i));} ds_grid_destroy(_grid); ds_map_destroy(_map);}
if (argument0==3 || argument0==2) {_grid=ds_grid_create(1,global.novelCount); _map=ds_map_create(); for (i=0;i<global.novelCount;i+=1) {
    ds_grid_add(_grid,0,i,novdat.AUpose[i]); ds_map_add(_map,novdat.AUpose[i],i);} ds_grid_sort(_grid,0,1); for (i=0;i<global.novelCount;i+=1) {
        novdat.updPose[i]=ds_map_find_value(_map,ds_grid_get(_grid,0,i));} ds_grid_destroy(_grid); ds_map_destroy(_map);}

/*_list=ds_list_create();
ds_list_add(_list,20150829234710);
ds_list_add(_list,20150829244710);
ds_list_add(_list,20150829212410);
ds_list_add(_list,20150829294719);
ds_list_add(_list,20150829234711);
ds_list_add(_list,20150829234709);
ds_list_sort(_list,1);
for (i=0;i<ds_list_size(_list);i+=1) {
    show_debug_message(string(ds_list_find_value(_list,i)));}
ds_list_destroy(_list);
show_debug_message("#########");
_grid=ds_grid_create(1,6);
ds_grid_add(_grid,0,0,20150829234710);
ds_grid_add(_grid,0,1,20150829244710);
ds_grid_add(_grid,0,2,20150829212410);
ds_grid_add(_grid,0,3,20150829294719);
ds_grid_add(_grid,0,4,20150829234711);
ds_grid_add(_grid,0,5,20150829234709);
ds_grid_sort(_grid,0,1);
for (i=0;i<6;i+=1) {show_debug_message(string(ds_grid_get(_grid,0,i)));}
ds_grid_destroy(_grid);*/
