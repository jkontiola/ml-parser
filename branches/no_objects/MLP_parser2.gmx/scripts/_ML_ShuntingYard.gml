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

    switch (_ML_LiTok_GetType(token)) {
    case ML_TT_VALUE:
    case ML_TT_VARIABLE:
        if (curargnum == 0) curargnum = 1;
        _ML_SY_HandleValue(token, curoutput);
    break;
    case ML_TT_LEFTP:
        _ML_SY_HandleLeftPar(token, curstack);
        curparenthesis += 1;
    break;
    case ML_TT_FUNCTION:
        if (curargnum == 0) curargnum = 1;
        ds_stack_push(allstack, curstack);
        ds_stack_push(alloutput, curoutput);
        ds_stack_push(allargnum, curargnum);
        ds_stack_push(allparenthesis, curparenthesis);
        _ML_SY_HandleFunction(token, curstack);
        curlevel += 1;
        curstack = ds_stack_create();
        curoutput = ds_queue_create();
        curargnum = 0;
        curparenthesis = -1;
    break;
    case ML_TT_ASSIGN:
    case ML_TT_BINARY:
    case ML_TT_UNARY:
    case ML_TT_TERNARY1:
        _ML_SY_HandleOperator(token, curoutput, curstack);
    break;
    case ML_TT_TERNARY2:
        _ML_SY_HandleTernary2(token, curoutput, curstack);
    break;
    case ML_TT_ARGSEP:
        _ML_SY_HandleArgSep(token, curoutput, curstack);
        curargnum += 1;
    break;
    case ML_TT_COMMA: //special case - need to recheck comma's to check against function seperation
        if (curparenthesis == 0) {
            _ML_LiTok_SetType(token, ML_TT_ARGSEP); 
        } else {
            var prevtok,v;
            prevtok = -1;
            v = ML_TT_UNKNOWN;
            if (i > 0) {
                prevtok = ds_list_find_value(input, i - 1);
                if (_ML_LEX_IsBinoper(token, prevtok)) {
                    v = ML_TT_BINARY;    
                } else if (_ML_LEX_IsAssignoper(token, prevtok)) {
                    v = ML_TT_ASSIGN;
                } else if (_ML_LEX_IsTernOper(token, prevtok)) {
                    v = ML_TT_TERNARY1;
                } else if (_ML_LEX_IsTernOper2(token, prevtok)) {
                    v = ML_TT_TERNARY2
                }
            }
            if (v == ML_TT_UNKNOWN) {
                if _ML_LEX_IsFunction(token, prevtok) {
                    v = ML_TT_FUNCTION;
                } else if (_ML_LEX_IsUnoper(token, prevtok)) {
                    v = ML_TT_UNARY;
                } else if _ML_LEX_IsVariable(token, prevtok) {
                    v = ML_TT_VARIABLE;
                } else if _ML_LEX_IsValue(token, prevtok){
                    v = ML_TT_VALUE;
                } else {
                    v = ML_TT_UNKNOWN;
                }
            }
            _ML_LEX_TokenSetType(token, v);
        }
        i-=1;
    break;
    case ML_TT_RIGHTP:
        if (_ML_SY_HandleRightPar(token, curoutput, curstack, curargnum, alloutput, allstack, curlevel) == 1) {
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
    case ML_TT_EOL:
        if (curlevel != 0) {
            ML_RaiseException(ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(token), 
                "unexpected end of line, mismatching parenthesis at " + string(_ML_LiTok_GetPos(token)));
        }
        _ML_SY_HandleEOL(token, curoutput, curstack);
        endtok = true;
    break;
    case ML_TT_EXPRTERMINATOR:
        if (curlevel != 0) {
            ML_RaiseException(ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(token), 
                "unexpected end of expression, mismatching parenthesis at " + string(_ML_LiTok_GetPos(token)));
        }
        _ML_SY_HandleExprTerminator(token, curoutput, curstack);
    break;
    
    default:
        ML_RaiseException(ML_EXCEPT_TOKENTYPE, _ML_LiTok_GetPos(token), 
            "unknown tokentype for token '" + string(_ML_LiTok_GetVal(token)) + "' at " + string(_ML_LiTok_GetPos(token)));
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
    ML_RaiseException(ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(token),
        "Line ended before EOL'" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
}
return curoutput;
