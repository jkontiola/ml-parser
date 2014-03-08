///_ML_LiF_Destroy(index)


var ActualFunctions = _ML_LiF_GetFuncs(argument0);
repeat (ds_map_size(ActualFunctions)) {
    _ML_LiS_Destroy(ds_map_find_value(ActualFunctions,ds_map_find_first(ActualFunctions)));
}
ds_map_destroy(ActualFunctions);
ds_list_destroy(argument0);
