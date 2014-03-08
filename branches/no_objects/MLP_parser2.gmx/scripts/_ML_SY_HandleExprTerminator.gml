//ML_SY_HandleEOL(token, output, stack);
var token, output, stack;
token = argument0;
output = argument1;
stack = argument2;
while (!ds_stack_empty(stack)) {
    var t = ds_stack_pop(stack);
    //untill stack is empty
    if (_ML_LiTok_GetType(t) == ML_TT_ARGSEP || _ML_LiTok_GetType(t) == ML_TT_LEFTP) {
        ML_RaiseException(ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(t),
            "Mismatched parenthesis for '" + string(_ML_LiTok_GetVal(t)) +"' at " +string(_ML_LiTok_GetPos(t)));
    } else {
        ds_queue_enqueue(output, t);
    }
    //add top operator to output
}
ds_queue_enqueue(output,token);
