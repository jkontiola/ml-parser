/// ML_VM_VarExists(parser, varstring)
/// @argType    r, s
/// @returnType auto
/// @hidden     false

var VARMAP =  _ML_LiP_GetVarMap(argument0);
return ds_map_exists(VARMAP, argument1);
