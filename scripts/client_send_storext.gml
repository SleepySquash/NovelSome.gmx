if (!instance_exists(social)) {notcen_add('E',"Error"); exit;}
buffer_clear(social);
buffer_seek(social.Buffer,buffer_seek_start,0);
buffer_write(social.Buffer,buffer_u8,9);
buffer_write(social.Buffer,buffer_u8,argument0);
if (argument0==5) {buffer_write(social.Buffer,buffer_u32,argument1);} else {
if (argument0==10) {buffer_write(social.Buffer,buffer_u8,argument1);} else {buffer_write(social.Buffer,buffer_string,argument1);}}
network_send_packet(social.Socket,social.Buffer,buffer_tell(social.Buffer));
