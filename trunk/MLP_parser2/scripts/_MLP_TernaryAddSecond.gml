var entry;
if (ds_map_exists(P_TERNOPER2,argument0)) {
    entry = ds_map_find_value(P_TERNOPER2, argument0);
} else {
    entry = ds_list_create();
    ds_map_add(P_TERNOPER2, argument0, entry);
}
ds_list_add(entry, argument1);
