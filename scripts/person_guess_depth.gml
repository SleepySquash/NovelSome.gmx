__guess_guessed=0; switch (_dset) {
    case "far": __guess_guessed=1; return -90; break;
    case "normal": __guess_guessed=1; return -100; break;
    case "close": __guess_guessed=1; return -110; break;
    case "f": __guess_guessed=1; return -90; break;
    case "n": __guess_guessed=1; return -100; break;
    case "c": __guess_guessed=1; return -110; break;
    case "back": __guess_guessed=1; return 0; break;
    case "b": __guess_guessed=1; return 0; break;
    default: return string_convert_topos(string_convert_standartph_string_depth(_dset)); break;}
