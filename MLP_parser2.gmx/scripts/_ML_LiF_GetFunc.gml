///_ML_LiF_GetFunc(baseopid, signature_string)
var ActualFunctions = ds_list_find_value(argument0, ML_LIFUNC_ACTUAL);
if (ds_map_exists(ActualFunctions, argument1) ) {
    return ds_map_find_value(ActualFunctions, argument1);
} else {
    return -1;
}

