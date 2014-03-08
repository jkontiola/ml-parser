var rpn, args, tok, lhs, lhs_val, t, expression_terminator;
//reverse polish notation of tokens;
rpn = argument0;
args = ds_stack_create();
lhs_val = 0;
while (!ds_queue_empty(rpn) && ML_NoException()) {
    ds_stack_clear(args);
    expression_terminator = false;
    while (!ds_queue_empty(rpn) && expression_terminator == false && ML_NoException()) {
        tok = ds_queue_dequeue(rpn);
        
        switch (_ML_LiTok_GetType(tok)) {
        case ML_TT_UNARY:
            _ML_PARSE_Unary(tok, args);
        break;
        case ML_TT_BINARY:
            _ML_PARSE_Binary(tok, args);
        break;
        case ML_TT_ASSIGN:
            _ML_PARSE_Assign(tok, args);
        break;
        case ML_TT_TERNARY:
            _ML_PARSE_Ternary(tok, args);
        break;
        case ML_TT_FUNCTION:
            _ML_PARSE_Function(tok, args);
        break;
        case ML_TT_VALUE:
        case ML_TT_VARIABLE:
            ds_stack_push(args, tok);
        break;
        case ML_TT_EXPRTERMINATOR:
            expression_terminator = true;
        break;
        }
    }
    if (ML_NoException()) {
        if (ds_stack_size(args) > 1) {
            ML_RaiseException(ML_EXCEPT_VALUE,-1,
                "missing operator or function in expression");
        }
    }
    if (!ds_stack_empty(args)) {
        lhs = ds_stack_pop(args);
        if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
            if (_ML_LiTok_GetOperator(lhs) == ML_VAL_REAL) {
                lhs_val = _ML_LiTok_GetVal(lhs);
            } else {
                lhs_val = _ML_LiTok_GetVal(lhs);
            }
            ds_list_add(AllAns, lhs_val);
        } else if (_ML_LiTok_GetType(lhs) == ML_TT_VARIABLE)  {
            var v;
            v = _ML_LiTok_GetOperator(lhs);
            lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
            ds_list_add(AllAns, lhs_val);
        }
    }
}
ds_stack_destroy(args);
return lhs_val;
