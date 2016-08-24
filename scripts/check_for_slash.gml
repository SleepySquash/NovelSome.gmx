thistr=argument0; convstr="";
for (_li=0;_li<string_length(thistr);_li+=1) {
    if (string_copy(thistr,_li+1,1)=="\" || string_copy(thistr,_li+1,1)=="/") {return string_copy(thistr,1,_li);}} return thistr;
