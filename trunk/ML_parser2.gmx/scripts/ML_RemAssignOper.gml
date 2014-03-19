///ML_RemAssignOper(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument0);
ds_map_delete(P_ASSIGNOPER, _ML_Li_GetName(argument1));
_ML_LiAOp_Destroy(argument1);
