//ML_SY_HandleEOL(token, output, stack);
var token, output, stack;
token = argument0;
output = argument1;
stack = argument2;
while (!ds_stack_empty(stack)) {
    t = ds_stack_pop(stack);
    //untill stack is empty
    if (t.tokentype == ML_TT_ARGSEP || t.tokentype == ML_TT_LEFTP) {
        ML_RaiseException(ML_EXCEPT_PARENTHESIS,t.tokenpos,"Mismatched parenthesis for '" + t.tokenstring +"' at " +string(t.tokenpos));
    } else {
        ds_queue_enqueue(output, t);
    }
    //add top operator to output
}
ds_queue_enqueue(output,token);
