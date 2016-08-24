if (instance_number(objGUI_notobj)>=9) {with (instance_find(objGUI_notobj,0)) {instance_destroy();}}

n=instance_create(0,0,objGUI_notobj);
if (argument0=='W') {      n.notv_color=c_orange;}
else if (argument0=='E')  {n.notv_color=c_red;}
else if (argument0=='N')  {n.notv_color=c_blue;}
else if (argument0=='I')  {n.notv_color=c_green;}
else if (argument0=='P')  {n.notv_color=c_purple;}
else if (argument0=='A')  {n.notv_color=c_aqua;}
else {n.notv_color=c_white;}
n.notv_text=argument1;
n.notv_spr=sprnone;
with (n) {
    xx=view_wview;
    yy=10;
    notv_maxdelay=100;
    notcen_draw2(view_wview,10);}
