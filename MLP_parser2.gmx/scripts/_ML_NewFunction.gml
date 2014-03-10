///   _ML_NewFunction(function_string,script,returntype, argc, arglist)

var ind = _ML_LiF_Create(argument0);
var i, argstr;
argstr = "";
if (argument3 > 0) {
    argstr = ds_list_find_value(argument4, 0);
    for (i = 1; i < argument3 ; i += 1) {
        argstr += "$" + ds_list_find_value(argument4, i);
    }
}

_ML_LiF_AddSig(ind, argstr, _ML_AddFunctionSig(argument1, argument2, argument3, argument4));
return ind;
