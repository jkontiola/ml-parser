var op, lhs, rhs, lhs_val, rhs_val, ret, lhs_type, rhs_type;

op = _ML_LiTok_GetOperator(argument0);
if (ds_stack_size(argument1) < 2) {
    ML_RaiseException(ML_EXCEPT_BINOPERATOR,_ML_LiTok_GetPos(argument0),
            "missing value for'" + string(_ML_LiTok_GetVal(argument0)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;   
}
rhs = ds_stack_pop(argument1);
if (_ML_LiTok_GetType(rhs) == ML_TT_VALUE) {
    rhs_val = _ML_LiTok_GetVal(rhs);
    rhs_type = _ML_LiTok_GetOperator(rhs);
} else {
    var v = _ML_LiTok_GetOperator(rhs);
    rhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    rhs_type = _ML_LiVar_GetType(v);
}
lhs = ds_stack_top(argument1);
var v;
v = _ML_LiTok_GetOperator(lhs);

if (_ML_LiTok_GetType(lhs) != ML_TT_VARIABLE || _ML_LiVar_GetReadonly(v)) {
    ML_RaiseException(ML_EXCEPT_ASSIGN,_ML_LiTok_GetPos(argument0),
            "Left hand side is not assignable '" + string(_ML_LiTok_GetVal(lhs)) +"' at " +string(_ML_LiTok_GetPos(lhs)));
    return 0;
}

lhs_type = _ML_LiVar_GetType(v);

var exact_operator, argstring;

argstring = lhs_type + "$" + rhs_type;
exact_operator = _ML_LiF_GetFunc(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(argument0),
        "Invalid assignment type for '" + string(_ML_LiTok_GetVal(argument0)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;
} 
ret = script_execute(_ML_LiS_GetScript(exact_operator),_ML_Li_GetName(v),rhs_val);
//create "temp" token with lhs_val:
_ML_LiTok_SetString(lhs, ret);
_ML_LiTok_SetType(lhs, ML_TT_VALUE);
_ML_LiTok_SetOperator(lhs, _ML_LiS_GetRettype(exact_operator));
