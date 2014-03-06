//_ML_SY_HandleUnary(token, output, stack)
var token, output, stack, o1, o2, t;
token = argument0;
output = argument1;
stack = argument2;
o1 = token.operator
while (!ds_stack_empty(stack)) {
    t = ds_stack_top(stack);
    if !(_ML_SY_TokenIsOperator(t)) break;
    o2 = t.operator;
    if (_ML_SY_OperatorActBefore(o1, o2)) break;
    if (t.tokentype == ML_TT_TERNARY1) {
        ML_RaiseException(ML_EXCEPT_TERNARY,token.tokenpos,"syntax error. Token '"+token.tokenstring+"' at "+ token.tokenpos +
                                                                 " can't exist inside ternary operator");
        break;
    }
    ds_queue_enqueue(output, ds_stack_pop(stack));
}
ds_stack_push(stack, token);
