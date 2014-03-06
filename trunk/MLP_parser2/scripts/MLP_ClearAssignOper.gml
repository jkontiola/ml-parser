///MLP_ClearAssignOper()

repeat (ds_map_size(P_ASSIGNOPER)) {
    MLP_RemAssignOperStr(ds_map_find_first(P_ASSIGNOPER));
}
