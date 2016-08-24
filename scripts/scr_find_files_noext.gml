fcount=1; afcount=0; fscanned=0; curfol=""; lfolder[0]="";
while (fscanned<fcount) {_somefile=file_find_first(argument0+curfol+"*",fa_directory);
    while (_somefile!="") {if (directory_exists(argument0+curfol+_somefile+"\")) {
        lfolder[fcount]=curfol+_somefile+"\"; fcount+=1;} else {lfile[afcount]=argument0+curfol+_somefile; afcount+=1;}
        _somefile=file_find_next();} file_find_close(); fscanned+=1; if (fscanned<fcount) {curfol=lfolder[fscanned];}}
for (i=0;i<afcount;i+=1) {ds_list_add(argument1,lfile[i]);}
