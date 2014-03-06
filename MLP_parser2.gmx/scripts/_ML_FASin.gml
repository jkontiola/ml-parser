if (abs(argument0) > 1) {
    ML_RaiseException(ML_EXCEPT_CALC,-1,"argument out of range for arcsin( " + string(argument0) + " )");
    return argument0;
}
return arcsin(argument0);
