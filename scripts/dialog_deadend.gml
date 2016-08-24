if (instance_exists(objGUI_dialogue)) {
    with(global.dialog) {
        diagcount+=1;
        actor[argument0] = noone;
        speaker[argument0] = "";
        is_question[argument0] = 0;
        qutype[argument0] = 0;
        is_transfer[argument0] = -1;
        dialog[argument0] = "";
        dclrcnt[argument0] = 0;
        exists[argument0] = 0;}}
