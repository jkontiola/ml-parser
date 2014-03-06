///ML_ClearUnaryOper()

repeat (ds_map_size(P_UNOPER)) {
    ML_RemUnaryOperStr(ds_map_find_first(P_UNOPER));
}
