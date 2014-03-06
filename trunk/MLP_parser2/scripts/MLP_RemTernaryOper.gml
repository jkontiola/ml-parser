///MLP_RemTernaryOper();

ds_map_delete(other.P_TERNOPER, str1);
var entry, i;
entry = ds_map_find_value(other.P_TERNOPER2, str2);
i = ds_list_find_index(entry, id);
if (i < 0)  { 
    show_error("Ternary operator removal error", true);
} else {
    ds_list_delete(entry, i);
}
if (ds_list_empty(entry)) {
    ds_map_destroy(entry);
    ds_map_delete(other.P_TERNOPER2, str2);
}
instance_destroy();
