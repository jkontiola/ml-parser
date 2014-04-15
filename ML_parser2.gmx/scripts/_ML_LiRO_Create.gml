///_ML_LiRO_Create()
/// @argType    
/// @returnType real
/// @hidden     true

var ind = ds_list_create();
ds_list_add(ind, false) //set/calculated
ds_list_add(ind, 0); //answer
ds_list_add(ind, ds_list_create()); //all answers
ds_list_add(ind, ds_list_create()); //all answers type

return ind;
