var vstr, p, ret, prevtok, t;
prevtok = argument1;
vstr = string(_ML_LiTok_GetVal(argument0));

if !ds_map_exists(P_BINOPER, vstr) return false;
ret = false;
if (prevtok >= 0) {
    switch (_ML_LiTok_GetType(prevtok)) {
    case ML_TT_UNARY:
        if (_ML_LiUOp_GetAffix(_ML_LiTok_GetOperator(prevtok)) == ML_UO_POSTFIX) {
            ret = true;
        }
    break;
    case ML_TT_RIGHTP:
        ret = true;
    break;
    case ML_TT_VARIABLE:
        ret = true;
    break;
    case ML_TT_VALUE:
        ret = true;
    break;
    }
}
return ret;