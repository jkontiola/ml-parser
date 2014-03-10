///_ML_LiF_AddSig(baseopid, argstring, actualoperatorid)
var ActualFunctions = ds_list_find_value(argument0, ML_LIFUNC_ACTUAL);
ds_map_add(ActualFunctions, argument1, argument2);

