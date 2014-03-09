///ML_VM_SetVar(parser, key, value)

/*
**  Usage:
**      ML_VM_SetVar(parser, key, value)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**      value   Value to set
**
**  Returns:
**
**  Notes:
*/
var key, value;
key = argument1;
value = argument2;
var VARMAP = _ML_LiP_GetVarMap(argument0);
if (ds_map_exists(VARMAP, key)) {
    ds_map_replace(VARMAP, key, value);
} else {
    ds_map_add(VARMAP, key, value);
}

