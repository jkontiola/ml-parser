///ML_RemBinaryOperStr(Binary operator string)

var op;
op = ds_map_find_value(P_BINOPER,argument0);
with (op) {
    ML_RemBinaryOper();
}
