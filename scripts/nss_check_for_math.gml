if (_linked!="") {if (ds_map_exists(_linkdb,_linked)) {
    __v=ds_map_find_value(_linkdb,_linked); if (!is_undefined(__v)) {___gopass=1;
        if (ds_map_exists(_linkdb1,_linked)) {__v1=ds_map_find_value(_linkdb1,_linked);
            if (!is_undefined(__v1)) {if (__v1=="instance") {___gopass=0;}}}
        if (___gopass) {if (!is_string(__v)) {
            if (nss_check("+=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                ds_map_replace(_linkdb,_linked,__v+string_convert_topos(_secpart));}}
            else if (nss_check("++")) {ds_map_replace(_linkdb,_linked,__v+1);}
            else if (nss_check("-=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                ds_map_replace(_linkdb,_linked,__v-string_convert_topos(_secpart));}}
            else if (nss_check("--")) {ds_map_replace(_linkdb,_linked,__v-1);}
            else if (nss_check("*=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                ds_map_replace(_linkdb,_linked,__v*string_convert_topos(_secpart));}}
            else if (nss_check("/=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                ds_map_replace(_linkdb,_linked,__v/string_convert_topos(_secpart));}}}
        else {
            if (nss_check("+=")) {_secpart=string_copy(fstr,3,string_length(fstr)-2); if (_secpart!="") {
                ds_map_replace(_linkdb,_linked,__v+string_convert_topos_string(_secpart));}}
        }}}}}
