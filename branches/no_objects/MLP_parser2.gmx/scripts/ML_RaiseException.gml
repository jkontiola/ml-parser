///ML_RaiseException(Exception,position,[string,token])

/*
**  Usage:
**      ML_RaiseException(Exception,position,[string,token])
**
**  Arguments:
**      Exception   exception id of the exception. (Can be build in or a custom)
**      position    positino of the expression (use -1 if you don't know)
**      string      string containing a textual description of the exception
**      token       token where exception occurs
**
**  Returns:
**
**  Notes:
*/


ErrorFlags = argument[0];
ErrorPosition = argument[1];
if (argument_count > 2) {
    ErrorString = argument[2];
    if (argument_count > 3) {
        ErrorToken = argument[3];
    }
}
