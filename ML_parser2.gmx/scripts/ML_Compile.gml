///ML_Compile(parser, expression)
/// @argType    r, s
/// @returnType real
/// @hidden     false


/*
**  Usage:
**      ML_Compile(parser, expression)
**
**  Arguments:
**      parser      parser index
**      expression  expression string
**
**  Returns:
**      compile output to execute
**
**  Notes:
*/

var rpn, tokenlist, ans;

var parser = argument0;
global._ML_CURRENTPARSER_ = parser;
_ML_LiP_SetCalculated(parser, false);
_ML_LiP_ClearAnswers(parser);

var compile = ds_list_create();


if (!ML_NoException(parser)) return compile;

tokenlist = ds_list_create();
rpn = ds_queue_create();

do {
    _ML_LexicalAnalysis(parser, tokenlist, argument1);
    if (!ML_NoException(parser))  {break;}
    _ML_ShuntingYard(parser, tokenlist, rpn);  
    if (!ML_NoException(parser))  {ds_queue_destroy(rpn); break;}
} until (1 == 1);

if (!ML_NoException(parser))  {
    ds_queue_destroy(rpn);
    _ML_TokCleanUp(tokenlist);
    ds_list_destroy(tokenlist);
    return compile;
}

ds_list_add(compile, tokenlist, rpn);
return compile;




