if (!instance_exists(novel)) {exit;}
global.mHUD=0; _isSkipping=0; _ifcount=0; for (hudi=0;hudi<elCount[elCPage];hudi+=1) {
    draw_set_alpha(alpha); drelement_draw(elCPage,hudi);
    /*if (element[elCPage,hudi]=="end") {_ifcount-=1; if (_isSkipping>0) {_isSkipping-=1;}}
    _pass=!_isSkipping; if (element[elCPage,hudi]=="if") {_ifcount+=1; _pass=0;
        if (_isSkipping>0) {_isSkipping+=1;} else {__val = ds_map_find_value(novel.bools,elvar[elCPage,hudi]);
        if (is_undefined(__val)) {__val = ds_map_find_value(novel.integers,elvar[elCPage,hudi]);
            if (is_undefined(__val)) {__val = ds_map_find_value(novel.strings,elvar[elCPage,hudi]);}}
        if (!is_undefined(__val)) {switch (elact[elCPage,hudi]) {
            case "=": _pass=(string(__val) == elval[elCPage,hudi]); break;
            case "==": _pass=(string(__val) == elval[elCPage,hudi]); break;
            case ">=": _pass=(__val >= real(elval[elCPage,hudi])); break;
            case "<=": _pass=(__val <= real(elval[elCPage,hudi])); break;
            case "<": _pass=(__val < real(elval[elCPage,hudi])); break;
            case ">": _pass=(__val > real(elval[elCPage,hudi])); break;
            case "!=": _pass=(string(__val) != string(elval[elCPage,hudi])); break;
            default: break;}} if (!_pass) {_isSkipping+=1;}}}
    if (_pass) {draw_hudelement(elCPage,hudi);}*/} ds_list_clear(__ifs);
