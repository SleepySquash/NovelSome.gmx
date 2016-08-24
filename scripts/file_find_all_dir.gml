//file_find_all(full_dir);
//file_find_all(working_directory + '/Items');

_dir = file_find_first(argument0+"\*",fa_directory); _dirs=1; _cdir[0]=argument0; global.file_find_all_count = 0;
while (_dir!="") {_cdir[_dirs]=argument0+"\"+_dir; _dirs+=1; _dir = file_find_next();} file_find_close();
for (_diri=0;_diri<_dirs;_diri+=1) {file=file_find_first(_cdir[_diri]+"\*."+string(argument1),0);
    while (file!="") {if (file_exists(_cdir[_diri]+"\"+file)) {global.file_find_all_file[global.file_find_all_count] = _cdir[_diri]+"\"+file;
        global.file_find_all_count+=1;} file = file_find_next();} file_find_close();} return (global.file_find_all_count>0);

/*file = file_find_first(argument0+"\*."+string(argument1),0); global.file_find_all_count = 0;
while (file!="") {//notcen_add('','file'+string(global.file_find_all_count));
    if (file_exists(argument0+"\"+file)) {global.file_find_all_file[global.file_find_all_count] = argument0+"\"+file; global.file_find_all_count+=1;}
    file = file_find_next();}
file_find_close(); return (global.file_find_all_count>0);*/

/*file = file_find_first( argument0+"\*", fa_directory );
global.file_find_all_count = 0;
while (file != "") {
    /* If the filename is not a directory, skip it 
    if (!directory_exists( argument0+"\" + file )) {
      file = file_find_next();
      continue;}
    global.file_find_all_file[global.file_find_all_count] = argument0+"\"+file;
    global.file_find_all_count += 1;
    file = file_find_next();}
file_find_close();

if (global.file_find_all_count>0 && file == "") {return true;}else{return false;}
