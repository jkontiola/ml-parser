///ML_ClearTernaryOper()

var entry;
repeat (ds_map_size(P_TERNOPER)) {
    ML_RemAssignOperStr(ds_map_find_first(P_TERNOPER));
}
