/*
Cypher_Write(PkgID,Fname,Password);
      Writes a resource file such as "Sprites.bin".
Arguments:
          [0]PkgID: This is the Resource ID from Cypher_Open().
          [1]Fname: The filename of the package you want to write (eg. "Sprites.bin")
          [2]Password: A Password for the file. Leave blank ("") to have no password

Return:
Returns 0 if the function failed. Returns 1 on success.



*/


external_call(global.defCypherWritePackage,argument0,argument1,argument2);
