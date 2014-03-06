///ML_ClearFunction()

repeat (ds_map_size(P_FUNCTION)) {
    ML_RemFunctionStr(ds_map_find_first(P_FUNCTION));
}
