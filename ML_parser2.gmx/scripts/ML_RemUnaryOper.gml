///ML_RemUnaryOper(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
ds_map_delete(P_UNOPER, _ML_Li_GetName(argument1));
_ML_LiUOp_Destroy(argument1);
