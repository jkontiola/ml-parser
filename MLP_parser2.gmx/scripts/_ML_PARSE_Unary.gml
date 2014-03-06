var op, lhs, lhs_val, ret, t;

op = argument0.operator;
if (ds_stack_size(argument1) < 1) {
    ML_RaiseException(ML_EXCEPT_UNOPERATOR,argument0.tokenpos,
            "missing value for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos))
    return 0;   
}
lhs = ds_stack_top(argument1);
if (lhs.tokentype == ML_TT_VALUE) {
    if (lhs.operator == ML_VAL_REAL) {
        t = ML_VAL_REAL;
        lhs_val = real(lhs.tokenstring);
    } else {
        t = ML_VAL_STRING;
        lhs_val = lhs.tokenstring;
    }
} else {
    var v;
    v = lhs.operator;
    lhs_val = ds_map_find_value(VARMAP, v.str);
    t = v.type
}
var exact_operator, argstring;

argstring = t;

exact_operator = _ML_PARSE_GetFullFunction(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException(ML_EXCEPT_ARGTYPE,argument0.tokenpos,
        "Invalid argument type for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos));
    return 0;
} 

ret = script_execute(exact_operator.functionscript,lhs_val);
//create "temp" token with lhs_val:
lhs.tokenstring = ret;
lhs.tokentype = ML_TT_VALUE;
lhs.operator = exact_operator.rettype;
