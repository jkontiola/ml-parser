//   MLP_AddUnaryOper(operator,script,returntype, lhstype, rhstype, assoc)


with (instance_create(0,0,MLP_objUnaryOperator)) {

    str = argument0;
    precedence = argument1;
    ds_map_add(ActualFunctions, argument4 , _MLP_AddUnarySig(argument2, argument3, argument4));
    affix = argument5;
    
    if (affix == MLP_UO_PREFIX) {
        assoc = MLP_O_RIGHTASSOC;
    } else {
        assoc = MLP_O_LEFTASSOC;
    }
    
    return id;
}
