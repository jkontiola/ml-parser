//   ML_AddUnaryOper(operator,script,returntype, lhstype, rhstype, assoc)


with (instance_create(0,0,ML_objUnaryOperator)) {

    str = argument0;
    precedence = argument1;
    ds_map_add(ActualFunctions, argument4 , _ML_AddUnarySig(argument2, argument3, argument4));
    affix = argument5;
    
    if (affix == ML_UO_PREFIX) {
        assoc = ML_O_RIGHTASSOC;
    } else {
        assoc = ML_O_LEFTASSOC;
    }
    
    return id;
}
