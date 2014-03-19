///_ML_LexicalAnalysis(parser)
/// @argType    r
/// @returnType r
/// @hidden     true

var str, s, c, tc, tokenstr, tstr, p, tokenlist;

var l = 0;
var level = 0;
var maxlevel = 0;

//lists
var parser = argument0;
str = _ML_LiP_GetFunctionString(parser);

var P_TERNOPER = _ML_LiP_GetTernOpsTable(parser);
var P_TERNOPER2 = _ML_LiP_GetTernOps2Table(parser);
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(parser);
var P_UNOPER = _ML_LiP_GetUnOpsTable(parser);
var P_BINOPER = _ML_LiP_GetBinOpsTable(parser);
//var P_FUNCTION = _ML_LiP_GetFunctionTable(parser);
//var P_VARIABLE = _ML_LiP_GetVariableTable(parser);


//initialize
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
            l = _ML_FirstStringPos3(str, " ", "(", ")") - 1;
        }
        if (l <= 0) l = string_length(str);
        tokenstr = string_copy(str,1,l);
        _ML_LEX_TokenAdd(tokenlist, tokenstr,p);
    }
    str = string_delete(str,1,l);
    p += l;
}
var eol = _ML_LEX_TokenAdd(tokenlist,"",p);
_ML_LEX_TokenSetType(parser, eol, ML_TT_EOL);
if (!ML_NoException(parser)) return tokenlist;

//now for each token determine it's type:
var i, tok, v, prevtok;
s = ds_list_size(tokenlist) - 1;
//first token is special, no binary, no prevtoken:
tok = ds_list_find_value(tokenlist, 0)
if (string(_ML_LiTok_GetVal(tok)) == "("){
    v = ML_TT_LEFTP;
} else if _ML_LEX_IsFunction(parser, tok, -1) {
    v = ML_TT_FUNCTION;
} else if (_ML_LEX_IsUnoper(parser, tok, -1)) {
    v = ML_TT_UNARY;
} else if _ML_LEX_IsVariable(parser, tok, -1) {
    v = ML_TT_VARIABLE;
} else if _ML_LEX_IsValue(parser, tok, -1 ){
    v = ML_TT_VALUE;
} else {
    v = ML_TT_UNKNOWN;
}
_ML_LEX_TokenSetType(parser, tok, v);

if (!ML_NoException(parser)) return tokenlist;
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
    }else if _ML_LEX_IsFunction(parser, tok, prevtok) {
        v = ML_TT_FUNCTION;
    } else if _ML_LEX_IsVariable(parser, tok, prevtok) {
        v = ML_TT_VARIABLE;
    } else if _ML_LEX_IsValue(parser, tok, prevtok){
        v = ML_TT_VALUE;
    } else if (_ML_LEX_IsBinoper(parser, tok, prevtok)) {
        v = ML_TT_BINARY;    
    } else if (_ML_LEX_IsUnoper(parser, tok, prevtok)) {
        v = ML_TT_UNARY;
    } else if (_ML_LEX_IsAssignoper(parser, tok, prevtok)) {
        v = ML_TT_ASSIGN;
    } else if (_ML_LEX_IsTernOper(parser, tok, prevtok)) {
        v = ML_TT_TERNARY1;
    } else if (_ML_LEX_IsTernOper2(parser, tok, prevtok)) {
        v = ML_TT_TERNARY2
    } else {
        v = ML_TT_UNKNOWN;
    }
    _ML_LEX_TokenSetType(parser, tok, v);
    if (!ML_NoException(parser)) return tokenlist;
    prevtok = tok;
}

return tokenlist;