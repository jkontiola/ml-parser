///ML_RemBinaryOper(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
ds_map_delete(P_BINOPER, _ML_Li_GetName(argument1));
_ML_LiBOp_Destroy(argument1);
