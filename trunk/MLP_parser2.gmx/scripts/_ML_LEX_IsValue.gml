///_ML_LEX_IsValue(parser, str, prevtok)
/// @argType    r,s,r
/// @returnType r
/// @hidden     true

var vstr, i, s, prevtok;
vstr = string(_ML_LiTok_GetVal(argument1));
prevtok = argument2;
if (vstr == ".") return false;
var start_c;
start_c = string_char_at(vstr,1);
if (start_c == "'" || start_c == '"') return true;


s = string_length(vstr);
i = 1;
//before dot:
var c;
do {
    c = string_char_at(vstr,i);
    i+=1;
    if (c == ".") break;
    if !_ML_LEX_Digit(c) return false;
    
} until (i > s)
if (c = "." && i <= s) {
    do {
        c = string_char_at(vstr,i);
        if !_ML_LEX_Digit(c) return false;
        i+=1;
    } until (i > s)
}

return true;
