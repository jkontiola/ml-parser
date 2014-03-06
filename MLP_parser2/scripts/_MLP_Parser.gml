var rpn, args, tok, lhs, lhs_val, t, expression_terminator;
//reverse polish notation of tokens;
rpn = argument0;
args = ds_stack_create();
while (!ds_queue_empty(rpn) && MLP_NoException()) {
    ds_stack_clear(args);
    expression_terminator = false;
    while (!ds_queue_empty(rpn) && expression_terminator == false && MLP_NoException()) {
        tok = ds_queue_dequeue(rpn);
        switch (tok.tokentype) {
        case MLP_TT_UNARY:
            _MLP_PARSE_Unary(tok, args);
        break;
        case MLP_TT_BINARY:
            _MLP_PARSE_Binary(tok, args);
        break;
        case MLP_TT_ASSIGN:
            _MLP_PARSE_Assign(tok, args);
        break;
        case MLP_TT_TERNARY:
            _MLP_PARSE_Ternary(tok, args);
        break;
        case MLP_TT_FUNCTION:
            _MLP_PARSE_Function(tok, args);
        break;
        case MLP_TT_VALUE:
        case MLP_TT_VARIABLE:
            ds_stack_push(args, tok);
        break;
        case MLP_TT_EXPRTERMINATOR:
            expression_terminator = true;
        break;
        }
    }
    if (MLP_NoException()) {
        if (ds_stack_size(args) > 1) {
            MLP_RaiseException(MLP_EXCEPT_VALUE,-1,
                "missing operator or function in expression");
        }
    }
    if (!ds_stack_empty(args)) {
        lhs = ds_stack_pop(args);
        if (lhs.tokentype == MLP_TT_VALUE) {
            if (lhs.operator == MLP_VAL_REAL) {
                lhs_val = real(lhs.tokenstring);
            } else {
                lhs_val = lhs.tokenstring;
            }
            ds_list_add(AllAns, lhs_val);
        } else if (lhs.tokentype == MLP_TT_VARIABLE)  {
            var v;
            v = lhs.operator;
            lhs_val = ds_map_find_value(VARMAP, v.str);
            ds_list_add(AllAns, lhs_val);
        }
    }
}
ds_stack_destroy(args);
return lhs_val;
