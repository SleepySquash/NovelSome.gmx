switch (argument0) {
    case 'fa_left': return fa_left; break;
    case 'fa_center': return fa_center; break;
    case 'fa_right': return fa_right; break;
    case 'left': return fa_left; break;
    case 'center': return fa_center; break;
    case 'middle': return fa_center; break;
    case 'right': return fa_right; break;
    case '-1': return fa_left; break;
    case '0': return fa_center; break;
    case '1': return fa_right; break;
    default: return fa_center; break;
}
