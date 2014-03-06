///MLP_ClearFunction()

repeat (ds_map_size(P_FUNCTION)) {
    MLP_RemFunctionStr(ds_map_find_first(P_FUNCTION));
}
