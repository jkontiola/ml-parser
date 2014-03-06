if (argument0 <= 0) {
    MLP_RaiseException(MLP_EXCEPT_CALC,-1,"argument out of range for log( " + string(argument0) + " )");
    return argument0;
}
return log10(argument0);
