if (argument0 mod pi == 0 ) {
    MLP_RaiseException(MLP_EXCEPT_CALC,-1,"complex answer to tangent( " + string(argument0) + " )");
    return argument0;
}


return tan(argument0);
