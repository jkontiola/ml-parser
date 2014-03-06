///ML_VM_SetVar(key, value)

/*
**  Usage:
**      ML_VM_SetVar(key, value)
**
**  Arguments:
**      key     Key/Pointer to the variable
**      value   Value to set
**
**  Returns:
**
**  Notes:
*/
var key, value;
key = argument0;
value = argument1;
if (ds_map_exists(VARMAP, key)) {
    ds_map_replace(VARMAP, key, value);
} else {
    ds_map_add(VARMAP, key, value);
}

