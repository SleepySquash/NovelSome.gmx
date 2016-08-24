    if (!moveMouse) {__pass=1; if (instance_exists(follow)) {if (follow.object_index == objPlayer) {__pass = follow.doingView;}}
        if (__pass) {display_w=display_get_width(); display_h=display_get_height();
        
        change_x=(display_mouse_get_x()-display_w/2)/5;
        change_y=(display_mouse_get_y()-display_h/2)/5;
        
        display_mouse_set(display_w/2,display_h/2);} else {change_x=0; change_y=0;}}
    else {change_x=0; change_y=0;
        display_w=display_get_width();
        display_h=display_get_height();
        
        if (mouse_check_button_pressed(mb_right)) {_mx = display_mouse_get_x(); _my = display_mouse_get_y();}
        if (mouse_check_button(mb_right)) {change_x=(display_mouse_get_x()-_mx)/5;
            change_y=(display_mouse_get_y()-_my)/5;
        if (change_x!=0 || change_y!=0) {objGUI_ingame.__x = -1; objGUI_ingame.__y = -1;}
            display_mouse_set(_mx,_my);} else {
        if (mouse_x<view_xview+80) {change_x=-2;}
        if (mouse_x>view_xview+view_wview-80) {change_x=2;}
        if (mouse_y<view_yview+80) {change_y=-2;}
        if (mouse_y>view_yview+view_hview-80) {change_y=2;}}}
    
    direction -= change_x
    pitch -= change_y
