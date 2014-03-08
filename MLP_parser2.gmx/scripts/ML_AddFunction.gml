///ML_AddFunction(functionstring,scriptid,returntype, [type_arg1, type_arg2 ... type_argN])

/*
**  Usage:
**      ML_AddFunction(functionstring,scriptid,returntype, [type_arg1, type_arg2 ... type_argN])
**
**  Arguments:
**      varstring   string used to identify the variable
**      scriptid    pointer to the variable in GM (string)
**      returntype  type of variable GML_VAL_REAL / GML_VAL_STRING
**      type_argN   type of the Nth argument (GML_VAL_REAL / GML_VAL_STRING)
**
**  Returns:
**      ID to the new "function type" used in further functions
**
**  Notes:
*/

var o, c, tlist;
tlist = ds_list_create();
c = argument_count - 3;
for (i = 0; i < c; i+= 1) {
    ds_list_add(tlist,argument[i+3]);
}
if (ds_map_exists(P_FUNCTION,argument[0])) {
    var argstr;
    argstr = "";
    if (c > 0) {
        argstr = argument[3];
        for (i = 1; i < c; i+= 1) {
            argstr += "$" + argument[i+3];
        }
    }
    o = ds_map_find_value(P_FUNCTION, argument[0]);
    _ML_LiF_AddSig(o, argstr, _ML_AddFunctionSig(argument[1], argument[2], c, tlist));
} else {
    o = _ML_NewFunction(argument[0], argument[1], argument[2], c, tlist);
    ds_map_add(P_FUNCTION, argument[0], o);
}
ds_list_destroy(tlist);
return o;
