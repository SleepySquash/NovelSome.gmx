if (!instance_exists(argument0)) {exit;} if (!instance_exists(obj3DCamera)) {exit;}
with (obj3DCamera) {direction -= angle_difference(direction,point_direction(x,y,argument0.x,argument0.y));
    pitch -= angle_difference(pitch,-point_direction(0,z+_lookfromz,abs(point_distance(x,y,argument0.x,argument0.y)),argument0.z));
    /*direction = point_direction(x,y,argument0.x,argument0.y);
    __pdirect = -point_direction(0,z+_lookfromz,abs(point_distance(x,y,argument0.x,argument0.y)),argument0.z);
    if (__pdirect<-viewLimz) {__pdirect = 360+__pdirect;} if (__pdirect>viewLimz) {__pdirect = __pdirect-360;}
    pitch = __pdirect;*/}
