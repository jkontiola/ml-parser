var op, lhs, rhs, lhs_val, rhs_val, ret, mhs, mhs_val, rhs_type, lhs_type, mhs_type, v;

op = argument0.operator;
if (ds_stack_size(argument1) < 3) {
    ML_RaiseException(ML_EXCEPT_TERNARY,argument0.tokenpos,
            "missing value for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos))
    return 0;   
}
rhs = ds_stack_pop(argument1);
if (rhs.tokentype == ML_TT_VALUE) {
    if (rhs.operator == ML_VAL_REAL) {
        rhs_type = ML_VAL_REAL;
        rhs_val = real(rhs.tokenstring);
    } else {
        rhs_type = ML_VAL_STRING;
        rhs_val = rhs.tokenstring;
    }
} else {
    v = rhs.operator;
    rhs_val = ds_map_find_value(VARMAP, v.str);
    rhs_type = v.type
}
mhs = ds_stack_pop(argument1);
if (mhs.tokentype == ML_TT_VALUE) {
    if (mhs.operator == ML_VAL_REAL) {
        mhs_type = ML_VAL_REAL;
        mhs_val = real(mhs.tokenstring);
    } else {
        mhs_type = ML_VAL_STRING;
        mhs_val = mhs.tokenstring;
    }
} else {
    v = mhs.operator;
    mhs_val = ds_map_find_value(VARMAP, v.str);
    mhs_type = v.type
}


lhs = ds_stack_top(argument1);
if (lhs.tokentype == ML_TT_VALUE) {
    if (lhs.operator == ML_VAL_REAL) {
        lhs_type = ML_VAL_REAL;
        lhs_val = real(lhs.tokenstring);
    } else {
        lhs_type = ML_VAL_STRING;
        lhs_val = lhs.tokenstring;
    }
} else {
    v = lhs.operator;
    lhs_val = ds_map_find_value(VARMAP, v.str);
    lhs_type = v.type
}
var exact_operator, argstring;

argstring = lhs_type + "$" + mhs_type + "$" + rhs_type;

exact_operator = _ML_PARSE_GetFullFunction(op, argstring)
if (exact_operator < 0) {
    ML_RaiseException(ML_EXCEPT_ARGTYPE,argument0.tokenpos,
        "Invalid argument type for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos));
    return 0;
} 
ret = script_execute(exact_operator.functionscript,lhs_val,mhs_val,rhs_val);
//create "temp" token with lhs_val:
lhs.tokenstring = ret;
lhs.tokentype = ML_TT_VALUE;
lhs.operator = exact_operator.rettype;
