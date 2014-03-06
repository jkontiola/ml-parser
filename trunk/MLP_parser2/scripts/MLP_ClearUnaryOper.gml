///MLP_ClearUnaryOper()

repeat (ds_map_size(P_UNOPER)) {
    MLP_RemUnaryOperStr(ds_map_find_first(P_UNOPER));
}
