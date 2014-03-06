//   ML_NewBinaryOper(operator1, operator2,precedence,script,returntype, lhstype, mhstype, rhstype, assoc)


with (instance_create(0,0,ML_objTernaryOperator)) {
    str = argument0+argument1;
    str1 = argument0;
    str2 = argument1;
    precedence = argument2;
    ds_map_add(ActualFunctions, argument5 +"$" + argument6 + "$" +argument7, 
            _ML_AddTernarySig(argument3, argument4, argument5, argument6,argument7));
    assoc = argument8;
    return id;
}
