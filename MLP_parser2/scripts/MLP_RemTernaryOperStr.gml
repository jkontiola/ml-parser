///MLP_RemTernaryOperStr(Ternary operator string)

var op, entry;
op = ds_map_find_value(P_TERNOPER,argument0);
with (op) {
    MLP_RemTernaryOper();
    instance_destroy();
}
