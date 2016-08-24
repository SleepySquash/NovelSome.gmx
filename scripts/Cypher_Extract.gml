/*
Cypher_Extract(PkgID,File,Password,ExtractLocation);
    Extracts a file from a package.
Arguments:
          [0]PkgID: This is the Resource ID from Cypher_Open().
          [1]Fname: The internal Filename of the file you want to extract
          [2]Password: The password of the file (the password used to pack the file)
          [3]ExtractLocation: The location where you want the extracted file to
                              go.
Return:
Returns 0 if the function failed. Returns 1 on success.



*/


external_call(global.defCypherExtractFile,argument0,argument1,argument2,argument3);
