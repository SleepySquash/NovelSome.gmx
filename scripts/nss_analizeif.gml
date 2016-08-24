var __elseif,_var,_whole,_act,_val,__isstring,__wordsize,__ivar;

if (nss_check("else if ")) {__elseif="else if ";} else if (nss_check("elseif ")) {__elseif="elseif ";} else {__elseif="if ";}
_var = string_get_sstring(fstr,string_length(__elseif)+1);
_whole=string_copy(fstr,string_length(__elseif)+1,string_length(fstr)-string_length(__elseif));
while (string_copy(_whole,1,1) == " ") {if (string_length(_whole)<=1) {break;} _whole = string_copy(_whole,2,string_length(_whole)-1);}
if (_whole!="") {if (string_length(_whole)>0) {
        while (string_copy(_whole,string_length(_whole),1) == " ") {if (string_length(_whole)<=1) {break;} _whole = string_copy(_whole,1,string_length(_whole)-1);}
        while (string_copy(_whole,1,1) == " ") {if (string_length(_whole)<=1) {break;} _whole = string_copy(_whole,2,string_length(_whole)-1);}}
    if (string_copy(_whole,1,1)=="(" && string_copy(_whole,string_length(_whole),1) == ")") {
        _whole=string_copy(_whole,2,string_length(_whole)-2);}
    _act=""; _val=""; _var=""; __isstring=0;
    for (__ivar=1;__ivar<=string_length(_whole);__ivar+=1) {__wordsize=0;
        if (string_copy(_whole,__ivar,2) == "==") {__wordsize=2; _act="=";}
        else if (string_copy(_whole,__ivar,1) == "=") {__wordsize=1; _act="=";}
        else if (string_copy(_whole,__ivar,2) == "<=") {__wordsize=2; _act="<=";}
        else if (string_copy(_whole,__ivar,2) == ">=") {__wordsize=2; _act=">=";}
        else if (string_copy(_whole,__ivar,1) == "<") {__wordsize=1; _act="<";}
        else if (string_copy(_whole,__ivar,1) == ">") {__wordsize=1; _act=">";}
        else if (string_copy(_whole,__ivar,2) == "!=") {__wordsize=2; _act="!=";}
        if (__wordsize>0) {_var=string_copy(_whole,1,__ivar-1);
            _val=string_copy(_whole,__ivar+__wordsize,string_length(_whole)-__ivar);
            break;}} if (__wordsize<=0) {_var=_whole;}
    if (string_length(_var)>0) {while (string_copy(_var,string_length(_var),1) == " ") {if (string_length(_var)<=1) {break;} _var = string_copy(_var,1,string_length(_var)-1);}}
    if (string_length(_val)>0) {while (string_copy(_val,1,1) == " ") {if (string_length(_val)<=1) {break;} _val = string_copy(_val,2,string_length(_val)-1);}}
    if (string_count('"',_val) > 0) {__isstring=1; _val=string_replace_all(_val,'"',"");}
    //if (__elseif=="if ") {element[ds_list_size(ifs)]="if";} else {element[ds_list_size(ifs)]="elseif";}
    elvar[ds_list_size(ifs)]=_var; elact[ds_list_size(ifs)]=_act;
    elval[ds_list_size(ifs)]=_val; elisstring[ds_list_size(ifs)]=__isstring;}
