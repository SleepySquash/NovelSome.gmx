if (!instance_exists(social)) {notcen_add('E',"Error"); exit;}
buffer_clear(social);
buffer_seek(social.Buffer,buffer_seek_start,0);
buffer_write(social.Buffer,buffer_u8,6);
buffer_write(social.Buffer,buffer_string,argument0);
buffer_write(social.Buffer,buffer_string,argument1);
network_send_packet(social.Socket,social.Buffer,buffer_tell(social.Buffer));

/*if (!instance_exists(conn)) { notcen_add('E',"Error"); exit; }
if (global.debug) {notcen_add('','PLAYER SENDING: '+string(argument0));}
switch (argument0) {
    case 'co': //coordinats
        dll39_buffer_clear(0);
        dll39_write_byte(5,0);
        dll39_write_string(argument0,0);
        dll39_write_short(x,0);
        dll39_write_short(y,0);
        dll39_message_send(conn.server,0,0,0);
    break;
    
    case 'lc': //loc
        dll39_buffer_clear(0);
        dll39_write_byte(5,0);
        dll39_write_string(argument0,0);
        dll39_write_int(argument1,0);
        dll39_message_send(conn.server,0,0,0);
    break;
    
    case 'sk': //skin
        dll39_buffer_clear(0);
        dll39_write_byte(5,0);
        dll39_write_string(argument0,0);
        dll39_write_int(argument1,0);
        dll39_message_send(conn.server,0,0,0);
    break;
    
    case 'dr': //dir
        dll39_buffer_clear(0);
        dll39_write_byte(5,0);
        dll39_write_string(argument0,0);
        dll39_write_string(argument1,0);
        dll39_message_send(conn.server,0,0,0);
    break;
    
    case 'as': //animation state
        dll39_buffer_clear(0);
        dll39_write_byte(5,0);
        dll39_write_string(argument0,0);
        dll39_write_string(argument1,0);
        dll39_message_send(conn.server,0,0,0);
    break;
    
    case 'nm': //name
        dll39_buffer_clear(0);
        dll39_write_byte(5,0);
        dll39_write_string(argument0,0);
        dll39_write_string(argument1,0);
        dll39_message_send(conn.server,0,0,0);
    break;
}
