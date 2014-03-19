///newRealVarScript(name, initial value)
var v = ML_AddVariable(argument0, argument1, ML_VAL_REAL, false);

//reason this works is because "ML_Calculate" sets scope to the parser already

return argument1;
