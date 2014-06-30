///_ML_Parse(parser, ReversePolishQueue, ResultObject)
/// @argType    r,r,r
/// @returnType auto
/// @hidden     true
var tok, lhs, lhs_val, t, expression_terminator;
//reverse polish notation of tokens;
var parser = argument0;
var rpn = argument1;
var res_obj = argument2;
var args = ds_stack_create();
lhs_val = 0;

var VARMAP = _ML_LiP_GetVarMap(parser);
var temptokens = ds_list_create();

var rpn_size = ds_list_size(rpn);
var tok_index = 0;
//while (!ds_queue_empty(rpn) && ML_NoException(parser)) {
while (tok_index < rpn_size && ML_NoException(parser)) {
    ds_stack_clear(args);
    expression_terminator = false;
    while (tok_index < rpn_size && expression_terminator == false && ML_NoException(parser)) {
        //tok = ds_queue_dequeue(rpn);
        tok = ds_list_find_value(rpn, tok_index);
        ++tok_index;
        
        switch (_ML_LiTok_GetType(tok)) {
        case ML_TT_FUNCFLAT:
            _ML_PARSE_FuncFlat(parser, tok, args, temptokens);
        break;
        case ML_TT_ASSIGNFLAT:
            _ML_PARSE_AssignFlat(parser, tok, args, temptokens);
        break;
        case ML_TT_VARIABLE:
            ds_stack_push(args, tok);
        break;
        case ML_TT_VALUE:
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
            _ML_LiRO_Add(res_obj, lhs_val, lhs_type);
        } else if (_ML_LiTok_GetType(lhs) == ML_TT_VARIABLE)  {
            var v = _ML_LiTok_GetOperator(lhs);
            var lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
            var lhs_type = _ML_LiVar_GetType(v);
            _ML_LiRO_Add(res_obj, lhs_val, lhs_type);
        }
    }
}
_ML_TokCleanUp(temptokens);
ds_list_destroy(temptokens);
ds_stack_destroy(args);
return lhs_val;
