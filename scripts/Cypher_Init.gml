/*



*/
Dllname = "Resource_DLL.dll";

global.defCypherInit=external_define(Dllname,"OpenResource",dll_stdcall,ty_real,2,ty_string,ty_string);

global.defCypherAddFile=external_define(Dllname,"AddFile",dll_stdcall,ty_real,4,ty_real,ty_string,ty_string,ty_string);
global.defCypherWritePackage=external_define(Dllname,"WritePackage",dll_stdcall,ty_real,3,ty_real,ty_string,ty_string);
global.defCypherExtractFile=external_define(Dllname,"ExtractFile",dll_stdcall,ty_real,4,ty_real,ty_string,ty_string,ty_string);
global.defCypherClosePackage=external_define(Dllname,"ClosePackage",dll_stdcall,ty_real,1,ty_real);
global.defCypherFileCount=external_define(Dllname,"FileCount",dll_stdcall,ty_real,1,ty_real);
global.defCypherGetFname=external_define(Dllname,"GetFname",dll_stdcall,ty_string,2,ty_real,ty_real);
global.defCypherRemoveFile=external_define(Dllname,"RemoveFile",dll_stdcall,ty_real,2,ty_real,ty_string);


