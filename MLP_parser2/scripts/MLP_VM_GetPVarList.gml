///MLP_VM_GetPVarList(key)

/*
**  Usage:
**      MLP_VM_GetPVarList(key)
**
**  Arguments:
**      key     key/pointer to check for
**
**  Returns:
**      ds_list containing id of all variables pointing to "key"
**
**  Notes:
**      - Creates list, you are responsible for destroying the list.
**
**  Notes:
*/

var s, list, v, k, ind;
s = ds_map_size(P_VARIABLE);
list = ds_list_create();
k = argument0;

if (s > 0) {
    v = ds_map_find_first(P_VARIABLE);
    repeat (s) { 
        ind = ds_map_find_value(P_VARIABLE, v);
        with (ind) {
            if (str == k) {
                ds_list_add(list, id);
            }
        }
        v = ds_map_find_next(P_VARIABLE, v);
    }
}


return list;
