///ML_AddFunction(parser, functionstring,scriptid,returntype, [type_arg1, type_arg2 ... type_argN])

/*
**  Usage:
**      ML_AddFunction(parser, functionstring,scriptid,returntype, [type_arg1, type_arg2 ... type_argN])
**
**  Arguments:
**      parser          Parser index
**      functionstring  string used to identify the function
**      scriptid        script-index from the function
**      returntype      type of variable GML_VAL_REAL / GML_VAL_STRING
**      type_argN       type of the Nth argument (GML_VAL_REAL / GML_VAL_STRING)
**
**  Returns:
**      ID to the new "function type" used in further functions
**
**  Notes:
**      script get as argument when executed: {arg1-value, arg2-value ... argN-value}
*/

var o, c, tlist;
tlist = ds_list_create();
c = argument_count - 4;
for (i = 0; i < c; ++i) {
    ds_list_add(tlist,argument[i+4]);
}
var P_FUNCTION  = _ML_LiP_GetFunctionTable(argument[0]);

if (ds_map_exists(P_FUNCTION,argument[1])) {
    var argstr;
    argstr = "";
    if (c > 0) {
        argstr = argument[4];
        for (i = 1; i < c; i+= 1) {
            argstr += "$" + argument[i+4];
        }
    }
    o = ds_map_find_value(P_FUNCTION, argument[1]);
    _ML_LiF_AddSig(o, argstr, _ML_AddFunctionSig(argument[2], argument[3], c, tlist));
} else {
    o = _ML_NewFunction(argument[1], argument[2], argument[3], c, tlist);
    ds_map_add(P_FUNCTION, argument[1], o);
}
ds_list_destroy(tlist);
return o;
