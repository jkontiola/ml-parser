if (argument1 == 0 ) {
    ML_RaiseException_CurParser(ML_EXCEPT_CALC,-1,"Division by 0: " + string(argument0) + " / " + string(argument1))
    return argument0;
}


return argument0 / argument[1];
