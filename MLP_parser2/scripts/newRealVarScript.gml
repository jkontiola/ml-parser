///newRealVarScript(name, initial value)
var v = MLP_AddVariable(argument0, argument1, MLP_VAL_REAL, false);

//reason this works is because "MLP_Calculate" sets scope to the parser already

return argument1;
