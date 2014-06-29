#define execute_all_parsers
///execute_all_parsers(parsers, compilelist, result_objects);

var parsers = argument0;
var compiles = argument1;
var results = argument2;
var parser, compile;
for (var i = ds_list_size(results)-1; i >= 0; --i) {
    ML_ResultCleanup(ds_list_find_value(results, i));
}
ds_list_clear(results);

var s = min(ds_list_size(compiles), ds_list_size(parsers));
for (var i =0; i< s; ++i) {
    parser = ds_list_find_value(parsers, i);
    compile = ds_list_find_value(compiles, i);
    //ML_ClearExceptions(parser);
    ds_list_add(results, ML_Execute(parser, compile));
}
