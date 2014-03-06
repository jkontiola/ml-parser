if (abs(argument0) > 1) {
    MLP_RaiseException(MLP_EXCEPT_CALC,-1,"argument out of range for arctan( " + string(argument0) + " )");
    return argument0;
}
return arctan(argument0);
