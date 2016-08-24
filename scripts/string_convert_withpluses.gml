__frstr2=argument0; __fistr=""; __fnqkw_imfirst=1;

while (string_length(__frstr2)>0) {if (__frstr2!="") {if (string_copy(__frstr2,1,1) == '"') {__res=string_get_tillsymbol(__frstr2,2,'"');
    __frstr2=string_copy(__frstr2,1+string_length(__res)+1+1,string_length(__frstr2)-(1+string_length(__res)+1)); __fistr+=__res;}
else if (string_copy(__frstr2,1,1) == ' ') {if (string_length(__frstr2) <= 1) {
    __frstr2="";} else {__frstr2=string_copy(__frstr2,2,string_length(__frstr2)-1);}}
else if (string_copy(__frstr2,1,1) == '+' || __fnqkw_imfirst) {
    __str5=string_get_tillsymbol2(__frstr2,2-__fnqkw_imfirst,'+','"'); __strtoadd=""; __stro=__str5;
    if (__str5!="") {while (string_copy(__str5,1,1) == " ") {if (string_length(__str5) <= 1) {
            __str5=""; break;} __str5=string_copy(__str5,2,string_length(__str5)-1);}
        while (string_copy(__str5,string_length(__str5),1) == " ") {if (string_length(__str5) <= 1) {
            __str5=""; break;} __str5=string_copy(__str5,1,string_length(__str5)-1);}
        
        if (__str5!="") {if (string_lower(string_copy(__str5,1,string_length("math("))) == "math(") {
                __opend=0; ___o_done=0; for (r__ipos=2+string_length("math(")+1;r__ipos<string_length(__frstr2);r__ipos+=1) {
                    if (string_copy(__frstr2,r__ipos,1) == "(") {__opend+=1;}
                    else if (string_copy(__frstr2,r__ipos,1) == ")") {__opend-=1; if (__opend<0) {
                        __2str1=string_copy(__frstr2,3+string_length("math("),r__ipos-(3+string_length("math(")));
                        if (__2str1!="") {__stro="math("+__2str1+")";
                            __2str1=string_convert_topos(__2str1); __strtoadd=string(__2str1);} ___o_done=1;}} if (___o_done) {r__ipos=90000;}}}
                
                /*for (r__ipos=string_length(__str5); r__ipos>string_length("math("); r__ipos-=1) {
                    if (string_copy(__str5,r__ipos,1) == ")") {
                        __str1=string_copy(__str5,string_length("math(")+1,string_length(__str5)-r__ipos);
                        if (__str1!="") {notcen_add('',"math wiil be: '"+__str1+"' "); __str1=string_convert_topos(__str1); __strtoadd=string(__str1);} break;}
                */
            else {___donext=1;
                if (instance_exists(novel)) {__linkdb=novel.links;
                if (ds_map_exists(__linkdb,__str5)) {__va=ds_map_find_value(__linkdb,__str5);
                    if (!is_undefined(__va))  {__strtoadd=string(__va); ___donext=0;}}}
                
                if (___donext) {if (novid!=-1) {__linkdb=novdat.links[novid];}
                if (ds_map_exists(__linkdb,__str5)) {__va=ds_map_find_value(__linkdb,__str5);
                    if (!is_undefined(__va)) {__strtoadd=string(__va);}}}}}}
        
    __frstr2=string_replace(__frstr2,"+","");
    __frstr2=string_replace(__frstr2,__stro,""); __fistr+=__strtoadd;}
else {if (string_length(__frstr2) <= 1) {__frstr2="";} else {__frstr2=string_copy(__frstr2,2,string_length(__frstr2)-1);}}
__fnqkw_imfirst=0;} else {break;}}

return __fistr;
