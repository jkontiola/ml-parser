//ML_SY_HandleRightPar(token, output, stack, args, stackofoutputs, stackofstacks,  allargs, level);
var token, output, stack, level, alloutput, allstack, newstack, newoutput, argc;
token = argument0;
output = argument1;
stack = argument2;
argc = argument3
level = argument6;
alloutput = argument4;
allstack = argument5;

while (!ds_stack_empty(stack)) {
    if (_ML_LiTok_GetType(ds_stack_top(stack)) == ML_TT_LEFTP)  break;
    ds_queue_enqueue(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    ML_RaiseException(ML_EXCEPT_PARENTHESIS,_ML_LiTok_GetPos(token),
        "Mismatched parenthesis for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)))
} else {
    ds_stack_pop(stack); //remove parenthesis
    if (level > 0 && ds_stack_empty(stack)) {
        //flatten the outputs
        newoutput = ds_stack_top(alloutput);
        newstack = ds_stack_top(allstack);
        _ML_SY_QueueAppendQueue(newoutput, output);
        var f;
        f = ds_stack_pop(newstack);
        _ML_LiTok_SetArgcount(f, argc);
        ds_queue_enqueue(newoutput, f);
        return true;
    }
}
return false;
