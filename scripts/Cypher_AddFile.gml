/*
Cypher_AddFile(PkgID,Fname,Password,InternalFname);
      Adds a new file to a package. You must use Cypher_Write() again after adding
      new files.
Arguments:
          [0]PkgID: This is the Resource ID from Cypher_Open().
          [1]Fname: The path of the file you wish to add.
          [2]Password: A password to encrypt this file with. Leave blank ("") for no encryption
          [3]InternalFname: The name of the file inside of the package (Use this
                            name for extracting later)
Return:
Returns 0 if the function failed. Returns 1 on success.



*/


external_call(global.defCypherAddFile,argument0,argument1,argument2,argument3);
