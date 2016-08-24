aa=0;
if (argument0=='W') {      notv_color=c_orange;}
else if (argument0=='E')  {notv_color=c_red;}
else if (argument0=='N')  {notv_color=c_blue;}
else {notv_color=c_white;}
for (i=0; i<instance_number(objGUI_notobj); i+=1) {
    a=instance_find(objGUI_notobj,i); if (a.notv_color == notv_color && a.notv_text == argument1) {aa=1; return aa; exit;}}
return aa;
