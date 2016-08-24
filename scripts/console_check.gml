global.commandWriting_id = global.typingObject;
if (command_check(argument0,'menu')) {game_deinit(); room_goto(room_menu);}

else if (command_check_simple(argument0,'fullscreen set')) {number=command_get_real(argument0); window_set_fullscreen(number);}

else if (command_check(argument0,'oldmenu')) {global.oldMenu=!global.oldMenu;}
else if (command_check(argument0,'spawn player')) {if (!instance_exists(objPlayer)) {_a=instance_create(obj3DCamera.x,obj3DCamera.y,objPlayer);
    _a.z = obj3DCamera.z; obj3DCamera.follow = _a; obj3DCamera.moveMouse = 0; obj3DCamera.canView = 1;}}
else if (command_check(argument0,'xy mouse')) {gameDebug.checkMousePos=!gameDebug.checkMousePos;}

else if (command_check(argument0,'reconnect')) {if (instance_exists(social)) {with (social) {timeToDisconnect=380;}}
    else {instance_create(0,0,social);}}

else if (command_check_simple(argument0,'sid')) {cmd=command_get_subcommand(argument0); global.socialip=cmd; global.ftpip=global.socialip;}
else if (command_check(argument0,'gates')) {global.gatesEnabled=!global.gatesEnabled; if (global.gatesEnabled) {
    if (!instance_exists(social)) {instance_create(0,0,social);}} else {if (instance_exists(social)) {with (social) {timeToDisconnect=380;}}}}

else if (command_check(argument0,'uid')) {with (objGUI_chat) {chat_add("Your UID: "+string(global.socialid));}}
else if (command_check(argument0,'d')) {global.debug=!global.debug;}
else if (command_check(argument0,'nd')) {global.ndebug=!global.ndebug;}

else {command_unknown("");}
