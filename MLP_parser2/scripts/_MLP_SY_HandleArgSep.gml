//_MLP_SY_HandleArgSep(token, output, stack);
var token, output, stack;
token = argument0;
output = argument1;
stack = argument2;

while (!ds_stack_empty(stack)) {
    if (ds_stack_top(stack).tokentype == MLP_TT_LEFTP ) break;
    ds_queue_enqueue(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    MLP_RaiseException(MLP_EXCEPT_PARENTHESIS,token.tokenpos,"Mismatched parenthesis for '" + token.tokenstring +"' at " +string(token.tokenpos))
}
