convstr="";
for (ichar=0;ichar<string_length(argument0);ichar+=1) {
    let=string_copy(argument0,ichar+1,1);
    convstr+=convertCharToPath(let);}

if (convstr==argument0) {return "";} else {return convstr;}
