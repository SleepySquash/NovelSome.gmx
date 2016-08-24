/*
Cypher_GetFname(PkgID, FileID);
     Gets the name of a file. Note that the file ID's are in order of addition.
     The first file is 0.
Arguments:
          [0]PkgID: This is the Resource ID from Cypher_Open().
          [1]FileID: The index of the file
 
Return:
The file name or "" if the file doesnt exist.



*/


external_call(global.defCypherGetFname,argument0,argument1);
