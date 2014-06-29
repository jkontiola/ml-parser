#define _ML_COMP_EvalLine
///_ML_COMP_EvalLine(parser, ReversePolishQueue, index, newRPN, importantTokenList)
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true
var expression_terminator = false;
var args = ds_stack_create();
var newrpn = argument3;
var parser = argument0;
var rpn = argument1;
var important_tokens = argument4;
var tok;
var rpn_size = ds_list_size(rpn);
var tok_index = argument2;
while (tok_index < rpn_size && expression_terminator == false && ML_NoException(parser)) {
    tok = ds_list_find_value(rpn, tok_index);
    ++tok_index;
    
    expression_terminator= _ML_COMP_EvalToken(parser, args, tok);
    
    if !(expression_terminator && (tok_index == rpn_size || tok_index == 1) ) {
        ds_map_add(important_tokens, tok, 0);
        ds_list_add(newrpn, tok);
    }
}
if (ML_NoException(parser)) {
    if (ds_stack_size(args) > 1) {
        ML_RaiseException(ML_EXCEPT_VALUE,-1,
            "missing operator or function in expression");
    }
}
ds_stack_destroy(args);
return tok_index;
