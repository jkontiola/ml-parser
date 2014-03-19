///display_all_parsers(list)

var parsers = argument0;
var parser;
var num;
num = ds_list_size(parsers);
for (var i = 0; i < num; i += 1) {
    parser = ds_list_find_value(parsers, i);
    if (ML_HasAnswer(parser)) {
        draw_set_color(c_black);
    } else {
        draw_set_color(c_red);
    }
    draw_text(0, i * 56,ML_GetExprString(parser) );
    draw_text(30,i * 56 + 14, ML_LastExceptionString(parser))
    draw_text(30,i * 56 + 28, "ans = " + string(ML_GetFinalAnswer(parser)));
    draw_set_color(c_black);
    draw_line(0,i*56,room_width,i*56);
}
