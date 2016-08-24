___negative=0; __val=string_convert_tovar(elvar[argument0,argument1]);
__elval=string_convert_tovar(elval[argument0,argument1]);
if (elvar[argument0,argument1]!="") {switch (elact[argument0,argument1]) {
    case "=": if (elisstring[argument0,argument1]) {
            if (!argument2) {_pass=(string(__val) == string(__elval));} else {_pass=(string(__val) != string(__elval));}}
        else {drelement_its_real(); if (!argument2) {_pass=((__val) == (__elval));} else {_pass=((__val) != (__elval));}} break;
    case "==": if (elisstring[argument0,argument1]) {
            if (!argument2) {_pass=(string(__val) == string(__elval));} else {_pass=(string(__val) != string(__elval));}}
        else {drelement_its_real(); if (!argument2) {_pass=((__val) == (__elval));} else {_pass=((__val) != (__elval));}} break;
    case ">=": drelement_its_real(); if (!argument2) {_pass=(real(__val) >= real(__elval));} else {_pass=(real(__val) < real(__elval));} break;
    case "<=": drelement_its_real(); if (!argument2) {_pass=(real(__val) <= real(__elval));} else {_pass=(real(__val) > real(__elval));} break;
    case "<": drelement_its_real(); if (!argument2) {_pass=(real(__val) < real(__elval));} else {_pass=(real(__val) >= real(__elval));} break;
    case ">": drelement_its_real(); if (!argument2) {_pass=(real(__val) > real(__elval));} else {_pass=(real(__val) <= real(__elval));} break;
    case "!=": if (elisstring[argument0,argument1]) {
            if (argument2) {_pass=(string(__val) == string(__elval));} else {_pass=(string(__val) != string(__elval));}}
        else {drelement_its_real(); if (argument2) {_pass=((__val) == (__elval));} else {_pass=((__val) != (__elval));}} break;
    default: if (!elisstring[argument0,argument1]) {
        if (___negative) {__val=string_convert_topos(__val);
        if (argument2) {_pass=real(__val)<=0;} else {_pass=real(__val)>0;}} else {__val=string_convert_topos(__val);
        if (argument2) {_pass=real(__val)<=0;} else {_pass=real(__val)>0;}}} break;}} return _pass;
