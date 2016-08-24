thistr=argument0; convstr=""; while (string_copy(thistr,1,1)==" ") {thistr=string_copy(thistr,2,string_length(thistr)-1);}
for (i=0;i<string_length(thistr);i+=1) {
    let=string_copy(thistr,i+1,1);
    convstr+=convertCharToASCII_l(let);}

if (convstr==thistr) {return "";} else {return convstr;}
