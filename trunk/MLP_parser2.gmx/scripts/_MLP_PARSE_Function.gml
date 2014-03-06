var a, argc , f, i, lhs, lhs_val, ret, t;

f = argument0.operator;
argc = argument0.argc;
var argstring, exact_func;
argstring = "";
for (i = argc -1; i >= 0; i -= 1) {
    lhs = ds_stack_pop(argument1);
    if (lhs.tokentype == MLP_TT_VALUE) {
        if (lhs.operator == MLP_VAL_REAL) {
            t = MLP_VAL_REAL;
            lhs_val = real(lhs.tokenstring);
        } else {
            t = MLP_VAL_STRING;
            lhs_val = lhs.tokenstring;
        }
    } else {
        var v;
        v = lhs.operator;
        lhs_val = ds_map_find_value(VARMAP, v.str);
        t = v.type
    }
    argstring = t + "$" + argstring;
    a[i] = lhs_val;
}
argstring = string_copy(argstring,1,string_length(argstring) - 1);
exact_func = _MLP_PARSE_GetFullFunction(f, argstring)

if (exact_func < 0) {
    MLP_RaiseException(MLP_EXCEPT_ARGTYPE,argument0.tokenpos,
        "Invalid argument type for '" + argument0.tokenstring +"' at " +string(argument0.tokenpos));
    with (argument0) {
        tokentype = MLP_TT_VALUE;
        tokenstring = 0;
        operator = MLP_VAL_REAL;
        ds_stack_push(argument1,id);
    }
    return 0;
} 

switch (argc) {
case 15:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
break;
case 14:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
break;
case 13:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
break;
case 12:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
break;
case 11:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
break;
case 10:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
break;
case 9:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
break;
case 8:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
break;
case 7:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
break;
case 6:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4], a[5]);
break;
case 5:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3], a[4]);
break;
case 4:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2], a[3]);
break;
case 3:
    ret = script_execute(exact_func.functionscript, a[0], a[1], a[2]);
break;
case 2:
    ret = script_execute(exact_func.functionscript, a[0], a[1]);
break;
case 1:
    ret = script_execute(exact_func.functionscript, a[0]);
break
case 0:
    ret = script_execute(exact_func.functionscript);
break;
}
//change the "function" by the "value".
with (argument0) {
    tokentype = MLP_TT_VALUE;
    tokenstring = ret;
    operator = exact_func.rettype;
    ds_stack_push(argument1,id);
}
