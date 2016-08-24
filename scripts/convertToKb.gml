switch (argument0) {
    case 'enter': return vk_enter; break;
    case 'vk_enter': return vk_enter; break;
    case 'up': return vk_up; break;
    case 'vk_up': return vk_up; break;
    case 'down': return vk_down; break;
    case 'vk_down': return vk_down; break;
    case 'left': return vk_left; break;
    case 'vk_left': return vk_left; break;
    case 'right': return vk_right; break;
    case 'vk_right': return vk_right; break;
    default: return ord(argument0); break;
}
