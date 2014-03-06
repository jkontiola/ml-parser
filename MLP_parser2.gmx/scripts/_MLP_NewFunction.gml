//   MLP_NewFunction(function_string,script,returntype, argc, arglist)


with (instance_create(0,0,MLP_objFunction)) {
    str = argument0;
    var i, argstr;
    argstr = "";
    
    if (argument3 > 0) {
        argstr = ds_list_find_value(argument4, 0);
        for (i = 1; i < argument3 ; i += 1) {
            argstr += "$" + ds_list_find_value(argument4, i);
        }
    }
    ds_map_add(ActualFunctions, argstr, _MLP_AddFunctionSig(argument1, argument2, argument3, argument4));
    return id;
}
