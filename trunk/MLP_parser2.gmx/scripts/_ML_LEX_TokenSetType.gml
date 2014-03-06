//from scope of token
tokentype = argument0;
switch (tokentype) {
case ML_TT_UNARY:
    operator = ds_map_find_value(other.P_UNOPER, tokenstring);
break;
case ML_TT_BINARY:
    operator = ds_map_find_value(other.P_BINOPER, tokenstring);
break;
case ML_TT_FUNCTION:
    operator = ds_map_find_value(other.P_FUNCTION, tokenstring);
break;
case ML_TT_VARIABLE:
    operator = ds_map_find_value(other.P_VARIABLE, tokenstring);
break;
case ML_TT_ASSIGN:
    operator = ds_map_find_value(other.P_ASSIGNOPER, tokenstring);
break;
case ML_TT_VALUE:
    if (string_char_at(tokenstring,1) == '"' || string_char_at(tokenstring,1) == "'") {
        operator = ML_VAL_STRING;
        tokenstring = string_copy(tokenstring,2,string_length(tokenstring)-2);
    } else {
        operator = ML_VAL_REAL;
    }
break;
case ML_TT_TERNARY1:
    operator = ds_map_find_value(other.P_TERNOPER, tokenstring);
break;
case ML_TT_UNKNOWN:
    with (other) {
        ML_RaiseException(ML_EXCEPT_UNKNOWNTOKEN, other.tokenpos, "unknown tokentype '" +other.tokenstring+ "' at "+string(other.tokenpos));
    }
    operator = -1;
default:
    operator = -1;
break;
}