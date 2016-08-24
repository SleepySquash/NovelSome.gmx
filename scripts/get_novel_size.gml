if (abs(argument0)==0) {return "";}
else {if (abs(argument0)<10500) {return string(abs(argument0))+" ["+lang.sketch+"]";}
    else if (abs(argument0)<26000) {return string(abs(argument0))+" ["+lang.small+"]";}
    else if (abs(argument0)<53000) {return string(abs(argument0))+" ["+lang.medium+"]";}
    else if (abs(argument0)<85000) {return string(abs(argument0))+" ["+lang.big+"]";}
    else if (abs(argument0)<115000) {return string(abs(argument0))+" ["+lang.large+"]";}
    else if (abs(argument0)<168000) {return string(abs(argument0))+" ["+lang.extremly_large+"]";}
    else {return string(abs(argument0))+" [IT'S OVER 9000]";}}
