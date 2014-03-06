//   ML_NewAssignOper(operator,script,returntype, lhstype, rhstype[, assoc])


with (instance_create(0,0,ML_objAssignOperator)) {

    str = argument0;
    precedence = argument1;
    ds_map_add(ActualFunctions, argument4 +"$" + argument5, _ML_AddAssignSig(argument2, argument3, argument4, argument5));
    assoc = argument6;
    return id;
}
