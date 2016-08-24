if (instance_number(objGUI_notobj)>=9) {with (instance_find(objGUI_notobj,0)) {instance_destroy();}}

n=instance_create(0,0,objGUI_notobj);
if (argument0=='W') {      n.notv_color=c_orange;}
else if (argument0=='E')  {n.notv_color=c_red;}
else if (argument0=='N')  {n.notv_color=c_blue;}
else if (argument0=='I')  {n.notv_color=c_green;}
else if (argument0=='WB') {n.notv_color=c_orange;}
else if (argument0=='EB') {n.notv_color=c_red;}
else if (argument0=='NB') {n.notv_color=c_blue;}
else if (argument0=='IB') {n.notv_color=c_green;}
else {n.notv_color=c_white;}    
n.notv_button=1; n.notv_buttontype=0; n.notv_buttontxt=argument2; n.notv_buttonopt=argument3;
n.notv_text=argument1;
n.notv_spr=sprnone;
with (n) {
    xx=view_wview;
    yy=10;
    notv_maxdelay=100;
    notcen_draw2(view_wview,10);}

for (i=0; i<=instance_number(objGUI_notobj); i+=1) {
    ab=instance_find(objGUI_notobj,i);
    if (ab.id==n.id) {exit;}
    if (ab.notv_button && string(ab.notv_text)==string(n.notv_text) && string(ab.notv_buttontxt)==string(n.notv_buttontxt)) {
        with (ab) {selfdestruction=1;}}}
