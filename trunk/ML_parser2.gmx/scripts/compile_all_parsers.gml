#define compile_all_parsers
///compile_all_parsers(parserlist, compilelist)

var parsers = argument0;
var compilelist = argument1;
var parser;
var comp;


for (var i = 0; i < ds_list_size(compilelist); ++i) {
    comp = ds_list_find_value(compilelist, i);
    //parser = ds_list_find_value(parsers, i);
    ML_CompileCleanup(comp);
}
ds_list_clear(compilelist);

for (var i = 0; i < ds_list_size(parsers); ++i) {
    parser = ds_list_find_value(parsers, i);
    ML_ClearExceptions(parser);
    comp = ML_Compile(parser, ML_GetExprString(parser));
    ds_list_add(compilelist, comp);
}
