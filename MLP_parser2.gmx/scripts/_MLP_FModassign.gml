//modulo assign %=
if (argument1 == 0 ) {
    MLP_RaiseException(MLP_EXCEPT_CALC,-1,"Division by 0: " + string(argument0) + " mod " + string(argument1))
    return argument1;
}




var v;
v = ds_map_find_value(VARMAP, argument0) mod argument1;
ds_map_replace(VARMAP, argument0, v);
return v;
