if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("far"))=="far") {dist="far";}
else if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("close"))=="close") {dist="close";}
else if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("normal"))=="normal") {dist="normal";}
else if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("custom"))=="custom") {dist="custom";}
else if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("xrev"))=="xrev") {xrev=-1;}
else if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("yrev"))=="yrev") {yrev=-1;}
else if (string_copy(fstr,string_length("show char ")+string_length(chnum)+1,string_length("xyrev"))=="xyrev") {xrev=-1; yrev=-1;}
if (string_length(fstr)>=string_length("show char  ")+string_length(chnum)+1+string_length(dist)) {
    if (string_copy(fstr,string_length("show char  ")+string_length(dist)+string_length(chnum)+1,string_length("left"))=="left") {pos="left";}
    else if (string_copy(fstr,string_length("show char  ")+string_length(dist)+string_length(chnum)+1,string_length("right"))=="right") {pos="right";}
    else if (string_copy(fstr,string_length("show char  ")+string_length(dist)+string_length(chnum)+1,string_length("cright"))=="cright") {pos="cright";}
    else if (string_copy(fstr,string_length("show char  ")+string_length(dist)+string_length(chnum)+1,string_length("cleft"))=="cleft") {pos="cleft";}
    else if (string_copy(fstr,string_length("show char  ")+string_length(dist)+string_length(chnum)+1,string_length("center"))=="center") {pos="center";}
    else if (string_copy(fstr,string_length("show char  ")+string_length(dist)+string_length(chnum)+1,string_length("custom"))=="custom") {pos="custom";}
    if (string_length(fstr)>=string_length("show char   ")+string_length(chnum)+1+string_length(dist)+string_length(pos)) {
        if (string_copy(fstr,string_length("show char   ")+string_length(dist)+string_length(chnum)+string_length(pos)+1,string_length("xrev"))=="xrev") {xrev=-1;}
        if (string_copy(fstr,string_length("show char   ")+string_length(dist)+string_length(chnum)+string_length(pos)+1,string_length("yrev"))=="yrev") {yrev=-1;}
        if (string_copy(fstr,string_length("show char   ")+string_length(dist)+string_length(chnum)+string_length(pos)+1,string_length("xyrev"))=="xyrev") {xrev=-1; yrev=-1;}}}
        
        
        
if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("far"))=="far") {dist="far";}
else if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("close"))=="close") {dist="close";}
else if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("normal"))=="normal") {dist="normal";}
else if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("custom"))=="custom") {dist="custom";}
else if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("xrev"))=="xrev") {xrev=-1;}
else if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("yrev"))=="yrev") {yrev=-1;}
else if (string_copy(fstr,string_length("show  ")+string_length(chname)+1,string_length("xyrev"))=="xyrev") {xrev=-1; yrev=-1;}
if (string_length(fstr)>=string_length("show   ")+string_length(chname)+1+string_length(dist)) {
    if (string_copy(fstr,string_length("show   ")+string_length(dist)+string_length(chname)+1,string_length("left"))=="left") {pos="left";}
    else if (string_copy(fstr,string_length("show   ")+string_length(dist)+string_length(chname)+1,string_length("right"))=="right") {pos="right";}
    else if (string_copy(fstr,string_length("show   ")+string_length(dist)+string_length(chname)+1,string_length("cright"))=="cright") {pos="cright";}
    else if (string_copy(fstr,string_length("show   ")+string_length(dist)+string_length(chname)+1,string_length("cleft"))=="cleft") {pos="cleft";}
    else if (string_copy(fstr,string_length("show   ")+string_length(dist)+string_length(chname)+1,string_length("center"))=="center") {pos="center";}
    else if (string_copy(fstr,string_length("show   ")+string_length(dist)+string_length(chname)+1,string_length("custom"))=="custom") {pos="custom";}
    if (string_length(fstr)>=string_length("show    ")+string_length(chname)+1+string_length(dist)+string_length(pos)) {
        if (string_copy(fstr,string_length("show    ")+string_length(dist)+string_length(chname)+string_length(pos)+1,string_length("xrev"))=="xrev") {xrev=-1;}
        if (string_copy(fstr,string_length("show    ")+string_length(dist)+string_length(chname)+string_length(pos)+1,string_length("yrev"))=="yrev") {yrev=-1;}
        if (string_copy(fstr,string_length("show    ")+string_length(dist)+string_length(chname)+string_length(pos)+1,string_length("xyrev"))=="xyrev") {xrev=-1; yrev=-1;}}}
