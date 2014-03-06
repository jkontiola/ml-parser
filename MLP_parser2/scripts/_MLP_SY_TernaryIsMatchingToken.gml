//MLP_SY_TernaryIsMatchingToken(token1, map)
//tests if token is in map
var t1, o1, entry;
t1 = argument0;
entry = argument1;
if (t1.tokentype != MLP_TT_TERNARY1) return false;
o1 = t1.operator;
return (ds_list_find_index(entry, o1) >= 0);

