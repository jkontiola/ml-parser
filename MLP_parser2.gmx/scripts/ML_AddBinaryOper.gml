///ML_AddBinaryOper(operator, precedence, script, returntype, lhstype, rhstype[, assoc])

/*
**  Usage:
**      ML_AddBinaryOper(operator, precedence, script, returntype, lhstype, rhstype[, assoc])
**
**  Arguments:
**      operator    string used to identify the operator
**      precedence  the precendence of the operator
**      script      script id
**      returntype  return type of the operator
**      lhstype     type of left hand side
**      rhstype     type of right hand side
**      assoc       associtivity of operator (default is right/ML_O_LEFTASSOC
**
**  Returns:
**      ID to the new "operator type" used in further functions
**
**  Notes:
*/
var o;
if (ds_map_exists(P_BINOPER,argument[0])) {
    o = ds_map_find_value(P_BINOPER, argument[0]);
    _ML_LiF_AddSig(o, argument[4] +"$" + argument[5], 
                _ML_AddBinarySig(argument[2], argument[3], argument[4], argument[5]));
} else {
    var assoc;
    assoc = ML_O_LEFTASSOC;
    if (argument_count > 6) assoc = argument[6];
    o = _ML_NewBinaryOper(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], assoc);
    ds_map_add(P_BINOPER, argument[0], o);
}
return o;
