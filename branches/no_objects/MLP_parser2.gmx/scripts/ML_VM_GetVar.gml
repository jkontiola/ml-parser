///ML_VM_GetVar(key)

/*
**  Usage:
**      ML_VM_GetVar(key)
**
**  Arguments:
**      key     Key/Pointer to the variable
**
**  Returns:
**      Value of variable at "key"
**
**  Notes:
*/


return ds_map_find_value(VARMAP, argument0);

