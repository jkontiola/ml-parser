var op, lhs, rhs, lhs_val, rhs_val, ret, rhs_type, lhs_type, v;

op = argument0.operator;
if (ds_stack_size(argument1) < 2) {
    MLP_RaiseException(MLP_EXCEPT_BINOPERATOR,argument0.tokenpos,
            "missing value for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos))
    return 0;   
}
rhs = ds_stack_pop(argument1);
if (rhs.tokentype == MLP_TT_VALUE) {
    if (rhs.operator == MLP_VAL_REAL) {
        rhs_type = MLP_VAL_REAL;
        rhs_val = real(rhs.tokenstring);
    } else {
        rhs_type = MLP_VAL_STRING;
        rhs_val = rhs.tokenstring;
    }
} else {
    v = rhs.operator;
    rhs_val = ds_map_find_value(VARMAP, v.str);
    rhs_type = v.type
}
lhs = ds_stack_top(argument1);
if (lhs.tokentype == MLP_TT_VALUE) {
    if (lhs.operator == MLP_VAL_REAL) {
        lhs_type = MLP_VAL_REAL;
        lhs_val = real(lhs.tokenstring);
    } else {
        lhs_type = MLP_VAL_STRING;
        lhs_val = lhs.tokenstring;
    }
} else {
    v = lhs.operator;
    lhs_val = ds_map_find_value(VARMAP, v.str);
    lhs_type = v.type
}
var exact_operator, argstring;

argstring = lhs_type + "$" + rhs_type;

exact_operator = _MLP_PARSE_GetFullFunction(op, argstring)

if (exact_operator < 0) {
    MLP_RaiseException(MLP_EXCEPT_ARGTYPE,argument0.tokenpos,
        "Invalid argument type for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos));
    return 0;
} 
ret = script_execute(exact_operator.functionscript,lhs_val,rhs_val);
//create "temp" token with lhs_val:
lhs.tokenstring = ret;
lhs.tokentype = MLP_TT_VALUE;
lhs.operator = exact_operator.rettype;
