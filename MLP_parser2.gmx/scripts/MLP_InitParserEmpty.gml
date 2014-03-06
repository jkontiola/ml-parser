///MLP_InitParserEmpty(VarMap)

/*
**  Usage:
**      MLP_InitParserEmpty(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates completely empty parser
**      Ownership of the variable map is NOT in hand of the parser
*/


with (instance_create(0,0,MLP_objParser)) {
    VARMAP = argument0;
    return id;
}
