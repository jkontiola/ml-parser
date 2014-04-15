///ML_Calculate(parser)
/// @argType    r
/// @returnType any
/// @hidden     false

/*
**  Usage:
**      ML_Calculate(parser)
**
**  Arguments:
**      parser      parser index
**
**  Returns:
**      result of expression
**
**  Notes:
*/

var rpn, tokenlist, ans;

var parser = argument0;
global._ML_CURRENTPARSER_ = parser;
_ML_LiP_SetCalculated(parser, false);
_ML_LiP_ClearAnswers(parser);
if (!ML_NoException(parser)) return 0;

tokenlist = ds_list_create();
rpn = ds_queue_create();

do {
    _ML_LexicalAnalysis(parser, tokenlist, _ML_LiP_GetFunctionString(parser));
    if (!ML_NoException(parser))  {break;}
    
    _ML_ShuntingYard(parser, tokenlist, rpn);    
    if (!ML_NoException(parser))  { break;}
    ans = _ML_Parse(parser, rpn);
    
    _ML_LiP_SetAnswer(parser, ans);
    if (!ML_NoException(parser)) {break;}
    _ML_LiP_SetCalculated(parser, true);
} until 1 = 1


//cleanup
ds_queue_destroy(rpn);
_ML_TokCleanUp(tokenlist);
ds_list_destroy(tokenlist);



return ML_NoException(parser) && _ML_LiP_GetCalculated(parser);
