if (!instance_exists(obj3DCamera)) {exit;}
with (obj3DCamera) {canView=1; moveMouse=argument0;
    viewLimx1 = argument1+argument2; if (viewLimx1>360) {
        viewLimx1 = argument1+argument2-360;}
    viewLimx2 = argument1-argument2; if (viewLimx2<0) {
        viewLimx2 = abs(argument1-argument2);} viewLimz=argument3;}
