var vstr, ret, prevtok, t, op;
prevtok = argument1;
vstr = argument0.tokenstring;
if !ds_map_exists(P_UNOPER, vstr) return false;
op = ds_map_find_value(P_UNOPER,vstr);
if (prevtok >= 0) {
    ret = false;
    if (op.affix == ML_UO_PREFIX) {
        switch (prevtok.tokentype) {
        case ML_TT_BINARY:
            ret = true;
        break;
        case ML_TT_UNARY:
            if (prevtok.operator.affix == ML_UO_PREFIX) {
                ret = true;
            }
        break;
        case ML_TT_LEFTP:
            ret = true;
        break;
        case ML_TT_ASSIGN:
            ret = true;
        break;
        case ML_TT_COMMA:
            ret = true;
        break;
        case ML_TT_ARGSEP:
            ret = true;
        break;
        }
    } else {
        switch (prevtok.tokentype) {
        case ML_TT_UNARY:
            if (prevtok.operator.affix == ML_UO_POSTFIX) {
                ret = true;
            }
        break;
        
        case ML_TT_RIGHTP:
            ret = true;
        break;
        case ML_TT_FUNCTION:
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
} else {
    ret = (op.affix == ML_UO_PREFIX);
}
return ret;
