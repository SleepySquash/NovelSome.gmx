rfull=0; if (argument0==0) {bfull=0; if (instance_exists(global.dialog)) {
    if (!global.dialog.dest) {bfull=global.dialog.fullSize;}}
rfull=(bfull && dialfull); if (!rfull || dialclear) {dialog_start();}}

with(global.dialog) {
    if (!other.dialfull) {diagcount+=1;}
    actor[argument0] = argument1; dialClear=other.dialclear;
    speaker[argument0] = argument2; dialTNoFadeout=other.dialtnfot;
    is_question[argument0] = 0;
    is_transfer[argument0] = -1;
    dclrcnt[argument0] = 0; dtextself[argument0]=1;
    if (other.dialfull && other.rfull && !other.dialclear) {iclrstart=string_length(dialog[argument0]); dialog[argument0]=dialog[argument0]+string(argument3); roleDone=0;} else {
        dialog[argument0] = string(argument3); iclrstart=1;} if (!other.dialfull || !other.dialclear) {stopcount=0; clrcnt=0; stopcurrent=0;}
    clrdone=0; while (!clrdone) {catch=0; catchclr=""; for (iclr=iclrstart;iclr<string_length(dialog[argument0]);iclr+=1) {
        if (string_copy(dialog[argument0],iclr,1)=="@") {if (string_copy(dialog[argument0],iclr+1,string_length("stop"))=="stop") {catch=1; catchclr="@stop"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("red"))=="red") {catch=1; convclr=c_red; catchclr="@red"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("black"))=="black") {catch=1; convclr=c_black; catchclr="@black"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("green"))=="green") {catch=1; convclr=c_green; catchclr="@green"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("purple"))=="purple") {catch=1; convclr=c_purple; catchclr="@purple"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("aqua"))=="aqua") {catch=1; convclr=c_aqua; catchclr="@aqua"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("blue"))=="blue") {catch=1; convclr=c_blue; catchclr="@blue"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("yellow"))=="yellow") {catch=1; convclr=c_yellow; catchclr="@yellow"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("maroon"))=="maroon") {catch=1; convclr=c_maroon; catchclr="@maroon"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("orange"))=="orange") {catch=1; convclr=c_orange; catchclr="@orange"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("dkgray"))=="dkgray") {catch=1; convclr=c_dkgray; catchclr="@dkgray"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("fuchsia"))=="fuchsia") {catch=1; convclr=c_fuchsia; catchclr="@fuchsia"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("gray"))=="gray") {catch=1; convclr=c_gray; catchclr="@gray"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("lime"))=="lime") {catch=1; convclr=c_lime; catchclr="@lime"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("ltgray"))=="ltgray") {catch=1; convclr=c_ltgray; catchclr="@ltgray"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("navy"))=="navy") {catch=1; convclr=c_navy; catchclr="@navy"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("olive"))=="olive") {catch=1; convclr=c_olive; catchclr="@olive"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("silver"))=="silver") {catch=1; convclr=c_silver; catchclr="@silver"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("teal"))=="teal") {catch=1; convclr=c_teal; catchclr="@teal"; break;}
            else if (string_copy(dialog[argument0],iclr+1,string_length("white"))=="white") {catch=1; convclr=c_white; catchclr="@white"; break;}}}
        if (catch) {if (catchclr!="@stop") {dclrstart[argument0,dclrcnt[argument0]]=iclr; dclrself[argument0,dclrcnt[argument0]]=convclr; if (iclr==1) {dtextself[argument0]=0;}
            dclrend[argument0,dclrcnt[argument0]]=0; if (dclrcnt[argument0]>0) {dclrend[argument0,dclrcnt[argument0]-1]=iclr-1;} dclrcnt[argument0]+=1;
            if (iclr!=1) {dialog[argument0]=string_copy(dialog[argument0],1,iclr-1)+string_copy(dialog[argument0],iclr+string_length(catchclr),string_length(dialog[argument0])-iclr+1-string_length(catchclr));
            } else {dialog[argument0]=string_copy(dialog[argument0],string_length(catchclr)+1,string_length(dialog[argument0])-string_length(catchclr));}}
        else {istop[stopcount]=iclr-1; stopcount+=1; dialog[argument0]=string_replace(dialog[argument0],"@stop","");}}
        if (iclr>=string_length(dialog[argument0])) {clrdone=1;}}
    if (other.dialfull && other.rfull && !other.dialclear) {trBack_add(+'"'+string(dialog[argument0])+'"');
        /*dialog[argument0]=bfdialog+dialog[argument0];*/} exists[argument0] = 1;
    actorclr[argument0] = c_yellow;
    actoroutclr[argument0] = c_black;}
