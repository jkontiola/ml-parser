///ML_ClearVariable() 
//Clears all variables - DOES NOT CLEAR MAP WITH VALUES

repeat (ds_map_size(P_VARIABLE)) {
    ML_RemVariableStr(ds_map_find_first(P_VARIABLE));
}
