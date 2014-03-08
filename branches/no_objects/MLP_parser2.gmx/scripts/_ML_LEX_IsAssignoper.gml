var vstr, ret, prevtok, t;
prevtok = argument1;
vstr = string(_ML_LiTok_GetVal(argument0));
if !ds_map_exists(P_ASSIGNOPER, vstr) return false;
ret = false;
if (prevtok >= 0) {
    switch (_ML_LiTok_GetType(prevtok)) {
    case ML_TT_VARIABLE:
        ret = true;
    break;
    }
}
return ret;
