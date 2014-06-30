///_ML_COMP_EvalAll(parser, ReversePolishQueue, OutFuncList, OutTokList)
/// @argType    r,r,r,r
/// @returnType auto
/// @hidden     true
var parser = argument0;
var rpn = argument1;
var newrpn = argument2;
var important_tokens = argument3;
var index = 0;
var rpn_size = ds_list_size(rpn);

while (index < rpn_size && ML_NoException(parser)) {
    index = _ML_COMP_EvalLine(parser, rpn, index, newrpn, important_tokens);

}
