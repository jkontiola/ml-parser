///MLP_AddTernaryOper(operator1, operator2, precedence, script, returntype, lhstype, mhstype, rhstype[, assoc])

/*
**  Usage:
**      MLP_AddTernaryOper(operator1, operator2, precedence, script, returntype, lhstype, mhstype, rhstype[, assoc])
**
**  Arguments:
**      operator1   string used to identify the first part of ternary operator
**      operator2   string used to identify the second part of ternary operator
**      precedence  the precendence of the operator
**      script      script id
**      returntype  return type of the operator
**      lhstype     type of left hand side
**      mhstype     type of middle hand side
**      rhstype     type of right hand side
**      assoc       associtivity of operator (default is right/MLP_O_RIGHTASSOC)
**
**  Returns:
**      ID to the new "operator type" used in further functions
**
**  Notes:
**      First operator must be unique
*/

var o;
if (ds_map_exists(P_TERNOPER,argument[0])) {
    o = ds_map_find_value(P_TERNOPER, argument[0]);
    with (o) {
        ds_map_add(ActualFunctions, argument[5] + "$" + argument[6] + "$" + argument[7], 
                    _MLP_AddTernarySig(argument[3], argument[4], argument[5], argument[6], argument[7]));
    }
} else {
    var assoc;
    assoc = MLP_O_RIGHTASSOC;
    if (argument_count > 8) assoc = argument[8];
    o = _MLP_NewTernaryOper(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], assoc);
    ds_map_add(P_TERNOPER, argument[0], o);
    _MLP_TernaryAddSecond(argument[1],o);
}
return o;
