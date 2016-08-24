if (instance_exists(novel)) {if (ds_map_exists(novel.links,argument0)) {return ds_map_find_value(novel.links,argument0);}}
if (ds_map_exists(novdat.links[novid],argument0)) {return ds_map_find_value(novdat.links[novid],argument0);}
return undefined;
