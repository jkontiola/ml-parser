var vstr, ret, prevtok, t;
prevtok = argument1;
vstr = argument0.tokenstring;

if !ds_map_exists(P_ASSIGNOPER, vstr) return false;
ret = false;
if (prevtok >= 0) {
    switch (prevtok.tokentype) {
    case ML_TT_VARIABLE:
        ret = true;
    break;
    }
}
return ret;
