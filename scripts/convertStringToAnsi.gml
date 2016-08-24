thistr=argument0; convstr="";
for (i=0;i<string_length(thistr);i+=1) {
    let=string_copy(thistr,i+1,1); convstr+=ansi_char(let);}

return convstr;
