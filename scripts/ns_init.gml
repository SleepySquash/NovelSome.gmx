global.__NSDLL="Data\NovelSome.dll"; //Путь к DLL'ке.

global.__nsFileCopy = external_define(current_directory()+global.__NSDLL, "NSCopyFile", dll_cdecl, ty_real, 2, ty_string, ty_string);
global.__nsFileDelete = external_define(current_directory()+global.__NSDLL, "NSDeleteFile", dll_cdecl, ty_real, 1, ty_string);
global.__nsFileSize = external_define(current_directory()+global.__NSDLL, "NSFileSize", dll_cdecl, ty_real, 1, ty_string);
global.__nsDirectoryCreate = external_define(current_directory()+global.__NSDLL, "NSDirectoryCreate", dll_cdecl, ty_real, 1, ty_string);
global.__nsDirectoryDelete = external_define(current_directory()+global.__NSDLL, "NSDirectoryRemove", dll_cdecl, ty_real, 1, ty_string);
