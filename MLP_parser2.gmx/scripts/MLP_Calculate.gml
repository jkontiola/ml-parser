///MLP_Calculate()

/*
**  Usage:
**      MLP_Calculate()
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
if (!MLP_NoException()) return 0;
do {
    tokenlist = _MLP_LexicalAnalysis();
    if (!MLP_NoException())  { break;}
    rpn = _MLP_ShuntingYard(tokenlist);    
    
    if (!MLP_NoException())  {ds_queue_destroy(rpn); break;}
    Ans = _MLP_Parser(rpn)
    ds_queue_destroy(rpn);
    if (!MLP_NoException()) break;
    Calculated = true;
} until 1 = 1

//cleanup
var i, s;
s = ds_list_size(tokenlist) 
for (i = 0; i < s; i += 1) {
    with (ds_list_find_value(tokenlist,i)) {
        instance_destroy();
    }
}
ds_list_destroy(tokenlist);

return Calculated;
