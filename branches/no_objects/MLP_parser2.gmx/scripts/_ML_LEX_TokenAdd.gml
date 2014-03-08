

var ind = _ML_LiTok_Create(argument[0], argument[1]);
ds_list_add(tokenlist, ind);
if (argument_count > 2) {
    if (argument[2] == ML_TT_UNKNOWN) {
        ML_RaiseException(ML_EXCEPT_UNKNOWNTOKEN, argument[1] , "unknown tokentype '" +string(argument[0])+ "' at "+string(argument[1]));
    } else {
        _ML_LiTok_SetType(ind, argument[2]);
    }
}

return ind;

