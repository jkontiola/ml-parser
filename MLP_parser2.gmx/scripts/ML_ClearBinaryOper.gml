///ML_ClearBinaryOper()

repeat (ds_map_size(P_BINOPER)) {
    ML_RemBinaryOperStr(ds_map_find_first(P_BINOPER));
}
