if (argument0 < 0) {
    MLP_RaiseException(MLP_EXCEPT_CALC,-1,"complex answer to root( " + string(argument0) + " )");
    return argument0;
}
return sqrt(argument0);
