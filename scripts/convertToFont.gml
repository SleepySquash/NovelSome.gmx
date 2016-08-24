if (novid!=-1) {if (instance_exists(novel)) {
    if (ds_map_exists(novel.fonts,argument0)) {return ds_map_find_value(novel.fonts,argument0);}
    else {if (ds_map_exists(novel.links,argument0)) {___value=ds_map_find_value(novel.links,argument0);
        if (ds_map_exists(novel.fonts,___value)) {return ds_map_find_value(novel.fonts,___value);}}}}
if (ds_map_exists(novdat.fonts[novid],argument0)) {return ds_map_find_value(novdat.fonts[novid],argument0);}
else {if (ds_map_exists(novdat.links[novid],argument0)) {___value=ds_map_find_value(novdat.links[novid],argument0);
    if (ds_map_exists(novdat.fonts[novid],___value)) {return ds_map_find_value(novdat.fonts[novid],___value);}}}}
__toreturn = -1; switch (argument0) {
    case 'Franklin16': __toreturn = Neucha16; break;
    case 'Franklin18': __toreturn = Neucha18; break;
    case 'Franklin36': __toreturn = Neucha36; break;
    case 'Arial12': __toreturn = Arial12; break;
    case 'Arial16': __toreturn = Arial16; break;
    case 'Kamelia18': __toreturn = Kamelia18; break;
    case 'Kamelia36': __toreturn = Kamelia36; break;
    case 'LucidaConsole14': __toreturn = LucidaConsole14; break;
    case 'Pacifica12': __toreturn = Pacifica12; break;
    case 'Pacifica16': __toreturn = Pacifica16; break;
    case 'Pacifica19': __toreturn = Pacifica19; break;
    case 'Pacifica21': __toreturn = Pacifica21; break;
    case 'Pacifica28': __toreturn = Pacifica28; break;
    case 'Pacifica39': __toreturn = Pacifica39; break;
    case 'Pacifica54': __toreturn = Pacifica54; break;
    case 'SAO18': __toreturn = SAO18; break;
    case 'SAO30': __toreturn = SAO30; break;
    case 'SAO36': __toreturn = SAO36; break;
    case 'Century32': __toreturn = Century32; break;
    case 'Century20': __toreturn = Century20; break;
    case 'Century16': __toreturn = Century16; break;
    default: __toreturn = -1; break;}
if (__toreturn != -1) {return __toreturn;}
return global.dialTextFont;
