var ____convstr,____checkfroi,____let;

____convstr=""; for (____checkfroi=1;____checkfroi<=string_length(argument0);____checkfroi+=1) {
    ____let=string_copy(argument0,____checkfroi,1);
    ____convstr+=convertCharToNumber(____let);}

if (string_count("0",____convstr)<=0 && string_count("1",____convstr)<=0 && string_count("2",____convstr)<=0
&& string_count("3",____convstr)<=0 && string_count("4",____convstr)<=0 && string_count("5",____convstr)<=0
&& string_count("6",____convstr)<=0 && string_count("7",____convstr)<=0 && string_count("8",____convstr)<=0
&& string_count("9",____convstr)<=0) {____convstr="";}
return ____convstr;
