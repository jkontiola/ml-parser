///_ML_Parse(parser, ReversePolishQueue)
/// @argType    r,r
/// @returnType string
/// @hidden     true
var rpn, args, tok, lhs, lhs_val, t, expression_terminator;
//reverse polish notation of tokens;
var parser = argument0;
rpn = argument1;
args = ds_stack_create();
lhs_val = 0;

var VARMAP = _ML_LiP_GetVarMap(parser);


while (!ds_queue_empty(rpn) && ML_NoException(parser)) {
    ds_stack_clear(args);
    expression_terminator = false;
    while (!ds_queue_empty(rpn) && expression_terminator == false && ML_NoException(parser)) {
        tok = ds_queue_dequeue(rpn);
        
        switch (_ML_LiTok_GetType(tok)) {
        case ML_TT_UNARY:
            _ML_PARSE_Unary(parser, tok, args);
        break;
        case ML_TT_BINARY:
            _ML_PARSE_Binary(parser, tok, args);
        break;
        case ML_TT_ASSIGN:
            _ML_PARSE_Assign(parser, tok, args);
        break;
        case ML_TT_TERNARY:
            _ML_PARSE_Ternary(parser, tok, args);
        break;
        case ML_TT_FUNCTION:
            _ML_PARSE_Function(parser, tok, args);
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
    if (ML_NoException(parser)) {
        if (ds_stack_size(args) > 1) {
            ML_RaiseException(ML_EXCEPT_VALUE,-1,
                "missing operator or function in expression");
        }
    }
    if (!ds_stack_empty(args)) {
        lhs = ds_stack_pop(args);
        if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
            var lhs_val = _ML_LiTok_GetVal(lhs);
            var lhs_type = _ML_LiTok_GetOperator(lhs);
            _ML_LiP_AddAnswer(parser, lhs_val, lhs_type);
        } else if (_ML_LiTok_GetType(lhs) == ML_TT_VARIABLE)  {
            var v = _ML_LiTok_GetOperator(lhs);
            var lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
            var lhs_type = _ML_LiVar_GetType(v);
            _ML_LiP_AddAnswer(parser, lhs_val, lhs_type);
        }
    }
}
ds_stack_destroy(args);
return string(lhs_val);
