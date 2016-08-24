if (!waitingForComplete) {if (inRead_l!=scenario) {if (_file != -1) {file_text_close(_file); _file = -1;
        if (global.debug) {with (objGUI_chat) {chat_add_color("Closing scenario '"+other.inRead_l+"'...",c_gray);}}}
    
    if (filename_ext(scenario) == "") {scenario+=".nsdat";} if (!file_exists(current_directory()+novdat.FolName[novid]+scenario)) {
    if (file_exists(current_directory()+novdat.FolName[novid]+"episodes\"+scenario)) {scenario="episodes\"+scenario;}
    else if (file_exists(current_directory()+novdat.FolName[novid]+"scenario\"+scenario)) {scenario="scenario\"+scenario;}
    else if (file_exists(current_directory()+novdat.FolName[novid]+"scenarios\"+scenario)) {scenario="scenarios\"+scenario;}
    else if (file_exists(current_directory()+novdat.FolName[novid]+"script\"+scenario)) {scenario="script\"+scenario;}
    else if (file_exists(current_directory()+novdat.FolName[novid]+"scripts\"+scenario)) {scenario="scripts\"+scenario;}}
    inRead_l=scenario;
    
    inRead=current_directory()+novdat.FolName[novid]+inRead_l; progress=0;
    if (global.debug) {with (objGUI_chat) {chat_add_color("Opening scenario '"+other.inRead_l+"'...",c_gray);}}
    if (global.debug) {with (objGUI_chat) {chat_add_color("Directory: '...\"+novdat.FolName[other.novid]+other.inRead_l+"'.",c_gray);}}
    if (file_exists(inRead)) {_file=file_text_open_read(inRead); ds_map_clear(ifline); ds_list_clear(ifs); if (_file == -1) {
            notcen_add("E","Scenario doesn't exists."); game_deinit(); if (!global.isTesting) {room_goto(global.lRMenu);}
            else {global.nEDid=novid; global.isNExists=novid; room_goto(room_editor);} instance_destroy(); exit;}
        else {if (global.debug) {with (objGUI_chat) {chat_add_color("Scenario was loaded successfully!",c_gray);}}}
    } else {notcen_add("E","Scenario doesn't exists."); game_deinit(); if (!global.isTesting) {room_goto(global.lRMenu);}
        else {global.nEDid=novid; global.isNExists=novid; room_goto(room_editor);} instance_destroy(); exit;}}}
