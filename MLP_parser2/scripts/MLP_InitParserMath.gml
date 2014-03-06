///MLP_InitParserMath(VarMap)

/*
**  Usage:
**      MLP_InitParserMath(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates Parser with functions adapted for simple mathematics
**      Ownership of the variable map is NOT in hand of the parser
*/

with (instance_create(0,0,MLP_objParser)) {
    VARMAP = argument0;
    
    MLP_AddUnaryOper("!",17,_MLP_FFactorian, MLP_VAL_REAL, MLP_VAL_REAL, MLP_UO_POSTFIX);
    MLP_AddUnaryOper("%",17,_MLP_FProcent, MLP_VAL_REAL, MLP_VAL_REAL, MLP_UO_POSTFIX);
    
    MLP_AddUnaryOper("-",16,_MLP_FNegate, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddUnaryOper("+",16,_MLP_FPositive, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddUnaryOper("~",16,_MLP_FBitnegate, MLP_VAL_REAL, MLP_VAL_REAL);
    
    MLP_AddBinaryOper("^",15,_MLP_FPower, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL, MLP_O_RIGHTASSOC);
    
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
    MLP_AddAssignOper("=",2,_MLP_FAssign, MLP_VAL_STRING, MLP_VAL_STRING, MLP_VAL_STRING);
    MLP_AddAssignOper("+=",2,_MLP_FSumassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("+=",2,_MLP_FSumassign, MLP_VAL_STRING, MLP_VAL_STRING, MLP_VAL_STRING);
    MLP_AddAssignOper("-=",2,_MLP_FSubassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("/=",2,_MLP_FDivassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("*=",2,_MLP_FMulassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("%=",2,_MLP_FModassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("<<=",2,_MLP_FBSLassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper(">>=",2,_MLP_FBSRassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("&=",2,_MLP_FAndassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("|=",2,_MLP_FOrassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    MLP_AddAssignOper("^=",2,_MLP_FXorassign, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
       
    MLP_AddBinaryOper(",",1,_MLP_FComma, MLP_VAL_REAL, MLP_VAL_REAL, MLP_VAL_REAL);
    
    return id;
}
