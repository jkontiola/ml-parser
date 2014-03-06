//   MLP_NewAssignOper(operator,script,returntype, lhstype, rhstype[, assoc])


with (instance_create(0,0,MLP_objAssignOperator)) {

    str = argument0;
    precedence = argument1;
    ds_map_add(ActualFunctions, argument4 +"$" + argument5, _MLP_AddAssignSig(argument2, argument3, argument4, argument5));
    assoc = argument6;
    return id;
}
