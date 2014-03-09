///_ML_LiP_Create(function, map)

var ind = ds_list_create();
ds_list_add(ind, ds_map_create()); //binops 0
var tunop = ds_map_create();
ds_list_add(ind, tunop); //unop 1
ds_list_add(ind, ds_map_create()); //assign 2
ds_list_add(ind, ds_map_create()); //ternop 3
ds_list_add(ind, ds_map_create()); //ternop2 4
ds_list_add(ind, ds_map_create()); //function 5
ds_list_add(ind, ds_map_create()); //variable 6

ds_list_add(ind, argument0); //executablestring 7
ds_list_add(ind, argument1); //variable-map 8
ds_list_add(ind, 0); //answer 9
ds_list_add(ind, ds_list_create()); //all answers list 10
ds_list_add(ind, 0); //Error flags 11
ds_list_add(ind, -1); //error pos 12
ds_list_add(ind, ""); //error string 13
ds_list_add(ind, noone); //error token 14
ds_list_add(ind, false); //calculated 15

return ind;
