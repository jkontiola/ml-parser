if (argument0 <= 0) {
    ML_RaiseException(ML_EXCEPT_CALC,-1,"argument out of range for log2( " + string(argument0) + " )");
    return argument0;
}
return log2(argument0);
