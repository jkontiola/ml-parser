///ML_RemVariable(index) destroys variable - DOES NOT DESTROY IN MAP WITH VALUES

ds_map_delete(P_VARIABLE, _ML_Li_GetName(argument0));
_ML_LiVar_Destroy(argument0);
