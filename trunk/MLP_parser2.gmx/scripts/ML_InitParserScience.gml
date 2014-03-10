///ML_InitParserScience(VarMap)

/*
**  Usage:
**      ML_InitParserScience(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates Parser with functions adapted for scientific calculations
**      Adds "pi" and "e" variables to varmap, which contain "pi" and "e" resp.
*/

var ind = ML_InitParserEmpty(argument0);

    ML_AddUnaryOper(ind, "!",18,_ML_FFactorial, ML_VAL_REAL, ML_VAL_REAL, ML_UO_POSTFIX);
    ML_AddUnaryOper(ind, "%",18,_ML_FProcent, ML_VAL_REAL, ML_VAL_REAL, ML_UO_POSTFIX);
    
    ML_AddUnaryOper(ind, "-",17,_ML_FNegate, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddUnaryOper(ind, "+",17,_ML_FPositive, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddUnaryOper(ind, "~",17,_ML_FBitnegate, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "^",16,_ML_FPower, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL, ML_O_RIGHTASSOC);
    
    ML_AddBinaryOper(ind, "nPr",15,_ML_FPermutation, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "nCr",15,_ML_FCombination, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "*",14,_ML_FMultiply, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "/",14,_ML_FDivide, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "mod",14,_ML_FModulo, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "div",14,_ML_FDivision, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
        //add basic operators
    ML_AddBinaryOper(ind, "+",13,_ML_FAdd, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "-",13,_ML_FSubstract, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "<<",12,_ML_FBSL, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, ">>",12,_ML_FBSR, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "<",11,_ML_FLess, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "<=",11,_ML_FLessequal, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, ">",11,_ML_FGreater, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, ">=",11,_ML_FGreaterequal, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "==",10,_ML_FIs, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(ind, "<>",10,_ML_FIsnot, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "&",9,_ML_FBitand, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "xor",8,_ML_FBitxor, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "|",7,_ML_FBitor, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "&&",6,_ML_FAnd, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "^^",5,_ML_FXor, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper(ind, "||",4,_ML_FOr, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);

    ML_AddAssignOper(ind, "=",2,_ML_FAssign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "+=",2,_ML_FSumassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "-=",2,_ML_FSubassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "/=",2,_ML_FDivassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "*=",2,_ML_FMulassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "<<=",2,_ML_FBSLassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, ">>=",2,_ML_FBSRassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "&=",2,_ML_FAndassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "|=",2,_ML_FOrassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(ind, "^=",2,_ML_FXorassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
       
    ML_AddBinaryOper(ind, ",",1,_ML_FComma, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    
    ML_AddFunction(ind, "not",_ML_FNot, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "sin",_ML_FSin, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "cos",_ML_FCos, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "tan",_ML_FTan, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "degrees",_ML_FDegrees, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "radians",_ML_FRadians, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "sqrt",_ML_FSqrt, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "power",_ML_FPower, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "round",_ML_FRound, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "floor",_ML_FFloor, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "ceil",_ML_FCeil, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "frac",_ML_FFrac, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "abs", _ML_FAbs, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "arcsin", _ML_FASin, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "arccos", _ML_FACos, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "arctan", _ML_FATan, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "exp", _ML_FExp, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "ln", _ML_FLn, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "log", _ML_FLog, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "log2", _ML_FLog2, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddFunction(ind, "logn", _ML_FLogn, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddVariable(ind, "pi",pi,ML_VAL_REAL);
    ML_AddVariable(ind, "e",exp(1),ML_VAL_REAL);
        
return ind;
