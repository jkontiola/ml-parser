///MLP_RemVariableStr(VarString) 
//destroys variable - DOES NOT DESTROY IN MAP WITH VALUES

with (ds_map_find_value(P_VARIABLE,argument0)) {
    MLP_RemVariable();
}

