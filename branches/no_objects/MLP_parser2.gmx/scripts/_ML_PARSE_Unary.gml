var op, lhs, lhs_val, ret, lhs_type;

op = _ML_LiTok_GetOperator(argument0);
if (ds_stack_size(argument1) < 1) {
    ML_RaiseException(ML_EXCEPT_UNOPERATOR,_ML_LiTok_GetPos(argument0),
            "missing value for '" + string(_ML_LiTok_GetVal(tokenstring)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;   
}
lhs = ds_stack_top(argument1);
if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
    lhs_val = _ML_LiTok_GetVal(lhs);
    lhs_type = _ML_LiTok_GetOperator(lhs);
} else {
    var v = _ML_LiTok_GetOperator(lhs);
    lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    lhs_type = _ML_LiVar_GetType(v);
}

var exact_operator, argstring;

argstring = lhs_type;

exact_operator = _ML_LiF_GetFunc(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(argument0),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(argument0)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;
} 

ret = script_execute(_ML_LiS_GetScript(exact_operator),lhs_val);

//create "temp" token with lhs_val:
_ML_LiTok_SetString(lhs, ret);
_ML_LiTok_SetType(lhs, ML_TT_VALUE);
_ML_LiTok_SetOperator(lhs, _ML_LiS_GetRettype(exact_operator));
