///ML_AddUnaryOper(operator, precedence,script,returntype, valtype,[ affix])

/*
**  Usage:
**      ML_AddUnaryOper(operator, precedence,script,returntype, valtype,[ affix])
**
**  Arguments:
**      operator    string used to identify the operator
**      script      script id
**      returntype  return type of the operator
**      valtype     type of argument
**      affix       affix of operator (default is prefix/ML_UO_PREFIX)
**
**  Returns:
**      ID to the new "operator type" used in further functions
**
**  Notes:
*/

var o;
if (ds_map_exists(P_UNOPER,argument[0])) {
    o = ds_map_find_value(P_UNOPER, argument[0]);
    _ML_LiF_AddSig(o, argument[4],_ML_AddUnarySig(argument[2], argument[3], argument[4]));
} else {
    var affix;
    affix = ML_UO_PREFIX;
    if (argument_count > 5) affix = argument[5];
    o = _ML_NewUnaryOper(argument[0], argument[1], argument[2], argument[3], argument[4], affix);
    ds_map_add(P_UNOPER, argument[0], o);
}
return o;
