//ML_FirstStringPos(str, token1,token2,...,token16)

var num, str, pos;
num = argument_count - 1;
str = argument[0];

pos = 0;

var i;
for (i = 1; i <= num; i+= 1) {
    tp = string_pos(argument[i], str);
    if (tp != 0 && (tp < pos || pos == 0)) {
        pos = tp;
    }
}

return pos;
