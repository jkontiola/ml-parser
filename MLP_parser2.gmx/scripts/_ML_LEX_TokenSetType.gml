///_ML_LEX_TokenSetType(token, type)

//from scope of token
var tok = argument0
var tokentype = argument1;
var tokenval = string(_ML_LiTok_GetVal(tok));
var operator;
switch (tokentype) {
    case ML_TT_UNARY:
        operator = ds_map_find_value(P_UNOPER, tokenval);
    break;
    case ML_TT_BINARY:
        operator = ds_map_find_value(P_BINOPER, tokenval);
    break;
    case ML_TT_FUNCTION:
        operator = ds_map_find_value(P_FUNCTION, tokenval);
    break;
    case ML_TT_VARIABLE:
        operator = ds_map_find_value(P_VARIABLE, tokenval);
    break;
    case ML_TT_ASSIGN:
        operator = ds_map_find_value(P_ASSIGNOPER, tokenval);
    break;
    case ML_TT_VALUE:
        if (string_char_at(tokenval,1) == '"' || string_char_at(tokenval,1) == "'") {
            operator = ML_VAL_STRING;
            tokenval = string_copy(tokenval,2,string_length(tokenval)-2);
        } else {
            operator = ML_VAL_REAL;
            tokenval = real(tokenval);
        }
        _ML_LiTok_SetString(tok, tokenval);
    break;
    case ML_TT_TERNARY1:
        operator = ds_map_find_value(P_TERNOPER, tokenval);
    break;
    case ML_TT_UNKNOWN:
        ML_RaiseException(ML_EXCEPT_UNKNOWNTOKEN, _ML_LiTok_GetPos(tok), 
            "unknown tokentype '" +string(tokenval)+ "' at "+string(_ML_LiTok_GetPos(tok)));
        operator = -1;
    default:
        operator = -1;
    break;
}

_ML_LiTok_SetType(tok, tokentype);
_ML_LiTok_SetOperator(tok, operator);

