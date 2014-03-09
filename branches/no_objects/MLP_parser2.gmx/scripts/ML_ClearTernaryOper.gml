///ML_ClearTernaryOper(parser)

var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument0);
repeat (ds_map_size(P_TERNOPER)) {
    ML_RemAssignOperStr(argument0, ds_map_find_first(P_TERNOPER));
}
