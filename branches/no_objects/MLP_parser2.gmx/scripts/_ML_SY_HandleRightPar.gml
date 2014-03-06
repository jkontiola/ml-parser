//ML_SY_HandleRightPar(token, output, stack, args, stackofoutputs, stackofstacks,  allargs, level);
var token, output, stack, level, alloutput, allstack, newstack, newoutput, args;
token = argument0;
output = argument1;
stack = argument2;
args = argument3
level = argument6;
alloutput = argument4;
allstack = argument5;

while (!ds_stack_empty(stack)) {
    if (ds_stack_top(stack).tokentype == ML_TT_LEFTP)  break;
    ds_queue_enqueue(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    ML_RaiseException(ML_EXCEPT_PARENTHESIS,token.tokenpos,"Mismatched parenthesis for '" + token.tokenstring +"' at " +string(token.tokenpos))
} else {
    ds_stack_pop(stack); //remove parenthesis
    if (level > 0 && ds_stack_empty(stack)) {
        //flatten the outputs
        newoutput = ds_stack_top(alloutput);
        newstack = ds_stack_top(allstack);
        _ML_SY_QueueAppendQueue(newoutput, output);
        var f;
        f = ds_stack_pop(newstack);
        f.argc = args;
        ds_queue_enqueue(newoutput, f);
        return 1;
    }
}
return 0;
