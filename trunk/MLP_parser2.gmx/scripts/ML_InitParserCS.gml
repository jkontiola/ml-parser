///ML_InitParserCS(VarMap)

/*
**  Usage:
**      ML_InitParserCS(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates Parser with functions adapted for computer science
**      
*/


with (instance_create(0,0,ML_objParser)) {
    VARMAP = argument0;
    
    //add basic operators
    ML_AddBinaryOper("+",13,_ML_FAdd, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("+",13,_ML_FAdd, ML_VAL_STRING, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddBinaryOper("-",13,_ML_FSubstract, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("*",14,_ML_FMultiply, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("/",14,_ML_FDivide, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("%",14,_ML_FModulo, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("div",14,_ML_FDivision, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("<<",12,_ML_FBSL, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(">>",12,_ML_FBSR, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("<",11,_ML_FLess, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("<=",11,_ML_FLessequal, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(">",11,_ML_FGreater, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(">=",11,_ML_FGreaterequal, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("<",11,_ML_FLess, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddBinaryOper("<=",11,_ML_FLessequal, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddBinaryOper(">",11,_ML_FGreater, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddBinaryOper(">=",11,_ML_FGreaterequal, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_STRING);
    
    ML_AddBinaryOper("==",10,_ML_FIs, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("!=",10,_ML_FIsnot, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper("==",10,_ML_FIs, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddBinaryOper("!=",10,_ML_FIsnot, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_STRING);
    
    ML_AddBinaryOper("&",9,_ML_FBitand, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("^",8,_ML_FBitxor, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("|",7,_ML_FBitor, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("&&",6,_ML_FAnd, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("^^",5,_ML_FXor, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddBinaryOper("||",4,_ML_FOr, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddUnaryOper("!",15,_ML_FNot, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddUnaryOper("-",15,_ML_FNegate, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddUnaryOper("+",15,_ML_FPositive, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddUnaryOper("~",15,_ML_FBitnegate, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddAssignOper("=",2,_ML_FAssign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("=",2,_ML_FAssign, ML_VAL_STRING, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddAssignOper("+=",2,_ML_FSumassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("+=",2,_ML_FSumassign, ML_VAL_STRING, ML_VAL_STRING, ML_VAL_STRING);
    ML_AddAssignOper("-=",2,_ML_FSubassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("/=",2,_ML_FDivassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("*=",2,_ML_FMulassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("%=",2,_ML_FModassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("<<=",2,_ML_FBSLassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper(">>=",2,_ML_FBSRassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("&=",2,_ML_FAndassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("|=",2,_ML_FOrassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddAssignOper("^=",2,_ML_FXorassign, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    
    ML_AddTernaryOper( "?", ":", 3, _ML_FConditional,
        ML_VAL_REAL,ML_VAL_REAL,ML_VAL_REAL,ML_VAL_REAL);
    ML_AddTernaryOper( "?", ":", 3, _ML_FConditional,
        ML_VAL_STRING,ML_VAL_REAL,ML_VAL_STRING,ML_VAL_STRING);
       
    ML_AddBinaryOper(",",1,_ML_FComma, ML_VAL_REAL, ML_VAL_REAL, ML_VAL_REAL);
    ML_AddBinaryOper(",",1,_ML_FComma, ML_VAL_REAL, ML_VAL_STRING, ML_VAL_REAL);
    ML_AddBinaryOper(",",1,_ML_FComma, ML_VAL_STRING, ML_VAL_REAL, ML_VAL_STRING);
    ML_AddBinaryOper(",",1,_ML_FComma, ML_VAL_STRING, ML_VAL_STRING, ML_VAL_STRING);

    ML_AddFunction("string",_ML_FMakeString,ML_VAL_STRING,ML_VAL_REAL);
    ML_AddFunction("real",_ML_FMakeReal,ML_VAL_REAL,ML_VAL_STRING);
    
    return id;
}
