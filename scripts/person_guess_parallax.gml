__guess_guessed=0; switch (_pset) {
    case "far": __guess_guessed=1; return global.charOMove_f; break;
    case "normal": __guess_guessed=1; return global.charOMove_n; break;
    case "close": __guess_guessed=1; return global.charOMove_c; break;
    case "f": __guess_guessed=1; return global.charOMove_f; break;
    case "n": __guess_guessed=1; return global.charOMove_n; break;
    case "c": __guess_guessed=1; return global.charOMove_c; break;
    case "back": __guess_guessed=1; return global.backOMove; break;
    case "b": __guess_guessed=1; return global.backOMove; break;
    default: return string_convert_topos(string_convert_standartph_string_parallax(_pset)); break;}
