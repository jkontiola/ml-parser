///ML_Execute(parser, compile)
/// @argType    r, r
/// @returnType real
/// @hidden     false


/*
**  Usage:
**      ML_Execute(parser, compile)
**
**  Arguments:
**      parser      parser index
**      compile     compiled expression
**
**  Returns:
**      Result object
**
**  Notes:
*/



var result = _ML_LiRO_Create();
var rpn = ds_list_find_value(argument1, 1);


if (ML_NoException(parser)) {
    var ans = _ML_Parse(argument0, rpn);
    
    if (ML_NoException(parser)) {
        _ML_LiRO_SetFinal(result, ans);
        _ML_LiRO_SetCalculated(result, true);
    }

}

return result;
