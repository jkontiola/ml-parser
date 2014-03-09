///ML_RemBinaryOperStr(parser, Binary operator string)


var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
ML_RemBinaryOper(argument0, ds_map_find_value(P_BINOPER,argument1));

