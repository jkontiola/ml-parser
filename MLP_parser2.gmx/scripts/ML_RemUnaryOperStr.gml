///ML_RemUnaryOperStr(parser, Unary operator string)

var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
ML_RemUnaryOper(argument0, ds_map_find_value(P_UNOPER,argument1));

