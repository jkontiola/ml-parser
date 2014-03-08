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
        } else if (_ML_LEX_Alpha(c) || c == "_") {
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if !(_ML_LEX_Word(tc)) break;
                l += 1;
            }
            l -= 1;
        } else if (_ML_LEX_Digit(c)) { 
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if (!_ML_LEX_Digit(tc) && tc != ".") break;
                l += 1;
            }
            l-=1;
        } else if (_ML_LEX_Punct(c)) {
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
            ML_RaiseException(ML_EXCEPT_CHAR,p,"unknown charcter: '"+c+"' at "+string(p));
            l = _ML_FirstStringPos(str," ","(",")") - 1;
        }
        if (l <= 0) l = string_length(str);
        tokenstr = string_copy(str,1,l);
        _ML_LEX_TokenAdd(tokenstr,p);
    }
    str = string_delete(str,1,l);
    p += l;
}
_ML_LEX_TokenAdd("",p,ML_TT_EOL);
if (!ML_NoException()) return tokenlist;

//now for each token determine it's type:
var i, tok, v, prevtok;
s = ds_list_size(tokenlist) - 1;
//first token is special, no binary, no prevtoken:
tok = ds_list_find_value(tokenlist, 0)
if (string(_ML_LiTok_GetVal(tok)) == "("){
    v = ML_TT_LEFTP;
} else if _ML_LEX_IsFunction(tok, -1) {
    v = ML_TT_FUNCTION;
} else if (_ML_LEX_IsUnoper(tok, -1)) {
    v = ML_TT_UNARY;
} else if _ML_LEX_IsVariable(tok, -1) {
    v = ML_TT_VARIABLE;
} else if _ML_LEX_IsValue(tok, -1 ){
    v = ML_TT_VALUE;
} else {
    v = ML_TT_UNKNOWN;
}

_ML_LEX_TokenSetType(tok, v);

if (!ML_NoException()) return tokenlist;
//middle tokens
prevtok = tok;
for (i = 1; i < s; i += 1) {
    tok = ds_list_find_value(tokenlist, i);
    if (string(_ML_LiTok_GetVal(tok)) == ";") {
        v = ML_TT_EXPRTERMINATOR;
    } else if (string(_ML_LiTok_GetVal(tok))  == ",") {
        v = ML_TT_COMMA;
    } else if (string(_ML_LiTok_GetVal(tok)) == "("){
        v = ML_TT_LEFTP;
    } else if (string(_ML_LiTok_GetVal(tok)) == ")") {
        v = ML_TT_RIGHTP;
    }else if _ML_LEX_IsFunction(tok, prevtok) {
        v = ML_TT_FUNCTION;
    } else if _ML_LEX_IsVariable(tok, prevtok) {
        v = ML_TT_VARIABLE;
    } else if _ML_LEX_IsValue(tok, prevtok){
        v = ML_TT_VALUE;
    } else if (_ML_LEX_IsBinoper(tok, prevtok)) {
        v = ML_TT_BINARY;    
    } else if (_ML_LEX_IsUnoper(tok, prevtok)) {
        v = ML_TT_UNARY;
    } else if (_ML_LEX_IsAssignoper(tok, prevtok)) {
        v = ML_TT_ASSIGN;
    } else if (_ML_LEX_IsTernOper(tok, prevtok)) {
        v = ML_TT_TERNARY1;
    } else if (_ML_LEX_IsTernOper2(tok, prevtok)) {
        v = ML_TT_TERNARY2
    } else {
        v = ML_TT_UNKNOWN;
    }
    _ML_LEX_TokenSetType(tok, v);
    if (!ML_NoException()) return tokenlist;
    prevtok = tok;
}

return tokenlist;
