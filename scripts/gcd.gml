 ___a = argument0; ___b = argument1;
while ( ___a != 0 ) {
    ___c = ___a; ___a = ___b mod ___a;  ___b = ___c;}
return ___b;
