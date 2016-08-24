switch (argument0) {
    case 'fa_top': return fa_top; break;
    case 'fa_middle': return fa_middle; break;
    case 'fa_bottom': return fa_bottom; break;
    case 'top': return fa_top; break;
    case 'middle': return fa_middle; break;
    case 'center': return fa_middle; break;
    case 'bottom': return fa_bottom; break;
    case '-1': return fa_top; break;
    case '0': return fa_middle; break;
    case '1': return fa_bottom; break;
    default: return fa_middle; break;
}
