if (string_copy(line[crline+1],1,string_length('time '))=='time ') {
    return string_convert_topos(string_copy(line[crline+1],string_length('time '),string_length(line[crline+1])-string_length('time ')));}
return 0;
