//ML_SY_HandleTernary2(token, output, stack);
var token, output, stack, mylist, t, o1, o2;
token = argument0;
output = argument1;
stack = argument2;
mylist = ds_map_find_value(P_TERNOPER2, token.tokenstring);
while (!ds_stack_empty(stack)) {
    t = ds_stack_top(stack);
    if (_ML_SY_TernaryIsMatchingToken(t, mylist))  break;
    ds_queue_enqueue(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    ML_RaiseException(ML_EXCEPT_TERNARY,token.tokenpos,"Mismatched ternary operator, 2nd part before matching 1st, '" + token.tokenstring +"' at " +string(token.tokenpos))
} else {
    t = ds_stack_top(stack);
    t.tokenstring += token.tokenstring;
    t.tokentype = ML_TT_TERNARY;
}

