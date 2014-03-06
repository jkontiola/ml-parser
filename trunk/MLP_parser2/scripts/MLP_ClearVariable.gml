///MLP_ClearVariable() 
//Clears all variables - DOES NOT CLEAR MAP WITH VALUES

repeat (ds_map_size(P_VARIABLE)) {
    MLP_RemVariableStr(ds_map_find_first(P_VARIABLE));
}
