/*
Cypher_RemoveFile(PkgID,Fname);
    Removes a file from a package
Arguments:
          [0]PkgID: This is the Resource ID from Cypher_Open().
          [1]Fname: The internal Filename of the file you want to delete

Return:
Returns 0 if the function failed. Returns 1 on success.



*/


external_call(global.defCypherRemoveFile,argument0,argument1);
