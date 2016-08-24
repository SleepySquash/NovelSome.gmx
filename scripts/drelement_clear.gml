for (ip=0;ip<ds_list_size(pagelist);ip+=1) {ii=ds_list_find_value(pagelist,ip);
    for (i=0;i<elCount[ii];i+=1) {switch (element[ii,i]) {
        case "button": ds_list_destroy(elaction[ii,i]);
            if (sprite_exists(elspr1[ii,i])) {sprite_delete(elspr1[ii,i]);}
            if (sprite_exists(elspr2[ii,i])) {sprite_delete(elspr2[ii,i]);} break;
        case "mouse_pressed": ds_list_destroy(elaction[ii,i]); break;
        case "keyboard_pressed": ds_list_destroy(elaction[ii,i]); break;
        case "image": if (sprite_exists(elspr[ii,i])) {sprite_delete(elspr[ii,i]);} break;}}}
if (ds_map_size(backgrounds)>0) {_f_i=1; for (_i=0;_i<ds_map_size(backgrounds);_i+=1) {
    if (_f_i) {__val=ds_map_find_first(backgrounds); _f_i=0;} else {_f_i=ds_map_find_next(backgrounds,__val);}
    __rval=ds_map_find_value(backgrounds,__val); if (!is_undefined(__rval)) {if (instance_exists(__rval)) {with (__rval) {instance_destroy();}}}}}
if (ds_list_size(pagelist)>0) {ds_list_destroy(pagelist); pagelist = ds_list_create();}
ds_list_clear(__ifs); ds_map_clear(backgrounds);
