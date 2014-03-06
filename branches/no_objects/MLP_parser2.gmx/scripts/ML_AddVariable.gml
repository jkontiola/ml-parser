///ML_AddVariable(varstring,[value, type, readonly = true])
/*
**  Usage:
**      ML_AddVariable("varstring",[value, type, readonly = true])
**
**  Arguments:
**      varstring   string used to identify the variable
**      pointer     pointer (key) to the variable in the VARMAP
**      value       initial value, if variable does not exist yet (default 0)
**      type        type of variable GML_VAL_REAL / GML_VAL_STRING. - If omitted the variables current state is used
**      readonly    wether or not the value can be written (default to read only)
**
**  Returns:
**      ID to the new "variable type" used in further functions
**
**  Notes:
*/



with (instance_create(0,0,ML_objVariable)) {
    ds_map_add(other.P_VARIABLE,argument[0],id);
    str = argument[0];
    
 
    
    if (!ds_map_exists(other.VARMAP,str) ) {
        var tval;
        tval = 0;
        if (argument_count > 1) {
            tval = argument[1];
        }   
        ds_map_add(other.VARMAP, str, tval);
    }
    
    
    if (argument_count > 2) {
        type = argument[2];
    } else {
        var v;
        v = ds_map_find_value(other.VARMAP, str);
        if (is_real(v)) {
            type = ML_VAL_REAL;
        } else {
            type = ML_VAL_STRING;
        }
    }
    if (argument_count > 3) {readonly = argument[3]; }
    return id;
}
