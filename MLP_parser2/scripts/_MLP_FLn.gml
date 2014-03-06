if (argument0 <= 0) {
    MLP_RaiseException(MLP_EXCEPT_CALC,-1,"argument out of range for ln( " + string(argument0) + " )");
    return argument0;
}
return logn(exp(1),argument0);
