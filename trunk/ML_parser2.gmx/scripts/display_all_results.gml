///display_all_parsers(parsers, results)

var parsers = argument0;
var results = argument1;
var num = min(ds_list_size(parsers), ds_list_size(results));
var result, parser;
for (var i = 0; i < num; i += 1) {
    parser = ds_list_find_value(parsers, i);
    result = ds_list_find_value(results, i);
    if (ML_ResObj_HasAnswer(result)) {
        draw_set_color(c_black);
    } else {
        draw_set_color(c_red);
    }
    draw_text(0, i * 56,ML_GetExprString(parser) );
    draw_text(30,i * 56 + 14, ML_LastExceptionString(parser))
    draw_text(30,i * 56 + 28, "ans = " + string(ML_ResObj_GetFinalAnswer(result)));
    draw_set_color(c_black);
    draw_line(0,i*56,room_width,i*56);
}
