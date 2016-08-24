nsmenu_switch_action(-1,-1,action);
/*switch (action) {case "jumpto": if (scenario!="") {if (instance_exists(objSNv_wait)) {with (objSNv_wait) {instance_destroy();}}
        if (instance_exists(novel)) {if (novel.scenario == scenario) {novel.inRead_l="";} else {novel.scenario = scenario;}}} break;
    case "pause": global.gamePause = 1; break;
    case "exit": game_end(); break;
    case "menu": with (novel) {if (file_exists(inRead)) {file_text_close(inRead_R);} game_deinit();
        if (!global.isTesting) {room_goto(global.lRMenu);} else {global.nEDid=novid; global.isNExists=novid; room_goto(room_editor);}
        instance_destroy();} break;}*/
