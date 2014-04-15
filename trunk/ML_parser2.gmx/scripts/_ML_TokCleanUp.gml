///_ML_TokCleanUp(tokenlist)
/// @argType    r
/// @returnType double
/// @hidden     true

var tokenlist = argument0;


var i, s;
s = ds_list_size(tokenlist) 
for (i = 0; i < s; i += 1) {
    _ML_LiTok_Destroy(ds_list_find_value(tokenlist,i));
}

