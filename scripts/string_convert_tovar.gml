var __frstr,___ipos,__asdsteps,__str2,__linkdb,__linkdb1,_omdone;

__frstr=string(argument0);

/*if (instance_exists(novel)) {__linkdb=novel.links; __linkdb1=novel.linkstype;
    for (i=0;i<ds_map_size(__linkdb);i+=1) {if (i==0) {__find=ds_map_find_first(__linkdb);}
    else {__find=ds_map_find_next(__linkdb,__find);} __v=ds_map_find_value(__linkdb,__find);
    if (!is_undefined(__v)) {__v1=ds_map_find_value(__linkdb1,__find);
        if (is_undefined(__v1)) {__v1="";} if (__v1!="instance") {
            __frstr=string_replace_all(__frstr,string(__find),string(__v));}}}}
if (novid>=0) {__linkdb=novdat.links[novid]; __linkdb1=novdat.linkstype[novid]; for (i=0;i<ds_map_size(__linkdb);i+=1) {if (i==0) {
    __find=ds_map_find_first(__linkdb);} else {__find=ds_map_find_next(__linkdb,__find);}
    __v=ds_map_find_value(__linkdb,__find); if (!is_undefined(__v)) {__v1=ds_map_find_value(__linkdb1,__find);
        if (is_undefined(__v1)) {__v1="";} if (__v1!="instance") {
            __frstr=string_replace_all(__frstr,string(__find),string(__v));}}}}*/

___ipos=1; __asdsteps=0; while (1) {__asdsteps+=1; if (___ipos<string_length(__frstr)) {_omdone=0;
    while (string_copy(__frstr,1,1) == " ") {if (string_length(__frstr)<=1) {
        break;} else {__frstr = string_copy(__frstr,2,string_length(__frstr)-1);}}
    __str2=string_get_tillsymbol7(__frstr,___ipos,' ','+','-','*','/',')','(');
    while (string_copy(__str2,1,1) == " ") {if (string_length(__str2)<=1) {
        break;} else {__str2 = string_copy(__str2,2,string_length(__str2)-1);}}
    while (string_copy(__str2,1,1) == "!") {if (string_length(__str2)<=1) {
        break;} else {__str2 = string_copy(__str2,2,string_length(__str2)-1);}}
    if (__str2!="") {if (instance_exists(novel)) {__linkdb=novel.links; __linkdb1=novel.linkstype;
        if (ds_map_exists(__linkdb,__str2)) {___v=ds_map_find_value(__linkdb,__str2);
            if (!is_undefined(___v)) {___v1=ds_map_find_value(__linkdb1,__str2);
            ____pass=1; if (!is_undefined(___v1)) {if (___v1=="instance") {____pass=0;}}
            if (____pass) {__frstr=string_replace(__frstr,__str2,string(___v));
                ___ipos=___ipos+string_length(string(___v)); _omdone=1;}}}}
    if (!_omdone) {if (novid>=0) {__linkdb=novdat.links[novid]; __linkdb1=novdat.linkstype[novid];
        if (ds_map_exists(__linkdb,__str2)) {___v=ds_map_find_value(__linkdb,__str2);
            if (!is_undefined(___v)) {___v1=ds_map_find_value(__linkdb1,__str2);
            ____pass=1; if (!is_undefined(___v1)) {if (___v1=="instance") {____pass=0;}}
            if (____pass) {__frstr=string_replace(__frstr,__str2,string(___v));
                ___ipos=___ipos+string_length(string(___v)); _omdone=1;}}}}}
    if (!_omdone) {___ipos+=string_length(__str2)+1;}} else {___ipos+=1;}} else {break;} if (__asdsteps>300) {break;}}

return (__frstr);
