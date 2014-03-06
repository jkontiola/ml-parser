
var vstr, i, s, prevtok;
vstr = argument0.tokenstring;
prevtok = argument1;
if (vstr == ".") return false;
var start_c;
start_c = string_char_at(vstr,1);
if (start_c == "'" || start_c == '"') return true;


s = string_length(vstr);
i = 1;
//before dot:
do {
    c = string_char_at(vstr,i);
    i+=1;
    if (c == ".") break;
    if !_MLP_LEX_Digit(c) return false;
    
} until (i > s)
if (c = "." && i <= s) {
    do {
        c = string_char_at(vstr,i);
        if !_MLP_LEX_Digit(c) return false;
        i+=1;
    } until (i > s)
}

return true;
