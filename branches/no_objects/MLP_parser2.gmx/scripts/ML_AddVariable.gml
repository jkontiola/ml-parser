///ML_AddVariable(varstring,[value, type, readonly = true])
/*
**  Usage:
**      ML_AddVariable("varstring",[value, type, readonly = true])
**
**  Arguments:
**      varstring   string used to identify the variable
**      value       initial value, if variable does not exist yet (default 0)
**      type        type of variable GML_VAL_REAL / GML_VAL_STRING. - If omitted the variables current state is used
**      readonly    wether or not the value can be written (default to read only)
**
**  Returns:
**      ID to the new "variable type" used in further functions
**
**  Notes:
*/

var str = argument[0];

if (!ds_map_exists(VARMAP,str) ) {
    var tval;
    tval = 0;
    if (argument_count > 1) {
        tval = argument[1];
    }   
    ds_map_add(VARMAP, str, tval);
}
var type;
if (argument_count > 2) {
    type = argument[2];
} else {
    var t = ds_map_find_value(VARMAP, str);
    if (is_real(t)) {
        type = ML_VAL_REAL;
    } else {
        type = ML_VAL_STRING;
    }
}
var ro = true;
if (argument_count > 3) {
    ro = argument[3];
}

var v = _ML_LiVar_Create(str, type, ro);
ds_map_add(P_VARIABLE,str,v);
return v;

