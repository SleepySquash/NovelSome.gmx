/*
Cypher_Close(PkgID);
      Closes a package and frees the memory used by it.
Arguments:
          [0]PkgID: This is the Resource ID from Cypher_Open().
 
Return:
Returns 0 if the function failed. Returns 1 on success.



*/


external_call(global.defCypherClosePackage,argument0);
