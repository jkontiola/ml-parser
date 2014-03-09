///ML_Calculate(parser)

/*
**  Usage:
**      ML_Calculate(parser)
**
**  Arguments:
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
do {
    tokenlist = _ML_LexicalAnalysis(parser);
    if (!ML_NoException(parser))  {break;}
    rpn = _ML_ShuntingYard(parser, tokenlist);    
    if (!ML_NoException(parser))  {ds_queue_destroy(rpn); break;}
    ans = _ML_Parse(parser, rpn);

    ds_queue_destroy(rpn); 
    _ML_LiP_SetAnswer(parser, ans);
    if (!ML_NoException(parser)) {break;}
    _ML_LiP_SetCalculated(parser, true);
} until 1 = 1


//cleanup
var i, s;
s = ds_list_size(tokenlist) 
for (i = 0; i < s; i += 1) {
    _ML_LiTok_Destroy(ds_list_find_value(tokenlist,i));
}
ds_list_destroy(tokenlist);


return _ML_LiP_GetCalculated(parser);
