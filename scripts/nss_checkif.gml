___negative=0; __val=string_convert_tovar(elvar[argument0]); //notcen_add('',"before '"+elvar[argument0]+"' and after '"+__val+"' ");
__elval=string_convert_tovar(elval[argument0]);
if (elvar[argument0]!="") {switch (elact[argument0]) {
    case "=": if (elisstring[argument0]) {//notcen_add(''," '"+__val+"' and '"+__elval+"' ");
            if (!argument1) {_ifpass=(string(__val) == string(__elval));} else {_ifpass=(string(__val) != string(__elval));}}
        else {drelement_its_real(); if (!argument1) {_ifpass=((__val) == (__elval));} else {_ifpass=((__val) != (__elval));}} break;
    case "==": if (elisstring[argument0]) {
            if (!argument1) {_ifpass=(string(__val) == string(__elval));} else {_ifpass=(string(__val) != string(__elval));}}
        else {drelement_its_real(); if (!argument1) {_ifpass=((__val) == (__elval));} else {_ifpass=((__val) != (__elval));}} break;
    case ">=": drelement_its_real(); if (!argument1) {_ifpass=(real(__val) >= real(__elval));} else {_ifpass=(real(__val) < real(__elval));} break;
    case "<=": drelement_its_real(); if (!argument1) {_ifpass=(real(__val) <= real(__elval));} else {_ifpass=(real(__val) > real(__elval));} break;
    case "<": drelement_its_real(); if (!argument1) {_ifpass=(real(__val) < real(__elval));} else {_ifpass=(real(__val) >= real(__elval));} break;
    case ">": drelement_its_real(); if (!argument1) {_ifpass=(real(__val) > real(__elval));} else {_ifpass=(real(__val) <= real(__elval));} break;
    case "!=": if (elisstring[argument0]) {
            if (argument1) {_ifpass=(string(__val) == string(__elval));} else {_ifpass=(string(__val) != string(__elval));}}
        else {drelement_its_real(); if (argument1) {_ifpass=((__val) == (__elval));} else {_ifpass=((__val) != (__elval));}} break;
    default: if (!elisstring[argument0]) {
        if (___negative) {__val=string_convert_topos(__val);
        if (argument1) {_ifpass=real(__val)<=0;} else {_ifpass=real(__val)>0;}} else {__val=string_convert_topos(__val);
        if (argument1) {_ifpass=real(__val)<=0;} else {_ifpass=real(__val)>0;}}} break;}} return _ifpass;
