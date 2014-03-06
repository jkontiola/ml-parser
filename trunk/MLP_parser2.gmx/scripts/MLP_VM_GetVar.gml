///MLP_VM_GetVar(key)

/*
**  Usage:
**      MLP_VM_GetVar(key)
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

