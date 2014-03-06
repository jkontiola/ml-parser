with (instance_create(0,0,MLP_objToken)) {
    tokenstring = argument[0];
    tokenpos = argument[1];
    ds_list_add(other.tokenlist,id);
    if (argument_count > 2) {
        tokentype = argument[2];
        if (argument[2] == MLP_TT_UNKNOWN) MLP_RaiseException(MLP_EXCEPT_UNKNOWNTOKEN, tokenpos, "unknown tokentype '" +tokenstring+ "' at "+string(tokenpos));
    }
    return id;
}
return noone;
