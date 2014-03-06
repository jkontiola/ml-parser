///ML_AddAssignOper(operator, precedence, script, returntype, lhstype, rhstype[, assoc])

/*
**  Usage:
**      ML_AddAssignOper(operator, precedence, script, returntype, lhstype, rhstype[, assoc])
**
**  Arguments:
**      operator    string used to identify the operator
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
if (ds_map_exists(P_ASSIGNOPER,argument0)) {
    o = ds_map_find_value(P_ASSIGNOPER, argument0);
    with (o) {
        ds_map_add(ActualFunctions, argument4 +"$" + argument5, 
                    _ML_AddAssignSig(argument2, argument3, argument4, argument5));
    }
} else {
    var assoc;
    assoc = ML_O_RIGHTASSOC;
    if (argument_count > 6) assoc = argument[6];
    o = _ML_NewAssignOper(argument0, argument1, argument2, argument3, argument4, argument5, assoc);
    ds_map_add(P_ASSIGNOPER, argument0, o);
}
return o;
