//bitxor-assign ^=

var v;
v = ds_map_find_value(VARMAP, argument0) ^ argument1;
ds_map_replace(VARMAP, argument0, v);
return v;
