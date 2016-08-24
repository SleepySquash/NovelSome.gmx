if (!instance_exists(social)) {notcen_add('E',"Error"); exit;}
buffer_clear(social);
buffer_seek(social.Buffer,buffer_seek_start,0);
buffer_write(social.Buffer,buffer_u8,9);
buffer_write(social.Buffer,buffer_u8,argument0);
network_send_packet(social.Socket,social.Buffer,buffer_tell(social.Buffer));
