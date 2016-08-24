//file_find_all(full_dir);
//file_find_all(working_directory + '/Items');

file = file_find_first(argument0+"\*",0); global.file_find_all_count = 0;
while (file!="") {//notcen_add('','file'+string(global.file_find_all_count));
    if (file_exists(argument0+"\"+file)) {global.file_find_all_file[global.file_find_all_count] = argument0+"\"+file; global.file_find_all_count+=1;}
    file = file_find_next();}
file_find_close(); return (global.file_find_all_count>0);

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
