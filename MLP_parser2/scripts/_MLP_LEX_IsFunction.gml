var vstr, p, ret, prevtok, t;
prevtok = argument1;
vstr = argument0.tokenstring;
if !ds_map_exists(P_FUNCTION, vstr) return false;
/*p = argument0.tokenpos;
if (p >= 0) {
    ret = false;
    switch (prevtok.tokentype) {
    case MLP_TT_BINARY:
        ret = true;
    break;
    case MLP_TT_UNARY:
        if (prevtok.operator.affix == MLP_UO_PREFIX) {
            ret = true;
        }
    break;
    case MLP_TT_LEFTP:
        ret = true;
    break;
    case MLP_TT_ARGSEP:
        ret = true;
    break;
    }
} else {
    ret = true;
}*/
return true;
