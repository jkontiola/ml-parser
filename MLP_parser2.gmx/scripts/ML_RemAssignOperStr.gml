///RemAssignOperStr(Assign operator string)

var op;
op = ds_map_find_value(P_ASSIGNOPER,argument0);
with (op) {
    ML_RemAssignOper();
}
