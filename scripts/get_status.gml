if (!instance_exists(social)) {return ""; exit;}
switch (argument0) {
    case 0: return lang.status_user; break;
    case 1: return lang.status_reader; break;
    case 2: return lang.status_writer; break;
    case 3: return lang.status_redactor; break;
    case 4: return lang.status_moderator; break;
    case 5: return lang.status_devteam; break;
    default: return ""; break;}
