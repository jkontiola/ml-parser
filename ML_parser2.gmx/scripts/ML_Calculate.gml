#define ML_Calculate
///ML_Calculate(parser)
/// @argType    r
/// @returnType real
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
var res_obj = _ML_LiP_GetResultObject(parser);
_ML_LiRO_SetCalculated(res_obj, false);
_ML_LiRO_Clear(res_obj);
if (!ML_NoException(parser)) return 0;

tokenlist = ds_list_create();
rpn = ds_list_create();

do {
    _ML_LexicalAnalysis(parser, tokenlist, _ML_LiP_GetFunctionString(parser));
    if (!ML_NoException(parser))  {break;}
    
    _ML_ShuntingYard(parser, tokenlist, rpn);    
    if (!ML_NoException(parser))  { break;}
    ans = _ML_Parse(parser, rpn, res_obj);    
    if (!ML_NoException(parser)) {break;}
    _ML_LiRO_SetFinal(res_obj, ans);
    _ML_LiRO_SetCalculated(res_obj, true);
} until 1 = 1


//cleanup
ds_list_destroy(rpn);
_ML_TokCleanUp(tokenlist);
ds_list_destroy(tokenlist);



return res_obj;
