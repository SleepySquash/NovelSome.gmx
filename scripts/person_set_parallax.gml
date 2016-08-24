switch (sprState) {
    case "far": return global.charOMove_f; break;
    case "normal": return global.charOMove_n; break;
    case "close": return global.charOMove_c; break;
    default: return 0.01; break;}
