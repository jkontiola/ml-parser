//ML_AddFunctionSig(script, return, argument_count, arglist)
with (instance_create(0,0, ML_objFunctionD)) {
    functionscript = argument0;
    argc = argument2;
    rettype = argument1;
    for (i = 0; i < argc ; i += 1) {
        args[i] = ds_list_find_value(argument3, i);
    }
    return id;
}
