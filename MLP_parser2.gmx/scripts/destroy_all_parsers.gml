///destroy_all_parsers(list)

var parsers = argument0;
var parser;

for (i = 0; i < ds_list_size(parsers); ++i) {
    parser = ds_list_find_value(parsers, i);
    ML_DestroyParser(parser);
}
