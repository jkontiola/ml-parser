///ML_CompileCleanup(Compile)
/// @argType    r
/// @returnType void
/// @hidden     false

var tokenlist = ds_list_find_value(argument0, 0);
var rpn = ds_list_find_value(argument0, 1);


ds_queue_destroy(rpn);
_ML_TokCleanUp(tokenlist);
ds_list_destroy(tokenlist);

ds_list_destroy(argument0);
