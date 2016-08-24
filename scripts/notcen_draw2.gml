xx=argument0;
yy=argument1;
for (i=0;i<instance_number(objGUI_notobj);i+=1) {
    obj=instance_find(objGUI_notobj,i); if (obj.id==id) { break; }
    yy+=obj.hgt+10; //70
}
