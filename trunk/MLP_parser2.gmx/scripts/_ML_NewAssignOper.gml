//   _ML_NewAssignOper(operator, precedence, script,returntype, lhstype, rhstype, assoc)


var ind = _ML_LiAOp_Create(argument0, argument1, argument6);
_ML_LiF_AddSig(ind, argument4 +"$" + argument5, _ML_AddAssignSig(argument2, argument3, argument4, argument5));
return ind;
