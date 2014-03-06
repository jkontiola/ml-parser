var vstr, p, ret, prevtok, t;
prevtok = argument1;
vstr = argument0.tokenstring;

if !ds_map_exists(P_TERNOPER2, vstr) return false;
p = argument0.tokenpos;
ret = false;
if (p >= 0) {
    switch (prevtok.tokentype) {
    case MLP_TT_UNARY:
        if (prevtok.operator.affix == MLP_UO_POSTFIX) {
            ret = true;
        }
    break;
    case MLP_TT_RIGHTP:
    case MLP_TT_VARIABLE:
    case MLP_TT_VALUE:
        ret = true;
    break;
    }
}
return ret;
