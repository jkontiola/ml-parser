var vstr, p, ret, prevtok, t;
prevtok = argument1;
vstr = argument0.tokenstring;

if !ds_map_exists(P_TERNOPER2, vstr) return false;
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
    case ML_TT_VARIABLE:
    case ML_TT_VALUE:
        ret = true;
    break;
    }
}
return ret;
