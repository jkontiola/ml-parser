///ML_Calculate()

/*
**  Usage:
**      ML_Calculate()
**
**  Arguments:
**
**  Returns:
**      result of expression
**
**  Notes:
*/

var rpn, tokenlist;

Calculated = false;
ds_list_clear(AllAns);
if (!ML_NoException()) return 0;
do {
    tokenlist = _ML_LexicalAnalysis();
    if (!ML_NoException())  { break;}
    rpn = _ML_ShuntingYard(tokenlist);    
    
    if (!ML_NoException())  {ds_queue_destroy(rpn); break;}
    Ans = _ML_Parser(rpn)
    ds_queue_destroy(rpn);
    if (!ML_NoException()) break;
    Calculated = true;
} until 1 = 1

//cleanup
var i, s;
s = ds_list_size(tokenlist) 
for (i = 0; i < s; i += 1) {
    _ML_LiTok_Destroy(ds_list_find_value(tokenlist,i));
}
ds_list_destroy(tokenlist);

return Calculated;
