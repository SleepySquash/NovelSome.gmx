if (string_length(string(current_month))>1) {mt=string(current_month);} else {mt="0"+string(current_month);}
if (string_length(string(current_day))>1) {dt=string(current_day);} else {dt="0"+string(current_day);}
if (string_length(string(current_hour))>1) {ht=string(current_hour);} else {ht="0"+string(current_hour);}
if (string_length(string(current_minute))>1) {mmt=string(current_minute);} else {mmt="0"+string(current_minute);}
if (string_length(string(current_second))>1) {st=string(current_second);} else {st="0"+string(current_second);}
return real(string(current_year)+string(mt)+string(dt)+string(ht)+string(mmt)+string(st));
