if (abs(argument0) > 1) {
    ML_RaiseException(ML_EXCEPT_CALC,-1,"argument out of range for arctan( " + string(argument0) + " )");
    return argument0;
}
return arctan(argument0);
