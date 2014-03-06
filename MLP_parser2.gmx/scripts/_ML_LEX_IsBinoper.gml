var vstr, p, ret, prevtok, t;
prevtok = argument1;
vstr = argument0.tokenstring;

if !ds_map_exists(P_BINOPER, vstr) return false;
p = argument0.tokenpos;
ret = false;
if (p >= 0) {
    switch (prevtok.tokentype) {
    case ML_TT_UNARY:
        if (prevtok.operator.affix == ML_UO_POSTFIX) {
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
