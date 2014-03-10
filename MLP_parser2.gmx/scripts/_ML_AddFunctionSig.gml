// _ML_AddFunctionSig(script, return, argument_count, arglist)

var a;
a[0] = ML_VAL_REAL;
for (var i = 0; i < argument2 ; ++i) {
    a[i] = ds_list_find_value(argument3, i);
}

var ind = _ML_LiFS_Create(argument0, argument1, argument2, a);
return ind;
