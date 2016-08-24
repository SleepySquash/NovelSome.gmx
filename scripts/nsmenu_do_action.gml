if (global.inGame && object_index!=objGUI_ingame) {if (global.gamePause || global.trBack) {exit;}}

nsmenu_switch_action(argument0,argument1,elaction[argument0,argument1]);
//if (object_index!=objHUD) {exit;}
//nsmenu_switch_action(argument0,argument1,elaction_1[argument0,argument1],elaction1_1[argument0,argument1]);
//nsmenu_switch_action(argument0,argument1,elaction_2[argument0,argument1],elaction1_2[argument0,argument1]);
//nsmenu_switch_action(argument0,argument1,elaction_3[argument0,argument1],elaction1_3[argument0,argument1]);

/*switch (elaction[argument0,argument1]) {case "play": global.isTesting=0; if (elscen[argument0,argument1]!="") {
        game_init_ext(novid,elscen[argument0,argument1]);} else {game_init(novid);} break;
    case "jumpto": if (elscen[argument0,argument1]!="") {
        if (instance_exists(novel)) {novel.scenario = elscen[argument0,argument1];}} break;
    case "load": for (ii=1;ii<=global.savCount;ii+=1) {if (sprite_exists(thspr[ii])) {sprite_delete(thspr[ii]);}} trTo=1; break;
    case "edit": goToEditor=1; global.nEDid=novid; global.isNExists=novid; break;
    case "exit": game_end(); break;
    case "options": trTo=3; break;
    case "language": trTo=4; break;
    case "page": elCPage=elaction1[argument0,argument1]; break;
    case "spage": trTo=5; elTPage=elaction1[argument0,argument1]; break;}
