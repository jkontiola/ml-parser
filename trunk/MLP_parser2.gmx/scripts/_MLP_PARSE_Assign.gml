var op, lhs, rhs, lhs_val, rhs_val, ret, lhs_type, rhs_type;

op = argument0.operator;
if (ds_stack_size(argument1) < 2) {
    MLP_RaiseException(MLP_EXCEPT_BINOPERATOR,argument0.tokenpos,
            "missing value for'" + argument0.tokenstring +"' at " +string(argument0.tokenpos))
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
    var v;
    v = rhs.operator;
    rhs_val = ds_map_find_value(VARMAP, v.str);
    rhs_type = v.type
}
lhs = ds_stack_top(argument1);
if (lhs.tokentype != MLP_TT_VARIABLE) {
    lhs_val = real(lhs.tokenstring);
    MLP_RaiseException(MLP_EXCEPT_ASSIGN,argument0.tokenpos,
            "Left hand side is not assignable '" + lhs.tokenstring +"' at " +string(lhs.tokenpos))
    return 0;
}
var v;
v = lhs.operator;
if (v.readonly) {
    MLP_RaiseException(MLP_EXCEPT_ASSIGN,argument0.tokenpos,
            "Left hand side is not assignable '" + lhs.tokenstring +"' at " +string(lhs.tokenpos));
    return 0;
}
lhs_type = v.type;

var exact_operator, argstring;

argstring = lhs_type + "$" + rhs_type;
exact_operator = _MLP_PARSE_GetFullFunction(op, argstring)

if (exact_operator < 0) {
    MLP_RaiseException(MLP_EXCEPT_ARGTYPE,argument0.tokenpos,
        "Invalid assignment type for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos));
    return 0;
} 
ret = script_execute(exact_operator.functionscript,v.str,rhs_val);
//create "temp" token with lhs_val:
lhs.tokenstring = ret;
lhs.tokentype = MLP_TT_VALUE;
if (is_real(ret)) {
    lhs.operator = MLP_VAL_REAL;
} else {
    lhs.operator = MLP_VAL_STRING;
}

