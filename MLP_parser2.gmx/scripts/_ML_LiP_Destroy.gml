///_ML_LiP_Destroy(ind);
var ind = argument0;
ML_ClearFunction(ind);
ML_ClearVariable(ind);
ML_ClearBinaryOper(ind);
ML_ClearUnaryOper(ind);
ML_ClearAssignOper(ind);
ML_ClearTernaryOper(ind);

ds_map_destroy(_ML_LiP_GetBinOpsTable(ind));
ds_map_destroy(_ML_LiP_GetUnOpsTable(ind));
ds_map_destroy(_ML_LiP_GetFunctionTable(ind));
ds_map_destroy(_ML_LiP_GetVariableTable(ind));
ds_map_destroy(_ML_LiP_GetAssignOpsTable(ind));
ds_map_destroy(_ML_LiP_GetTernOpsTable(ind));
ds_map_destroy(_ML_LiP_GetTernOps2Table(ind));
ds_list_destroy(_ML_LiP_GetAllAnswers(ind));

ds_list_destroy(ind);