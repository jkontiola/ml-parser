///MLP_VM_RemVar(key)

/*
**  Usage:
**      MLP_VM_RemVar(key)
**
**  Arguments:
**      key     Key/Pointer to the variable to remove
**
**  Returns:
**
**  Notes:
**      also removes all variables pointing to this entry
*/

var s, v, k, ind;
s = ds_map_size(P_VARIABLE);
k = argument0;

if (s > 0) {
    v = ds_map_find_first(P_VARIABLE);
    repeat (s) { 
        ind = ds_map_find_value(P_VARIABLE, v);
        with (ind) {
            if (str == k) {
                MLP_RemVariable();
            }
        }
        v = ds_map_find_next(P_VARIABLE, v);
    }
}
ds_map_delete(VARMAP, k);

return list;
