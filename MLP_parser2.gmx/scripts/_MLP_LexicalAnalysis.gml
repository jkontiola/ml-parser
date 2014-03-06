var str, l , s, level, c, tc, tokenstr, tstr, p, tokelist;
str = functionstring;
l = 0;
level = 0;
maxlevel = 0;

//clean up old data
tokenlist = ds_list_create();
p = 1;
while (string_length(str) > 0) {
    c = string_char_at(str,1);
    l = 1;
    if (c != " ") {
        if (c == '"' || c == "'") {
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if (tc == c) break;
                l+=1;
            }
        } else if (_MLP_LEX_Alpha(c) || c == "_") {
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if !(_MLP_LEX_Word(tc)) break;
                l += 1;
            }
            l -= 1;
        } else if (_MLP_LEX_Digit(c)) { 
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if (!_MLP_LEX_Digit(tc) && tc != ".") break;
                l += 1;
            }
            l-=1;
        } else if (_MLP_LEX_Punct(c)) {
            l = 2;
            tstr = c;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                tstr += tc;
                if (!ds_map_exists(P_ASSIGNOPER,tstr) && !ds_map_exists(P_UNOPER,tstr) && !ds_map_exists(P_BINOPER,tstr) 
                    && !ds_map_exists(P_TERNOPER, tstr) && !ds_map_exists(P_TERNOPER2, tstr) ) break;
                l += 1;
            }
            l -= 1;
        } else {
            MLP_RaiseException(MLP_EXCEPT_CHAR,p,"unknown charcter: '"+c+"' at "+string(p));
            l = _MLP_FirstStringPos(str," ","(",")") - 1;
        }
        if (l <= 0) l = string_length(str);
        tokenstr = string_copy(str,1,l);
        _MLP_LEX_TokenAdd(tokenstr,p);
    }
    str = string_delete(str,1,l);
    p += l;
}
with (_MLP_LEX_TokenAdd("",p)) {
    tokentype = MLP_TT_EOL;
}
if (!MLP_NoException()) return tokenlist;

//now for each token determine it's type:
var i, tok, v, prevtok;
s = ds_list_size(tokenlist) - 1;
//first token is special, no binary, no prevtoken:
tok = ds_list_find_value(tokenlist, 0)
if (tok.tokenstring == "("){
    v = MLP_TT_LEFTP;
} else if _MLP_LEX_IsFunction(tok, -1) {
    v = MLP_TT_FUNCTION;
} else if (_MLP_LEX_IsUnoper(tok, -1)) {
    v = MLP_TT_UNARY;
} else if _MLP_LEX_IsVariable(tok, -1) {
    v = MLP_TT_VARIABLE;
} else if _MLP_LEX_IsValue(tok, -1 ){
    v = MLP_TT_VALUE;
} else {
    v = MLP_TT_UNKNOWN;
}
with (tok) {
    _MLP_LEX_TokenSetType(v);
}
if (!MLP_NoException()) return tokenlist;
//middle tokens
prevtok = tok;
for (i = 1; i < s; i += 1) {
    tok = ds_list_find_value(tokenlist, i);
    if (tok.tokenstring == ";") {
        v = MLP_TT_EXPRTERMINATOR;
    } else if (tok.tokenstring == ",") {
        v = MLP_TT_COMMA;
    } else if (tok.tokenstring == "("){
        v = MLP_TT_LEFTP;
    } else if (tok.tokenstring == ")") {
        v = MLP_TT_RIGHTP;
    }else if _MLP_LEX_IsFunction(tok, prevtok) {
        v = MLP_TT_FUNCTION;
    } else if _MLP_LEX_IsVariable(tok, prevtok) {
        v = MLP_TT_VARIABLE;
    } else if _MLP_LEX_IsValue(tok, prevtok){
        v = MLP_TT_VALUE;
    } else if (_MLP_LEX_IsBinoper(tok, prevtok)) {
        v = MLP_TT_BINARY;    
    } else if (_MLP_LEX_IsUnoper(tok, prevtok)) {
        v = MLP_TT_UNARY;
    } else if (_MLP_LEX_IsAssignoper(tok, prevtok)) {
        v = MLP_TT_ASSIGN;
    } else if (_MLP_LEX_IsTernOper(tok, prevtok)) {
        v = MLP_TT_TERNARY1;
    } else if (_MLP_LEX_IsTernOper2(tok, prevtok)) {
        v = MLP_TT_TERNARY2
    } else {
        v = MLP_TT_UNKNOWN;
    }
    with (tok) {
        _MLP_LEX_TokenSetType(v);
    }
    if (!MLP_NoException()) return tokenlist;
    prevtok = tok;
}

return tokenlist;
