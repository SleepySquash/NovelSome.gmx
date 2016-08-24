if (isHoverAdding==0) {gts=get_string("Реплика: ",""); if (gts!="") {
    ds_list_insert(tpSList,i,'"'+string(gts)+'"'); sChanged=1; ds_list_insert(tpSChanList,i,1); iSel=i;}}
if (isHoverAdding==1) {file=get_open_filename_ext("Image files|*.png;*.jpg;*.nsback","",FS_current_directory()+"\Novels\"+tpFolderName+"\","Background selection"); if (file!="") {if (FS_file_exists(string(file))) {
    if (!FS_directory_exists(FS_current_directory()+"\Novels\"+tpFolderName+"\")) {ns_directory_create(FS_current_directory()+"\Novels\"+tpFolderName+"\");}
    finame=filename_name(string(file)); fipath=filename_path(string(file)); if (string_copy(fipath,1,string_length(FS_current_directory()+"\Novels\"+tpFolderName+"\"))==FS_current_directory()+"\Novels\"+tpFolderName+"\") {
        ds_list_insert(tpSList,i,"background "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
    else if (string_copy(fipath,1,string_length(FS_current_directory()+"\Stuff"))==FS_current_directory()+"\Stuff") {
        ds_list_insert(tpSList,i,"background "+string_copy(fipath,string_length(FS_current_directory()+"\")+1,string_length(fipath)-string_length(FS_current_directory()+"\"))+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);} else {
    /*fname=check_for_nonASCII(string(file));*/ fname=""; if (string(fname)!=string(file) && fname!="") {notcen_add("E",lang.the_game_doesnt_support_nonascii);} else {
    ns_file_copy(string(file),FS_current_directory()+"\Novels\"+tpFolderName+"\"+finame); iSel=i; ds_list_insert(tpSList,i,"background "+finame); sChanged=1; ds_list_insert(tpSChanList,i,1);}}}}}
if (isHoverAdding==2) {ds_list_insert(tpSList,i,'background hide'); sChanged=1; iSel=i; ds_list_insert(tpSChanList,i,1);}
if (isHoverAdding==3) {ab=instance_create(0,0,objEd_showPerson); ab.line=i;}
if (isHoverAdding==7) {file=get_open_filename_ext("Audio files|*.ogg","",FS_current_directory()+"\Novels\"+tpFolderName+"\","Audio selection"); if (file!="") {if (FS_file_exists(string(file))) {
    if (!FS_directory_exists(FS_current_directory()+"\Novels\"+tpFolderName+"\")) {ns_directory_create(FS_current_directory()+"\Novels\"+tpFolderName+"\");}
    finame=filename_name(string(file)); fipath=filename_path(string(file)); if (string_copy(fipath,1,string_length(FS_current_directory()+"\Novels\"+tpFolderName+"\"))==FS_current_directory()+"\Novels\"+tpFolderName+"\") {
        ds_list_insert(tpSList,i,"music "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
    else if (string_copy(fipath,1,string_length(FS_current_directory()+"\Stuff"))==FS_current_directory()+"\Stuff") {
        ds_list_insert(tpSList,i,"music "+string_copy(fipath,string_length(FS_current_directory()+"\")+1,string_length(fipath)-string_length(FS_current_directory()+"\"))+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);} else {
    /*fname=check_for_nonASCII(string(file));*/ fname=""; if (string(fname)!=string(file) && fname!="") {notcen_add("E",lang.the_game_doesnt_support_nonascii);} else {
    ns_file_copy(string(file),FS_current_directory()+"\Novels\"+tpFolderName+"\"+finame); ds_list_insert(tpSList,i,"music "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}}}}}
if (isHoverAdding==8) {ds_list_insert(tpSList,i,'music stop'); sChanged=1; ds_list_insert(tpSChanList,i,1);}
if (isHoverAdding==9) {file=get_open_filename_ext("Audio files|*.ogg","",FS_current_directory()+"\Novels\"+tpFolderName+"\","Audio selection"); if (file!="") {if (FS_file_exists(string(file))) {
    if (!FS_directory_exists(FS_current_directory()+"\Novels\"+tpFolderName+"\")) {ns_directory_create(FS_current_directory()+"\Novels\"+tpFolderName+"\");}
    finame=filename_name(string(file)); fipath=filename_path(string(file)); if (string_copy(fipath,1,string_length(FS_current_directory()+"\Novels\"+tpFolderName+"\"))==FS_current_directory()+"\Novels\"+tpFolderName+"\") {
        ds_list_insert(tpSList,i,"sound "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
    else if (string_copy(fipath,1,string_length(FS_current_directory()+"\Stuff"))==FS_current_directory()+"\Stuff") {
        ds_list_insert(tpSList,i,"sound "+string_copy(fipath,string_length(FS_current_directory()+"\")+1,string_length(fipath)-string_length(FS_current_directory()+"\"))+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);} else {
    /*fname=check_for_nonASCII(string(file));*/ fname=""; if (string(fname)!=string(file) && fname!="") {notcen_add("E",lang.the_game_doesnt_support_nonascii);} else {
    ns_file_copy(string(file),FS_current_directory()+"\Novels\"+tpFolderName+"\"+finame); ds_list_insert(tpSList,i,"sound "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}}}}}
if (isHoverAdding==10) {ds_list_insert(tpSList,i,'sound stop'); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
if (isHoverAdding==11) {file=get_open_filename_ext("Audio files|*.ogg","",FS_current_directory()+"\Novels\"+tpFolderName+"\","Audio selection"); if (file!="") {if (FS_file_exists(string(file))) {
    if (!FS_directory_exists(FS_current_directory()+"\Novels\"+tpFolderName+"\")) {ns_directory_create(FS_current_directory()+"\Novels\"+tpFolderName+"\");}
    finame=filename_name(string(file)); fipath=filename_path(string(file)); if (string_copy(fipath,1,string_length(FS_current_directory()+"\Novels\"+tpFolderName+"\"))==FS_current_directory()+"\Novels\"+tpFolderName+"\") {
        ds_list_insert(tpSList,i,"ambient "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
    else if (string_copy(fipath,1,string_length(FS_current_directory()+"\Stuff"))==FS_current_directory()+"\Stuff") {
        ds_list_insert(tpSList,i,"ambient "+string_copy(fipath,string_length(FS_current_directory()+"\")+1,string_length(fipath)-string_length(FS_current_directory()+"\"))+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);} else {
    /*fname=check_for_nonASCII(string(file));*/ fname=""; if (string(fname)!=string(file) && fname!="") {notcen_add("E",lang.the_game_doesnt_support_nonascii);} else {
    ns_file_copy(string(file),FS_current_directory()+"\Novels\"+tpFolderName+"\"+finame); ds_list_insert(tpSList,i,"ambient "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}}}}}
if (isHoverAdding==12) {ds_list_insert(tpSList,i,'ambient stop'); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
if (isHoverAdding==14) {file=get_open_filename_ext("Scenario files|*.nsdat","",FS_current_directory()+"\Novels\"+tpFolderName+"\","Scenario jumpTo selection"); if (file!="") {if (FS_file_exists(string(file))) {
    if (!FS_directory_exists(FS_current_directory()+"\Novels\"+tpFolderName+"\")) {ns_directory_create(FS_current_directory()+"\Novels\"+tpFolderName+"\");}
    finame=filename_name(string(file)); fipath=filename_path(string(file)); if (string_copy(fipath,1,string_length(FS_current_directory()+"\Novels\"+tpFolderName+"\"))==FS_current_directory()+"\Novels\"+tpFolderName+"\") {
        ds_list_insert(tpSList,i,"jump "+finame); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);} else {
    /*fname=check_for_nonASCII(string(file));*/ fname=""; if (string(fname)!=string(file) && fname!="") {notcen_add("E",lang.the_game_doesnt_support_nonascii);} else {
    ns_file_copy(string(file),FS_current_directory()+"\Novels\"+tpFolderName+"\"+finame); iSel=i; ds_list_insert(tpSList,i,"jump "+finame); sChanged=1; ds_list_insert(tpSChanList,i,1);}}}}}
if (isHoverAdding==17) {gts=get_string("Сколько секунд (десятичные дроби разрешены)?",""); if (string_digits(gts)!="") {
    ds_list_insert(tpSList,i,'wait '+string(abs(real(gts)*30))); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}}
if (isHoverAdding==19) {gts=get_string("Мысли: ",""); if (gts!="") {
    ds_list_insert(tpSList,i,'"~'+string(gts)+'~"'); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}}
if (isHoverAdding==24) {ds_list_insert(tpSList,i,'dead end'); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
if (isHoverAdding==25) {ds_list_insert(tpSList,i,'start again'); iSel=i; sChanged=1; ds_list_insert(tpSChanList,i,1);}
if (isHoverAdding==26) {ds_list_insert(tpSChanList,i,1); ds_list_insert(tpSList,i,ds_list_find_value(tpSList,hoverid)); sChanged=1;
    hafid=hoverid; if (hoverid>i) {if (iSel!=-1) {iSel=i;} hafid=hoverid+1;} else {if (iSel!=-1) {iSel=i-1;}} ds_list_delete(tpSList,hafid); ds_list_delete(tpSChanList,hafid);}
if (isHoverAdding==27) {ab=instance_create(0,0,objEd_choose); ab.line=i;}
mouse_clear(mb_left); shMenu=0; isHoverAdding=-1; if (ds_list_size(tpSList)==2) {for (ids=0;ids<ds_list_size(tpSList);ids+=1) {
    if (ds_list_find_value(tpSList,ids)==" ") {ds_list_delete(tpSList,ids); ds_list_delete(tpSChanList,ids);}}}

/*if (isHoverAdding==0) {gts=get_string("Реплика: ",""); if (gts!="") {
    ds_list_insert(tpSList,i,'"'+string(gts)+'"'); sChanged=1; ds_list_insert(tpSChanList,i,1);}} if (isHoverAdding==1) {file=get_open_filename_ext("Image files|*.png;*.jpg","",FS_current_directory()+"\Novels\"+tpFolderName+"\","Background selection"); if (file!="") {if (FS_file_exists(string(file))) {
    if (!FS_directory_exists(FS_current_directory()+"\Novels\"+tpFolderName+"\")) {ns_directory_create(FS_current_directory()+"\Novels\"+tpFolderName+"\");}
    finame=filename_name(string(file)); fipath=filename_path(string(file)); if (string_copy(fipath,1,string_length(FS_current_directory()+"\Novels\"+tpFolderName+"\"))==FS_current_directory()+"\Novels\"+tpFolderName+"\") {
        ds_list_insert(tpSList,i,"background "+finame); sChanged=1; ds_list_insert(tpSChanList,i,1);}
    else if (string_copy(fipath,1,string_length(FS_current_directory()+"\Stuff"))==FS_current_directory()+"\Stuff") {
        ds_list_insert(tpSList,i,"background "+string_copy(fipath,string_length(FS_current_directory()+"\")+1,string_length(fipath)-string_length(FS_current_directory()+"\"))+finame); sChanged=1; ds_list_insert(tpSChanList,i,1);} else {
    fname=check_for_nonASCII(string(file)); if (string(fname)!=string(file) && fname!="") {notcen_add("E",lang.the_game_doesnt_support_nonascii);} else {
    FS_file_copy(string(file),FS_current_directory()+"\Novels\"+tpFolderName+"\"+finame); ds_list_insert(tpSList,i,"background "+finame); sChanged=1; ds_list_insert(tpSChanList,i,1);}}}}}
mouse_clear(mb_left); isHoverAdding=-1; if (ds_list_size(tpSList)==2) {for (ids=0;ids<ds_list_size(tpSList);ids+=1) {
    if (ds_list_find_value(tpSList,ids)==" ") {ds_list_delete(tpSList,ids); ds_list_delete(tpSChanList,ids);}}}
