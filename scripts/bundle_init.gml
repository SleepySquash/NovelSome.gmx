global.isBundle=""; if (os_browser != browser_not_a_browser) {exit;} if (os_type != os_windows) {exit;}
if (file_exists(current_directory()+"Config\bundle")) {_file = file_text_open_read(current_directory()+"Config\bundle");
    while (!file_text_eof(_file)) {_str = file_text_read_string(_file);
        if (string_copy(_str,1,string_length("bundle ")) == "bundle ") {
            _path = string_copy(_str,string_length("bundle ")+1,string_length(_str)-string_length("bundle "));
            if (_path!="") {_path=string_replace_all(_path,'"',''); global.isBundle=_path; break;}}
        file_text_readln(_file);} file_text_close(_file);}
