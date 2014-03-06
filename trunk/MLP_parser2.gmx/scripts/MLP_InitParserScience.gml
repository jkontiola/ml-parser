///MLP_InitParserScience(VarMap)

/*
**  Usage:
**      MLP_InitParserScience(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates Parser with functions adapted for scientific calculations
**      Ownership of the variable map is NOT in hand of the parser
**      Adds "__varpi" and "__vare" variables to varmap, which contain "pi" and "e" resp.
*/

with (instance_create(0,0,MLP_objParser)) {
    VARMAP = argument0;

    MLP_AddUnaryOper("!",18,_MLP_FFactorian, MLP_VAL_REAL, MLP_VAL_REAL, MLP_UO_POSTFIX);
    MLP_AddUnaryOper("%",18,_MLP_FProcent, MLP_VAL_REAL, MLP_VAL_REAL, MLP_UO_POSTFIX);
    
    MLP_AddUnaryOper("-",17,_MLP_FNegate, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddUnaryOper("+",17,_MLP_FPositive, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddUnaryOper("~",17,_MLP_FBitnegate, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("^",16,_MLP_FPower, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL, MLP_O_RIGHTASSOC);
    
    MLP_AddBinaryOper("nPr",15,_MLP_FPermutation, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("nCr",15,_MLP_FCombination, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("*",14,_MLP_FMultiply, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("/",14,_MLP_FDivide, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("mod",14,_MLP_FModulo, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("div",14,_MLP_FDivision, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
        //add basic operators
    MLP_AddBinaryOper("+",13,_MLP_FAdd, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("-",13,_MLP_FSubstract, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("<<",12,_MLP_FBSL, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper(">>",12,_MLP_FBSR, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("<",11,_MLP_FLess, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("<=",11,_MLP_FLessequal, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper(">",11,_MLP_FGreater, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper(">=",11,_MLP_FGreaterequal, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("==",10,_MLP_FIs, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddBinaryOper("<>",10,_MLP_FIsnot, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("&",9,_MLP_FBitand, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("xor",8,_MLP_FBitxor, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("|",7,_MLP_FBitor, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("&&",6,_MLP_FAnd, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("^^",5,_MLP_FXor, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("||",4,_MLP_FOr, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);

    MLP_AddAssignOper("=",2,_MLP_FAssign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("+=",2,_MLP_FSumassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("-=",2,_MLP_FSubassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("/=",2,_MLP_FDivassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("*=",2,_MLP_FMulassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("<<=",2,_MLP_FBSLassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper(">>=",2,_MLP_FBSRassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("&=",2,_MLP_FAndassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("|=",2,_MLP_FOrassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("^=",2,_MLP_FXorassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
       
    MLP_AddBinaryOper(",",1,_MLP_FComma, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    
    MLP_AddFunction("not",_MLP_FNot, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("sin",_MLP_FSin, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("cos",_MLP_FCos, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("tan",_MLP_FTan, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("degrees",_MLP_FDegrees, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("radians",_MLP_FRadians, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("sqrt",_MLP_FSqrt, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("power",_MLP_FPower, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("round",_MLP_FRound, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("floor",_MLP_FFloor, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("ceil",_MLP_FCeil, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("frac",_MLP_FFrac, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("abs", _MLP_FAbs, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("arcsin", _MLP_FASin, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("arccos", _MLP_FACos, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("arctan", _MLP_FATan, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("exp", _MLP_FExp, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("ln", _MLP_FLn, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("log", _MLP_FLog, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("log2", _MLP_FLog2, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddFunction("logn", _MLP_FLogn, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddVariable("pi",pi,MLP_VAL_REAL);
    MLP_AddVariable("e",exp(1),MLP_VAL_REAL);
    
    //MLP_AddFunction(functionstring,scriptid,returntype, [type_arg1, type_arg2 ... type_argN])

    
    return id;
}
