var input, curoutput, curstack, token, endtok, o1, o2, t, allstack, alloutput;
var curlevel, allargnum, curargnum, curparenthesis, allparenthesis;

input = argument0;

allstack = ds_stack_create();
alloutput = ds_stack_create();
allargnum = ds_stack_create();
allparenthesis = ds_stack_create();

curstack = ds_stack_create();
curoutput = ds_queue_create();
curparenthesis = 1;
curargnum = 1;
curlevel = 0;



s = ds_list_size(input);
i = 0;
endtok = false;

while (i < s && !endtok) { //while there are tokens to be read
    token = ds_list_find_value(input, i);    
    switch (token.tokentype) {
    case MLP_TT_VALUE:
    case MLP_TT_VARIABLE:
        if (curargnum == 0) curargnum = 1;
        _MLP_SY_HandleValue(token, curoutput);
    break;
    case MLP_TT_LEFTP:
        _MLP_SY_HandleLeftPar(token, curstack);
        curparenthesis += 1;
    break;
    case MLP_TT_FUNCTION:
        if (curargnum == 0) curargnum = 1;
        ds_stack_push(allstack, curstack);
        ds_stack_push(alloutput, curoutput);
        ds_stack_push(allargnum, curargnum);
        ds_stack_push(allparenthesis, curparenthesis);
        _MLP_SY_HandleFunction(token, curstack);
        curlevel += 1;
        curstack = ds_stack_create();
        curoutput = ds_queue_create();
        curargnum = 0;
        curparenthesis = -1;
    break;
    case MLP_TT_ASSIGN:
    case MLP_TT_BINARY:
    case MLP_TT_UNARY:
    case MLP_TT_TERNARY1:
        _MLP_SY_HandleOperator(token, curoutput, curstack);
    break;
    case MLP_TT_TERNARY2:
        _MLP_SY_HandleTernary2(token, curoutput, curstack);
    break;
    case MLP_TT_ARGSEP:
        _MLP_SY_HandleArgSep(token, curoutput, curstack);
        curargnum += 1;
    break;
    case MLP_TT_COMMA:
        if (curparenthesis == 0) {
            token.tokentype = MLP_TT_ARGSEP;
        } else {
            var prevtok,v;
            prevtok = -1;
            v = MLP_TT_UNKNOWN;
            if (i > 0) {
                prevtok = ds_list_find_value(input, i - 1);
                if (_MLP_LEX_IsBinoper(token, prevtok)) {
                    v = MLP_TT_BINARY;    
                } else if (_MLP_LEX_IsAssignoper(token, prevtok)) {
                    v = MLP_TT_ASSIGN;
                } else if (_MLP_LEX_IsTernOper(token, prevtok)) {
                    v = MLP_TT_TERNARY1;
                } else if (_MLP_LEX_IsTernOper2(token, prevtok)) {
                    v = MLP_TT_TERNARY2
                }
            }
            if (v == MLP_TT_UNKNOWN) {
                if _MLP_LEX_IsFunction(token, prevtok) {
                    v = MLP_TT_FUNCTION;
                } else if (_MLP_LEX_IsUnoper(token, prevtok)) {
                    v = MLP_TT_UNARY;
                } else if _MLP_LEX_IsVariable(token, prevtok) {
                    v = MLP_TT_VARIABLE;
                } else if _MLP_LEX_IsValue(token, prevtok){
                    v = MLP_TT_VALUE;
                } else {
                    v = MLP_TT_UNKNOWN;
                }
            }
            with (token) _MLP_LEX_TokenSetType(v);
        }
        i-=1;
    break;
    case MLP_TT_RIGHTP:
        if (_MLP_SY_HandleRightPar(token, curoutput, curstack, curargnum, alloutput, allstack, curlevel) == 1) {
            ds_stack_destroy(curstack);
            ds_queue_destroy(curoutput);
            curoutput = ds_stack_pop(alloutput);
            curstack = ds_stack_pop(allstack);
            curargnum = ds_stack_pop(allargnum);
            curparenthesis = ds_stack_pop(allparenthesis);
            curlevel -= 1;
        } else {
            curparenthesis -= 1;
        }
    break;
    case MLP_TT_EOL:
        if (curlevel != 0) {
            MLP_RaiseException(MLP_EXCEPT_PARENTHESIS, token.tokenpos, "unexpected end of line, mismatching parenthesis at " + string(token.tokenpos));
        }
        _MLP_SY_HandleEOL(token, curoutput, curstack);
        endtok = true;
    break;
    case MLP_TT_EXPRTERMINATOR:
        if (curlevel != 0) {
            MLP_RaiseException(MLP_EXCEPT_PARENTHESIS, token.tokenpos, "unexpected end of expression, mismatching parenthesis at " + string(token.tokenpos));
        }
        _MLP_SY_HandleExprTerminator(token, curoutput, curstack);
    break;
    
    default:
        MLP_RaiseException(MLP_EXCEPT_TOKENTYPE, token.tokenpos, "unknown tokentype for token '" + token.tokenstring + "' at " + string(token.tokenpos));
    break;
    
    }
    i+=1;
}
var tstack, toutput;
repeat (ds_stack_size(allstack)) {
    ds_stack_destroy(ds_stack_pop(allstack));
}
ds_stack_destroy(allstack);
repeat (ds_stack_size(alloutput)) {
    ds_queue_destroy(ds_stack_pop(alloutput));
}
ds_stack_destroy(alloutput);
ds_stack_destroy(allargnum);
ds_stack_destroy(allparenthesis);

ds_stack_destroy(curstack);



if !(endtok) {
    MLP_RaiseException(MLP_EXCEPT_PARENTHESIS,token.tokenpos,"Line ended before EOL'" + token.tokenstring +"' at " +string(token.tokenpos));
}
return curoutput;
