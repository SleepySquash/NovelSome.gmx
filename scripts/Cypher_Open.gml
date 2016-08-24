/*
Cypher_Open(Fname, Password);
      Opens a new Resource Package and reurns the ID of the package which is used
      For other functions.

Arguments:
          [0]Fname: The Filename of a resource. If you are creating a new package
                    then leave this argument blank.
          [1]Password: If this package exists, it might have a password on it.
                       Provide a password to access the file or leave blank ("")
                       if you do not need to decrypt it.
Return:
Returns the Package ID which is needed for other functions.



*/


external_call(global.defCypherInit,argument0,argument1);
