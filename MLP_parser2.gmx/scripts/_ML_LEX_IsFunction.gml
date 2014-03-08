var vstr, p, ret, prevtok, t;
prevtok = argument1;
vstr = string(_ML_LiTok_GetVal(argument0));
return ds_map_exists(P_FUNCTION, vstr);
