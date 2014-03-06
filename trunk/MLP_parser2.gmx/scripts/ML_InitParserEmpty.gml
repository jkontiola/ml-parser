///ML_InitParserEmpty(VarMap)

/*
**  Usage:
**      ML_InitParserEmpty(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates completely empty parser
*/


with (instance_create(0,0,ML_objParser)) {
    VARMAP = argument0;
    return id;
}
