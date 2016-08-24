#define ML_AddAssignOper
///ML_AddAssignOper(parser, operator, precedence, script, returntype, lhstype, rhstype[, assoc])
/// @argType    r,s,r,r,s,s,s,r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_AddAssignOper(parser, operator, precedence, script, returntype, lhstype, rhstype[, assoc])
**
**  Arguments:
**      parser      parser index
**      operator    string used to identify the operator
**      precedence  precedence
**      script      script id
**      returntype  return type of the operator
**      lhstype     type of left hand side
**      rhstype     type of right hand side
**      assoc       associtivity of operator (default is right/ML_O_RIGHTASSOC)
**
**  Returns:
**      ID to the new "operator type" used in further functions
**
**  Notes:
**      script get as argument when executed: {variable-map, lhs-name (variable name), rhs-value (value to assign)}
*/

var o;
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument[0]);
if (ds_map_exists(P_ASSIGNOPER,argument[1])) {
    o = ds_map_find_value(P_ASSIGNOPER, argument[1]);
    _ML_LiF_AddSig(o, argument[5] +"$" + argument[6], 
                    _ML_AddAssignSig(argument[3], argument[4]));
} else {
    var assoc;
    assoc = ML_O_RIGHTASSOC;
    if (argument_count > 7) assoc = argument[7];
    o = _ML_NewAssignOper(argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], assoc);
    ds_map_add(P_ASSIGNOPER, argument[1], o);
    _ML_OpAddRoots(argument[0], argument[1]);
}
return o;


#define ML_AddBinaryOper
///ML_AddBinaryOper(parser, operator, precedence, script, returntype, lhstype, rhstype[, assoc])
/// @argType    r,s,r,r,s,s,s,r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_AddBinaryOper(parser, operator, precedence, script, returntype, lhstype, rhstype[, assoc])
**
**  Arguments:
**      parser      parser index
**      operator    string used to identify the operator
**      precedence  the precendence of the operator
**      script      script id
**      returntype  return type of the operator
**      lhstype     type of left hand side
**      rhstype     type of right hand side
**      assoc       associtivity of operator (default is left/ML_O_LEFTASSOC)
**
**  Returns:
**      ID to the new "operator type" used in further functions
**
**  Notes:
**      script get as argument when executed: {lhs-value, rhs-value}
*/
var o;
var P_BINOPER = _ML_LiP_GetBinOpsTable(argument[0]);
if (ds_map_exists(P_BINOPER,argument[1])) {
    o = ds_map_find_value(P_BINOPER, argument[1]);
    _ML_LiF_AddSig(o, argument[5] +"$" + argument[6], 
                _ML_AddBinarySig(argument[3], argument[4]));
} else {
    var assoc;
    assoc = ML_O_LEFTASSOC;
    if (argument_count > 7) assoc = argument[7];
    o = _ML_NewBinaryOper(argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], assoc);
    ds_map_add(P_BINOPER, argument[1], o);
    _ML_OpAddRoots(argument[0], argument[1]);
}
return o;


#define ML_AddFunctionArgList
///ML_AddFunctionArgList(parser, functionstring,scriptid,returntype, argtypelist)
/// @argType    r,s,r,s,r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_AddFunction(parser, functionstring,scriptid,returntype, argtypelist)
**
**  Arguments:
**      parser          Parser index
**      functionstring  string used to identify the function
**      scriptid        script-index from the function
**      returntype      type of variable GML_VAL_REAL / GML_VAL_STRING
**      argtypelist     type of the arguments (GML_VAL_REAL / GML_VAL_STRING)
**
**  Returns:
**      ID to the new "function type" used in further functions
**
**  Notes:
**      script get as argument when executed: {arg1-value, arg2-value ... argN-value}
*/

var o, tlist;
tlist = argument4;
var P_FUNCTION  = _ML_LiP_GetFunctionTable(argument0);

if (ds_map_exists(P_FUNCTION,argument1)) {
    var argstr = "";
    c = ds_list_size(tlist);
    if (c > 0) {
        argstr = ds_list_find_value(tlist, 1);
        for (var i = 1; i < c; ++i) {
            argstr += "$" + ds_list_find_value(tlist, i);
        }
    }
    o = ds_map_find_value(P_FUNCTION, argument1);
    _ML_LiF_AddSig(o, argstr, _ML_AddFunctionSig(argument2, argument3));
} else {
    o = _ML_NewFunction(argument1, argument2, argument3, tlist);
    ds_map_add(P_FUNCTION, argument1, o);
}

return o;


#define ML_AddTernaryOper
///ML_AddTernaryOper(parser, operator1, operator2, precedence, script, returntype, lhstype, mhstype, rhstype[, assoc])
/// @argType    r,s,s,r,r,s,s,s,s,r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_AddTernaryOper(parser, operator1, operator2, precedence, script, returntype, lhstype, mhstype, rhstype[, assoc])
**
**  Arguments:
**      parser      parser index
**      operator1   string used to identify the first part of ternary operator
**      operator2   string used to identify the second part of ternary operator
**      precedence  the precendence of the operator
**      script      script id
**      returntype  return type of the operator
**      lhstype     type of left hand side
**      mhstype     type of middle hand side
**      rhstype     type of right hand side
**      assoc       associtivity of operator (default is right/ML_O_RIGHTASSOC)
**
**  Returns:
**      ID to the new "operator type" used in further functions
**      script get as argument when executed: {lhs-value, mhs-value, rhs-value}
**
**  Notes:
**      First operator must be unique
*/

var o;

var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument[0]);
if (ds_map_exists(P_TERNOPER,argument[1])) {
    o = ds_map_find_value(P_TERNOPER, argument[1]);
    _ML_LiF_AddSig(o, argument[6] + "$" + argument[7] + "$" + argument[8], 
                    _ML_AddTernarySig(argument[4], argument[5]));
} else {
    var assoc;
    assoc = ML_O_RIGHTASSOC;
    if (argument_count > 9) assoc = argument[9];
    o = _ML_NewTernaryOper(argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], assoc);
    ds_map_add(P_TERNOPER, argument[1], o);
    _ML_OpAddRoots(argument[0], argument[1]);
    _ML_OpAddRoots(argument[0], argument[2]);
    _ML_TernaryAddSecond(argument[0], argument[2],o);
}
return o;


#define ML_AddUnaryOper
///ML_AddUnaryOper(parser, operator, precedence,script,returntype, valtype,[ affix])
/// @argType    r,s,r,r,s,s,r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_AddUnaryOper(parser, operator, precedence,script,returntype, valtype,[ affix])
**
**  Arguments:
**      parser      parser index
**      operator    string used to identify the operator
**      precedence  precedence
**      script      script id
**      returntype  return type of the operator
**      valtype     type of argument
**      affix       affix of operator (default is prefix/ML_UO_PREFIX)
**
**  Returns:
**      ID to the new "operator type" used in further functions
**
**  Notes:
**      script get as argument when executed: {operand-value}
*/

var o;

var P_UNOPER = _ML_LiP_GetUnOpsTable(argument[0]);
if (ds_map_exists(P_UNOPER,argument[1])) {
    o = ds_map_find_value(P_UNOPER, argument[1]);
    _ML_LiF_AddSig(o, argument[5],_ML_AddUnarySig(argument[3], argument[4]));
} else {
    var affix;
    affix = ML_UO_PREFIX;
    if (argument_count > 6) affix = argument[6];
    o = _ML_NewUnaryOper(argument[1], argument[2], argument[3], argument[4], argument[5], affix);
    ds_map_add(P_UNOPER, argument[1], o);
    _ML_OpAddRoots(argument[0], argument[1]);
}
return o;


#define ML_AddVariable
///ML_AddVariable(parser, varstring,[value, type, readonly = true])
/// @argType    r,s,a,s,r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_AddVariable( parser, varstring,[value, type, readonly = true])
**
**  Arguments:
**      parser      parser index
**      varstring   string used to identify the variable
**      value       initial value, if variable does not exist yet (default 0)
**      type        type of variable ML_VAL_REAL / ML_VAL_STRING - If omitted the variables current state is used
**      readonly    wether or not the value can be written (default to read only)
**
**  Returns:
**      ID to the new "variable type" used in further functions
**
**  Notes:
*/

var VARMAP  = _ML_LiP_GetVarMap(argument[0]);
var str = argument[1];

if (!ds_map_exists(VARMAP,str) ) {
    var tval = 0;
    if (argument_count > 2) {
        tval = argument[2];
    }   
    ds_map_add(VARMAP, str, tval);
}
var type;
if (argument_count > 3) {
    type = argument[3];
} else {
    var t = ds_map_find_value(VARMAP, str);
    if (is_real(t)) {
        type = ML_VAL_REAL;
    } else {
        type = ML_VAL_STRING;
    }
}
var ro = true;
if (argument_count > 4) {
    ro = argument[4];
}

var v = _ML_LiVar_Create(str, type, ro);
ds_map_add(_ML_LiP_GetVariableTable(argument[0]),str,v);
return v;


#define ML_Calculate
///ML_Calculate(parser)
/// @argType    r
/// @returnType real
/// @hidden     false
var parser = argument0;
var resobj =_ML_LiP_GetResultObject(parser); 
_ML_Interpret_Detail(parser, _ML_LiP_GetFunctionString(parser), resobj);

return _ML_LiRO_GetCalculated(resobj);


#define ML_ClearAssignOper
///ML_ClearAssignOper(parser)
/// @argType    r
/// @returnType void
/// @hidden     false
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument0);
repeat (ds_map_size(P_ASSIGNOPER)) {
    ML_RemAssignOperStr(argument0, ds_map_find_first(P_ASSIGNOPER));
}


#define ML_ClearBinaryOper
///ML_ClearBinaryOper(parser)
/// @argType    r
/// @returnType void
/// @hidden     false
var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
repeat (ds_map_size(P_BINOPER)) {
    ML_RemBinaryOperStr(argument0, ds_map_find_first(P_BINOPER));
}


#define ML_ClearExceptions
///ML_ClearExceptions(parser)
/// @argType    r
/// @returnType v
/// @hidden     false

_ML_LiP_SetErrorFlags(argument0, 0);
_ML_LiP_SetErrorPos(argument0, -1);
_ML_LiP_SetErrorString(argument0, "");



#define ML_ClearExceptions_CurParser
///ML_ClearExceptions_CurParser()
/// @argType    
/// @returnType void
/// @hidden     false

ML_ClearExceptions(global._ML_CURRENTPARSER_);


#define ML_ClearFunction
///ML_ClearFunction(parser)
/// @argType    r
/// @returnType void
/// @hidden     false
var P_FUNCTION  = _ML_LiP_GetFunctionTable(argument0);
repeat (ds_map_size(P_FUNCTION)) {
    ML_RemFunctionStr(argument0, ds_map_find_first(P_FUNCTION));
}


#define ML_ClearTernaryOper
///ML_ClearTernaryOper(parser)
/// @argType    r
/// @returnType void
/// @hidden     false
var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument0);
repeat (ds_map_size(P_TERNOPER)) {
    ML_RemTernaryOperStr(argument0, ds_map_find_first(P_TERNOPER));
}


#define ML_ClearUnaryOper
///ML_ClearUnaryOper(parser)
/// @argType    r
/// @returnType void
/// @hidden     false
var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
repeat (ds_map_size(P_UNOPER)) {
    ML_RemUnaryOperStr(argument0, ds_map_find_first(P_UNOPER));
}


#define ML_ClearVariable
///ML_ClearVariable(parser) 
/// @argType    r
/// @returnType void
/// @hidden     false
//Clears all variables - DOES NOT CLEAR MAP WITH VALUES
var P_VARIABLE  = _ML_LiP_GetVariableTable(argument0);
repeat (ds_map_size(P_VARIABLE)) {
    ML_RemVariableStr(argument0, ds_map_find_first(P_VARIABLE));
}


#define ML_Compile
///ML_Compile(parser, expression)
/// @argType    r, s
/// @returnType real
/// @hidden     false


/*
**  Usage:
**      ML_Compile(parser, expression)
**
**  Arguments:
**      parser      parser index
**      expression  expression string
**
**  Returns:
**      compile output to execute
**
**  Notes:
*/

var rpn, tokenlist, ans, newrpn;

var parser = argument0;
global._ML_CURRENTPARSER_ = parser;

var compile;

newrpn = ds_list_create();
if (!ML_NoException(parser)) return newrpn;

tokenlist = ds_list_create();
rpn = ds_list_create();
var important_tokens = ds_map_create();


do {
    _ML_LexicalAnalysis(parser, tokenlist, argument1);
    if (!ML_NoException(parser))  {break;}
    _ML_ShuntingYard(parser, tokenlist, rpn);  
    if (!ML_NoException(parser))  {break;}
    _ML_COMP_EvalAll(parser, rpn, newrpn, important_tokens);
} until (1 == 1);


if (!ML_NoException(parser))  {
    _ML_TokCleanUp(tokenlist);
} else {
    _ML_COMP_RemoveExtraTokens(tokenlist, important_tokens);
}
ds_list_destroy(rpn);
ds_list_destroy(tokenlist);
ds_map_destroy(important_tokens);
return newrpn;




#define ML_CompileCleanup
///ML_CompileCleanup(Compile)
/// @argType    r
/// @returnType void
/// @hidden     false
var compile = argument0;

_ML_TokCleanUp(compile);
ds_list_destroy(compile);



#define ML_CompileDecode
///ML_CompileDecode(buffer, offset)
/// @argType    r, r
/// @returnType real
/// @hidden     true


#define ML_CompileEncode
///ML_CompileEncode(buffer, compile, offset)
/// @argType    r, r, r
/// @returnType real
/// @hidden     true


#define ML_DestroyParser
///ML_DestroyParser(parser)
/// @argType    r
/// @returnType void
/// @hidden     false
_ML_LiP_Destroy(argument0);



#define ML_Execute
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

var parser = argument0;
var compile = argument1;
var result = _ML_LiRO_Create();


global._ML_CURRENTPARSER_ = parser;
if (ML_NoException(parser)) {
    var ans = _ML_ParseCompiled(parser, compile, result);
    if (ML_NoException(parser)) {
        _ML_LiRO_SetFinal(result, ans);
        _ML_LiRO_SetCalculated(result, true);
    }
}


return result;


#define ML_GetAnswer
///ML_GetAnswer(parser, answer_ind)
/// @argType    r, r
/// @returnType auto
/// @hidden     false

return ML_ResObj_GetAnswer(_ML_LiP_GetResultObject(argument0), argument1);


#define ML_GetAnswerNum
///ML_GetAnswerNum(parser)
/// @argType    r
/// @returnType real
/// @hidden     false

return ML_ResObj_GetAnswerNum(_ML_LiP_GetResultObject(argument0));


#define ML_GetAnswerType
///ML_GetAnswerType(parser, answer_ind)
/// @argType    r, r
/// @returnType string
/// @hidden     false

return ML_ResObj_GetAnswerType(_ML_LiP_GetResultObject(argument0), argument1);


#define ML_GetExprString
///ML_GetExprString(parser)
/// @argType    r
/// @returnType string
/// @hidden     false
return _ML_LiP_GetFunctionString(argument0);


#define ML_GetFinalAnswer
///ML_GetFinalAnswer(parser)
/// @argType    r
/// @returnType auto
/// @hidden     false

return ML_ResObj_GetFinalAnswer(_ML_LiP_GetResultObject(argument0));


#define ML_HasAnswer
/// ML_HasAnswer(parser)
/// @argType    r
/// @returnType real
/// @hidden     false
return ML_ResObj_HasAnswer(_ML_LiP_GetResultObject(argument0));


#define ML_Initialize
///ML_Initialize()
/// @argType    
/// @returnType void
/// @hidden     true

global._ML_CURRENTPARSER_ = -1;


#define ML_InitParserEmpty
///ML_InitParserEmpty(VarMap)
/// @argType    r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_InitParserEmpty(VarMap)
**
**  Arguments:
**      VarMap      Map that will contain all variables
**
**  Returns:
**      Parser ID used for further functions
**
**  Notes:
**      Creates completely empty parser
*/


var ind = _ML_LiP_Create("", argument0);
global._ML_CURRENTPARSER_ = ind;

return ind;



#define ML_Interpret
/// ML_Interpret(parser, string)
/// @argType    r, s
/// @returnType real
/// @hidden     false

var parser = argument0;
var funcstr = argument1;
var resobj = _ML_LiRO_Create();
_ML_Interpret_Detail(parser, funcstr, resobj);

return resobj;


#define ML_LastException
///ML_LastException(parser)
/// @argType    r
/// @returnType real
/// @hidden     false

return _ML_LiP_GetErrorFlags(argument0);


#define ML_LastExceptionPosition
///ML_LastExceptionPosition(parser)
/// @argType    r
/// @returnType real
/// @hidden     false

return _ML_LiP_GetErrorPos(argument0);


#define ML_LastExceptionPosition_CurParser
///ML_LastExceptionPosition_CurParser()
/// @argType    
/// @returnType real
/// @hidden     false

return ML_LastExceptionPosition(global._ML_CURRENTPARSER_);


#define ML_LastExceptionString
///ML_LastExceptionString(parser)
/// @argType    r
/// @returnType s
/// @hidden     false

return _ML_LiP_GetErrorString(argument0);


#define ML_LastExceptionString_CurParser
///ML_LastExceptionString_CurParser(parser)
/// @argType    
/// @returnType s
/// @hidden     false

return ML_LastExceptionString(global._ML_CURRENTPARSER_);


#define ML_LastException_CurParser
///ML_LastException_CurParser()
/// @argType    
/// @returnType real
/// @hidden     false

return ML_LastException(global._ML_CURRENTPARSER_);


#define ML_NoException
///ML_NoException(parser)
/// @argType    r
/// @returnType real
/// @hidden     false

return (_ML_LiP_GetErrorFlags(argument0) == 0);


#define ML_NoException_CurParser
///ML_NoException_CurParser()
/// @argType    
/// @returnType real
/// @hidden     false

return ML_NoException(global._ML_CURRENTPARSER_);


#define ML_RaiseException
///ML_RaiseException(parser, Exception, position, [string])
/// @argType    r,r,r,s
/// @returnType v
/// @hidden     false

/*
**  Usage:
**      ML_RaiseException(parser, Exception,position,[string])
**
**  Arguments:
**      Parser      Parser id
**      Exception   exception id of the exception (Can be build in or a custom)
**      position    positino of the expression (use -1 if you don't know)
**      string      string containing a textual description of the exception
**
**  Returns:
**
**  Notes:
*/

var ind = argument[0];
_ML_LiP_SetErrorFlags(ind, argument[1]);
_ML_LiP_SetErrorPos(ind, argument[2]);
if (argument_count > 3) {
    _ML_LiP_SetErrorString(ind, argument[3]);
}


#define ML_RaiseException_CurParser
///ML_RaiseException_CurParser(Exception, position, [string])
/// @argType    r, r, s
/// @returnType real
/// @hidden     false

/*
**  Usage:
**      ML_RaiseException_CurParser( Exception,position,[string])
**
**  Arguments:
**      Exception   exception id of the exception. (Can be build in or a custom)
**      position    positino of the expression (use -1 if you don't know)
**      string      string containing a textual description of the exception
**
**  Returns:
**
**  Notes:
*/
if (argument_count >= 3) {
    ML_RaiseException(global._ML_CURRENTPARSER_, argument[0], argument[1], argument[2]);
} else {
    ML_RaiseException(global._ML_CURRENTPARSER_, argument[0], argument[1]);
}


#define ML_RemAssignOper
///ML_RemAssignOper(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument0);
_ML_OpRemRoots(argument0, _ML_Li_GetName(argument1));
ds_map_delete(P_ASSIGNOPER, _ML_Li_GetName(argument1));
_ML_LiAOp_Destroy(argument1);


#define ML_RemAssignOperStr
///ML_RemAssignOperStr(parser, Assign operator string)
/// @argType    r,s
/// @returnType void
/// @hidden     false
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument0);
ML_RemAssignOper(argument0, ds_map_find_value(P_ASSIGNOPER,argument1));



#define ML_RemBinaryOper
///ML_RemBinaryOper(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
_ML_OpRemRoots(argument0, _ML_Li_GetName(argument1));
ds_map_delete(P_BINOPER, _ML_Li_GetName(argument1));
_ML_LiBOp_Destroy(argument1);


#define ML_RemBinaryOperStr
///ML_RemBinaryOperStr(parser, Binary operator string)
/// @argType    r,s
/// @returnType void
/// @hidden     false

var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
ML_RemBinaryOper(argument0, ds_map_find_value(P_BINOPER,argument1));



#define ML_RemFunction
///ML_RemFunction(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_FUNCTION  = _ML_LiP_GetFunctionTable(argument0);
ds_map_delete(P_FUNCTION, _ML_Li_GetName(argument1));
_ML_LiF_Destroy(argument1);


#define ML_RemFunctionStr
///ML_RemFunctionStr(parser, function_string)
/// @argType    r,s
/// @returnType void
/// @hidden     false
var P_FUNCTION  = _ML_LiP_GetFunctionTable(argument0);
ML_RemFunction(argument0, ds_map_find_value(P_FUNCTION,argument1));



#define ML_RemTernaryOper
///ML_RemTernaryOper(parser, index);
/// @argType    r,r
/// @returnType void
/// @hidden     false
var ind = argument1;
var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument0);
var P_TERNOPER2 = _ML_LiP_GetTernOps2Table(argument0);

var str1 = _ML_LiTOp_GetFirstName(ind);
var str2 = _ML_LiTOp_GetSecondName(ind);

ds_map_delete(P_TERNOPER, str1);
var entry, i;
entry = ds_map_find_value(P_TERNOPER2, str2);
i = ds_list_find_index(entry, ind);
if (i < 0)  { 
    show_error("Ternary operator removal error", true);
} else {
    ds_list_delete(entry, i);
}
if (ds_list_empty(entry)) {
    ds_list_destroy(entry);
    ds_map_delete(P_TERNOPER2, str2);
}
_ML_OpRemRoots(argument0, str1);
_ML_OpRemRoots(argument0, str2);
_ML_LiTOp_Destroy(ind);



#define ML_RemTernaryOperStr
///ML_RemTernaryOperStr(parser, Ternary operator string)
/// @argType    r,s
/// @returnType void
/// @hidden     false
var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument0);
ML_RemTernaryOper(argument0, ds_map_find_value(P_TERNOPER,argument1));



#define ML_RemUnaryOper
///ML_RemUnaryOper(parser, index)
/// @argType    r,r
/// @returnType void
/// @hidden     false
var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
_ML_OpRemRoots(argument0, _ML_Li_GetName(argument1));
ds_map_delete(P_UNOPER, _ML_Li_GetName(argument1));
_ML_LiUOp_Destroy(argument1);


#define ML_RemUnaryOperStr
///ML_RemUnaryOperStr(parser, Unary operator string)
/// @argType    r,s
/// @returnType void
/// @hidden     false
var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
ML_RemUnaryOper(argument0, ds_map_find_value(P_UNOPER,argument1));



#define ML_RemVariable
///ML_RemVariable(parser, index) destroys variable - DOES NOT DESTROY IN MAP WITH VALUES
/// @argType    r,r
/// @returnType void
/// @hidden     false

var P_VARIABLE  = _ML_LiP_GetVariableTable(argument0);
ds_map_delete(P_VARIABLE, _ML_Li_GetName(argument1));
_ML_LiVar_Destroy(argument1);


#define ML_RemVariableStr
///ML_RemVariableStr(parser, VarString) 
/// @argType    r,s
/// @returnType void
/// @hidden     false
//destroys variable - DOES NOT DESTROY IN MAP WITH VALUES


var P_VARIABLE  = _ML_LiP_GetVariableTable(argument0);
ML_RemVariable(argument0, ds_map_find_value(P_VARIABLE,argument1));



#define ML_ResObj_Cleanup
///ML_ResObj_Cleanup(result)
/// @argType    r
/// @returnType void
/// @hidden     false

_ML_LiRO_Destroy(argument0);


#define ML_ResObj_GetAnswer
///ML_ResObj_GetAnswer(result, answer_ind)
/// @argType    r, r
/// @returnType auto
/// @hidden     false

return _ML_LiRO_Get(argument0, argument1);


#define ML_ResObj_GetAnswerNum
///ML_ResObj_GetAnswerNum(result)
/// @argType    r
/// @returnType real
/// @hidden     false

return _ML_LiRO_Size(argument0);


#define ML_ResObj_GetAnswerType
///ML_ResObj_GetAnswerType(result, answer_ind)
/// @argType    r, r
/// @returnType string
/// @hidden     false

return _ML_LiRO_GetType(argument0, argument1);


#define ML_ResObj_GetCalculated
///ML_ResObj_GetCalculated(result)
/// @argType    r
/// @returnType real
/// @hidden     false

return _ML_LiRO_GetCalculated(argument0);


#define ML_ResObj_GetFinalAnswer
///ML_ResObj_GetFinalAnswer(result)
/// @argType    r
/// @returnType auto
/// @hidden     false

return _ML_LiRO_GetFinal(argument0);


#define ML_ResObj_HasAnswer
/// ML_ResObj_HasAnswer(result)
/// @argType    r
/// @returnType real
/// @hidden     false
return _ML_LiRO_GetCalculated(argument0);


#define ML_ResultCleanup
#define ML_ResultCleanup
///ML_ResultCleanup(result)
/// @argType    r
/// @returnType void
/// @hidden     false

_ML_LiRO_Destroy(argument0);


#define ML_SetExpression
///ML_SetExpression(parser, expression)
/// @argType    r,s
/// @returnType void
/// @hidden     false
/*
**  Usage:
**      ML_SetExpression(parser, expression)
**
**  Arguments:
**      expression      expression string
**
**  Returns:
**
**  Notes:
*/


_ML_LiP_SetFunctionString(argument0, argument1);
var res_obj = _ML_LiP_GetResultObject(argument0);
_ML_LiRO_SetCalculated(res_obj, false);


#define ML_VM_Get
///ML_VM_Get(parser)
/// @argType    r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_VM_Get()
**
**  Arguments:
**      parser      parser index
**
**  Returns:
**      CurrentVarMap id
**
**  Notes:
**      Can be manually changed. Though do NOT delete entries unless sure no pointer exists anymore
**      Ownership stays with parser
*/


return _ML_LiP_GetVarMap(argument0);


#define ML_VM_GetPVarList
///ML_VM_GetPVarList(parser, key)
/// @argType    r,r 
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_VM_GetPVarList(parser, key)
**
**  Arguments:
**      parser  parser index
**      key     key/pointer to check for
**
**  Returns:
**      ds_list containing id of all variables pointing to "key"
**
**  Notes:
**      - Creates list, you are responsible for destroying the list
**
**  Notes:
*/

var s, list, v, k, ind;
var P_VARIABLE =  _ML_LiP_GetVariableTable(argument0);
s = ds_map_size(P_VARIABLE);
list = ds_list_create();
k = argument1;

if (s > 0) {
    v = ds_map_find_first(P_VARIABLE);
    repeat (s) { 
        ind = ds_map_find_value(P_VARIABLE, v);
        if (_ML_Li_GetName(ind) == k) {
            ds_list_add(list, ind);
        }
        v = ds_map_find_next(P_VARIABLE, v);
    }
}


return list;


#define ML_VM_GetVar
///ML_VM_GetVar(parser, key)
/// @argType    r, s
/// @returnType auto
/// @hidden     false
/*
**  Usage:
**      ML_VM_GetVar(parser, key)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**
**  Returns:
**      Value of variable at "key"
**
**  Notes:
*/

var VARMAP =  _ML_LiP_GetVarMap(argument0);
return ds_map_find_value(VARMAP, argument1);


#define ML_VM_GetVarReal
///ML_VM_GetVarReal(parser, key)
/// @argType    r, s
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_VM_GetVarReal(parser, key)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**
**  Returns:
**      Value of variable at "key"
**
**  Notes:
*/

var VARMAP =  _ML_LiP_GetVarMap(argument0);
return real(ds_map_find_value(VARMAP, argument1));


#define ML_VM_GetVarString
///ML_VM_GetVarString(parser, key)
/// @argType    r , s
/// @returnType string
/// @hidden     false
/*
**  Usage:
**      ML_VM_GetVarString(parser, key)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**
**  Returns:
**      Value of variable at "key"
**
**  Notes:
*/

var VARMAP =  _ML_LiP_GetVarMap(argument0);
return string(ds_map_find_value(VARMAP, argument1));


#define ML_VM_HasNoPVar
///ML_VM_HasNoPVar(parser, key)
/// @argType    r, r
/// @returnType real
/// @hidden     false


/*
**  Usage:
**      ML_VM_HasNoPVar(parser, key)
**
**  Arguments:
**      parser  parser index
**      key     key/pointer to check for
**
**  Returns:
**      Whether there exists any variable pointing to "key"
**
**  Notes:
*/

var s, v, k, ind;
var P_VARIABLE = _ML_LiP_GetVariableTable(argument0);
s = ds_map_size(P_VARIABLE);
k = argument1;

if (s > 0) {
    v = ds_map_find_first(P_VARIABLE);
    repeat (s) { 
        ind = ds_map_find_value(P_VARIABLE, v);
        if (_ML_Li_GetName(ind) == k) {
            return true;
        }
        v = ds_map_find_next(P_VARIABLE, v);
    }
}


return false;


#define ML_VM_RemVar
///ML_VM_RemVar(parser, key)
/// @argType    r ,s
/// @returnType void
/// @hidden     false
/*
**  Usage:
**      ML_VM_RemVar(parser, key)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable to remove
**
**  Returns:
**
**  Notes:
**      also removes all variables pointing to this entry
*/

var s, v, k, ind;
var VARMAP = _ML_LiP_GetVarMap(argument0);
var P_VARIABLE = _ML_LiP_GetVariableTable(argument0);
s = ds_map_size(P_VARIABLE);
k = argument1;



if (s > 0) {
    v = ds_map_find_first(P_VARIABLE);
    repeat (s) { 
        ind = ds_map_find_value(P_VARIABLE, v);
        if (_ML_Li_GetName(ind) == k) {
            ML_RemVariable(argument0, ind);
        }
        v = ds_map_find_next(P_VARIABLE, v);
    }
}
ds_map_delete(VARMAP, k);

return list;


#define ML_VM_Set
///ML_VM_Set(parser, VarMap, [CreateNewVars] )
/// @argType    r, r, r
/// @returnType real
/// @hidden     false
/*
**  Usage:
**      ML_VM_Set(parser, VarMap, [CreateNewVars] )
**
**  Arguments:
**      parser          parser index
**      VarMap          Map containing [Variable; Value] pairs (where Variable is a string)
**      CreateNewVars   Whether to create new variables based on the new map
**                          varstring = key (in VarMap)
**                          value = value (in VarMap)
**                          type = type of value (in VarMap)
**                          readonly = true
**                      Default to not create new vars
**
**  Returns:
**      VarMap id
**
**  Notes:
**      - Does NOT take ownership of the map, destroying keeps responsibility of the user
**      - Destroys all created variables in the parser
**      - Normally not called by the user (as varmap is initialized at creation of the parser)
*/
var parser = argument[0];
ML_ClearVariable(parser)
var VARMAP = _ML_LiP_GetVarMap(parser);
if (VARMAP != -1) ds_map_destroy(VARMAP);
VARMAP = argument[1];


if (argument_count > 1) {
    if (argument[2]) {    
        var s;
        s = ds_map_size(VARMAP);
        if (s > 0) {
            var str, value, type;
            str = ds_map_find_first(VARMAP);
            repeat (s) { 
                value = ds_map_find_value(VARMAP, str);
                if (is_real(value)) {
                    type = ML_VAL_REAL;
                } else {
                    type = ML_VAL_STRING;
                }
                ML_AddVariable(parser, str, value, type, true)
                str = ds_map_find_next(VARMAP, v);
            }
        }
    }
}

_ML_LiP_SetVarMap(parser, VARMAP);
return VARMAP;


#define ML_VM_SetVar
///ML_VM_SetVar(parser, key, value)
/// @argType    r ,s, any
/// @returnType void
/// @hidden     false
/*
**  Usage:
**      ML_VM_SetVar(parser, key, value)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**      value   Value to set
**
**  Returns:
**
**  Notes:
*/
var key, value;
key = argument1;
value = argument2;
var VARMAP = _ML_LiP_GetVarMap(argument0);
VARMAP[? key] = value;



#define ML_VM_SetVarReal
///ML_VM_SetVarReal(parser, key, value)
/// @argType    r ,s, r
/// @returnType void
/// @hidden     false
/*
**  Usage:
**      ML_VM_SetVarReal(parser, key, value)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**      value   Value to set
**
**  Returns:
**
**  Notes:
*/
var key, value;
key = argument1;
value = argument2;
var VARMAP = _ML_LiP_GetVarMap(argument0);
VARMAP[? key] = value;


#define ML_VM_SetVarString
///ML_VM_SetVarString(parser, key, value)
/// @argType    r ,s, s
/// @returnType void
/// @hidden     false
/*
**  Usage:
**      ML_VM_SetVarString(parser, key, value)
**
**  Arguments:
**      parser  parser index
**      key     Key/Pointer to the variable
**      value   Value to set
**
**  Returns:
**
**  Notes:
*/
var key, value;
key = argument1;
value = argument2;
var VARMAP = _ML_LiP_GetVarMap(argument0);
VARMAP[? key] = value;


#define ML_VM_VarExists
/// ML_VM_VarExists(parser, varstring)
/// @argType    r, s
/// @returnType real
/// @hidden     false

var VARMAP =  ML_VM_Get(argument0);
return ds_map_exists(VARMAP, argument1);


#define _ML_AddAssignSig
///_ML_AddAssignSig(script, retval)
/// @argType    r,s
/// @returnType r
/// @hidden     true
var ind = _ML_LiS_Create(argument0, argument1);
return ind;


#define _ML_AddBinarySig
///_ML_AddBinarySig(script, retval)
/// @argType    r,s
/// @returnType r
/// @hidden     true
var ind = _ML_LiS_Create(argument0, argument1);
return ind;



#define _ML_AddFunctionSig
/// _ML_AddFunctionSig(script, return)
/// @argType    r,s
/// @returnType r
/// @hidden     true


var ind = _ML_LiS_Create(argument0, argument1);
return ind;


#define _ML_AddTernarySig
///_ML_AddTernarySig(script, retval)
/// @argType    r,s
/// @returnType r
/// @hidden     true
var ind = _ML_LiS_Create(argument0, argument1);
return ind;


#define _ML_AddUnarySig
///_ML_AddUnarySig(script, retval)
/// @argType    r,s
/// @returnType r
/// @hidden     true
var ind = _ML_LiS_Create(argument0, argument1);
return ind;


#define _ML_BD_DecodeGrid
///_ML_BD_DecodeGrid(grid, buffer)
/// @argType    r, r
/// @returnType void
/// @hidden     true
var ds = argument0;
var b = argument1;

var w = buffer_read(b, buffer_u32);
var h = buffer_read(b, buffer_u32);

ds_grid_resize(ds, w, h);

var val_type, value;
for (var j = 0; j < h; ++j) {
    for (var i = 0; i < w; ++i) {
        val_type = buffer_read(b, buffer_u8);
        value = _ML_BD_GetData(b, val_type);
        ds_grid_set(ds, i, j , value[0]);
    }
}


#define _ML_BD_DecodeList
///_ML_BD_DecodeList(list, buffer)
/// @argType    r, r
/// @returnType void
/// @hidden     true
var list = argument0;
var b = argument1;
var s = buffer_get_size(b);

var value;
var val_type;
var v;

do {
    val_type = buffer_read(b, buffer_u8);
    value = _ML_BD_GetData(b, val_type);
    if (value[1]) {
        ds_list_add(list, value[0]);
    }


} until (!value[1] || buffer_tell(b) == s);



#define _ML_BD_DecodeMap
///_ML_BD_DecodeMap(map, buffer)
/// @argType    r, r
/// @returnType void
/// @hidden     true
var ds = argument0;
var b = argument1;
var s = buffer_get_size(b);

var val;
var val_type;
var key;
var key_type;


do {
    key_type = buffer_read(b, buffer_u8);
    key = _ML_BD_GetData(b, key_type);

    if (key[1]) {
        val_type = buffer_read(b, buffer_u8);
        val = _ML_BD_GetData(b, val_type);
        if (val[1]) {
            ds_map_add(ds, key[0], val[0]);
        }
    }

} until (buffer_tell(b) == s || !key[1] || !val[1]);





#define _ML_BD_DecodePriority
///_ML_BD_DecodePriority(grid, buffer)
/// @argType    r, r
/// @returnType void
/// @hidden     true
var ds = argument0;
var b = argument1;
var s = buffer_get_size(b);

var value, p;
var val_type;
var p_type;


do {
    val_type = buffer_read(b, buffer_u8);
    value = _ML_BD_GetData(b, val_type);
    if (value[1]) {
        p_type = buffer_read(b, buffer_u8);
        p = _ML_BD_GetData(b, p_type);
        if (p[1]) {
            ds_priority_add(ds, value[0], p[0]);
        }
    }

} until (!value[1] || !p[1] || buffer_tell(b) == s);


#define _ML_BD_DecodeQueue
///_ML_BD_DecodeQueue(grid, buffer)
/// @argType    r, r
/// @returnType void
/// @hidden     true
var ds = argument0;
var b = argument1;
var s = buffer_get_size(b);

var value;
var val_type;


do {
    val_type = buffer_read(b, buffer_u8);
    value = _ML_BD_GetData(b, val_type);
    if (value[1]) {
        ds_queue_enqueue(ds, value[0]);
    }

} until (!value[1] || buffer_tell(b) == s);


#define _ML_BD_DecodeStack
/// _ML_BD_DecodeStack(grid, buffer)
/// @argType    r, r
/// @returnType void
/// @hidden     true
var ds = argument0;
var b = argument1;
var s = buffer_get_size(b);

var value;
var val_type;


do {
    val_type = buffer_read(b, buffer_u8);
    value = _ML_BD_GetData(b, val_type);
    if (value[1]) {
        ds_stack_push(ds, value[0]);
    }

} until (!value[1] || buffer_tell(b) == s);


#define _ML_BD_GetData
///_ML_BD_GetData(buffer, type)
/// @argType    r, r
/// @returnType array
/// @hidden     true


var ret;
ret[0] = 0;
ret[1] = true;
var b = argument0;
var type = argument1;
var offset = buffer_tell(b);


if (type < $80) {
    ret[0] = buffer_read(b, type);
} else {
    switch (type) {
    case ds_type_list + $80:
        ret[0] = ds_list_create();
        _ML_BD_DecodeList(ret[0], b);
    break;
    case ds_type_priority + $80:
        ret[0] = ds_priority_create();
        _ML_BD_DecodePriority(ret[0], b);
    break;
    case ds_type_stack + $80:
        ret[0] = ds_stack_create();
        _ML_BD_DecodeStack(ret[0], b);
    break;
    case ds_type_queue + $80:
        ret[0] = ds_queue_create();
        _ML_BD_DecodeQueue(ret[0], b);
    break;
    case ds_type_map + $80:
        ret[0] = ds_map_create();
        _ML_BD_DecodeMap(ret[0], b);
    break;
    case ds_type_grid + $80:
        ret[0] = ds_grid_create(0,0);
        _ML_BD_DecodeGrid(ret[0], b);
    break;
    case $C1:
        ret[0] = _ML_LiTok_Create("", 0);
        _ML_LiTok_FromBuff(ret[0], b);
    default: 
        ret[1] = false;
    break;
    }
}
return ret;


#define _ML_COMP_Assign
///_ML_COMP_Assign(token, args)
/// @argType    r,r
/// @returnType void
/// @hidden     true
var token = argument0;
var argstack = argument1;
var op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 2) {
    ML_RaiseException_CurParser(ML_EXCEPT_BINOPERATOR,_ML_LiTok_GetPos(token),
            "missing value for'" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
var rhs = ds_stack_pop(argstack);
var rhs_type = rhs[0];

var lhs = ds_stack_pop(argstack);
if (lhs[1] != ML_CTT_ASSIGNABLE) {
    ML_RaiseException_CurParser(ML_EXCEPT_ASSIGN,_ML_LiTok_GetPos(token),
            "Left hand side is not assignable '" + string(_ML_LiTok_GetVal(lhs)) +"' at " +string(_ML_LiTok_GetPos(lhs)));
    return 0;
}
var lhs_type = lhs[0]

var argstring = lhs_type + "$" + rhs_type;
var exact_operator = _ML_LiF_GetFunc(op, argstring);

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 
_ML_LiTok_SetType(token, ML_TT_ASSIGNFLAT);
_ML_LiTok_SetOperator(token, exact_operator);
_ML_LiTok_SetArgcount(token, 2);
var ctt;
ctt[0] = _ML_LiS_GetRettype(exact_operator);
ctt[1] = ML_CTT_VARIABLE;
ds_stack_push(argstack, ctt);


#define _ML_COMP_Binary
///_ML_COMP_Binary( token, argstack)
/// @argType    r,r
/// @returnType void
/// @hidden     true

var token = argument0;
var argstack = argument1;
var op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 2) {
    ML_RaiseException_CurParser(ML_EXCEPT_UNOPERATOR,_ML_LiTok_GetPos(token),
            "missing value for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
var rhs = ds_stack_pop(argstack);
var rhs_type = rhs[0];

var lhs = ds_stack_pop(argstack);
var lhs_type = lhs[0];

var argstring = lhs_type + "$" + rhs_type;
var exact_operator = _ML_LiF_GetFunc(op, argstring);

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 
_ML_LiTok_SetType(token, ML_TT_FUNCFLAT);
_ML_LiTok_SetOperator(token, exact_operator);
_ML_LiTok_SetArgcount(token, 2);
var ctt;
ctt[0] = _ML_LiS_GetRettype(exact_operator);
ctt[1] = ML_CTT_VARIABLE;
ds_stack_push(argstack, ctt);


#define _ML_COMP_EvalAll
///_ML_COMP_EvalAll(parser, ReversePolishQueue, OutFuncList, OutTokList)
/// @argType    r,r,r,r
/// @returnType auto
/// @hidden     true
var parser = argument0;
var rpn = argument1;
var newrpn = argument2;
var important_tokens = argument3;

while (!ds_list_empty(rpn) && ML_NoException(parser)) {
    _ML_COMP_EvalLine(parser, rpn, newrpn, important_tokens);

}


#define _ML_COMP_EvalLine
///_ML_COMP_EvalLine(parser, ReversePolishQueue,  newRPN, importantTokenList)
/// @argType    r,r,r,r
/// @returnType void
/// @hidden     true
var expression_terminator = false;
var args = ds_stack_create();
var newrpn = argument2;
var parser = argument0;
var rpn = argument1;
var important_tokens = argument3;
var tok;

var empty = ds_list_empty(rpn);
var firsttok = true;
while (!empty && expression_terminator == false && ML_NoException(parser)) {
    tok = ds_list_find_value(rpn, 0);
    ds_list_delete(rpn, 0);
    empty = ds_list_empty(rpn);
    
    expression_terminator= _ML_COMP_EvalToken(parser, args, tok);
    
    if !(expression_terminator && (empty || firsttok) ) {
        ds_map_add(important_tokens, tok, 0);
        ds_list_add(newrpn, tok);
        firsttok = false;
    }
    
}
if (ML_NoException(parser)) {
    if (ds_stack_size(args) > 1) {
        ML_RaiseException(ML_EXCEPT_VALUE,-1,
            "missing operator or function in expression");
    }
}
ds_stack_destroy(args);


#define _ML_COMP_EvalToken
///_ML_COMP_EvalToken(parser, argTypeStack, token)
/// @argType    r,r
/// @returnType real
/// @hidden     true
var parser = argument0;
var argTypeStack = argument1;
var tok = argument2;


switch (_ML_LiTok_GetType(tok)) {
case ML_TT_UNARY:
    _ML_COMP_Unary(tok, argTypeStack);
break;
case ML_TT_BINARY:
    _ML_COMP_Binary(tok, argTypeStack);
break;
case ML_TT_ASSIGN:
    _ML_COMP_Assign(tok, argTypeStack);
break;
case ML_TT_TERNARY:
    _ML_COMP_Ternary(tok, argTypeStack);
break;
case ML_TT_FUNCTION:
    _ML_COMP_Function(tok, argTypeStack);
break;
case ML_TT_VARIABLE:
    _ML_COMP_Variable(tok, argTypeStack);
break;
case ML_TT_VALUE:
    _ML_COMP_Value(tok, argTypeStack);
break;
case ML_TT_EOL:
case ML_TT_EXPRTERMINATOR:
    return true;
break;
}
return false;


#define _ML_COMP_Function
///_ML_COMP_Function( token, argstack)
/// @argType    r,r
/// @returnType void
/// @hidden     true

var token = argument0;
var argstack = argument1;
var f = _ML_LiTok_GetOperator(token);
var argstring = "";
var lhs, lhs_type;
var argc = _ML_LiTok_GetArgcount(token);
var tokentype, lhs_type;
for (var i = argc -1; i >= 0; --i) {
    lhs = ds_stack_pop(argstack);
    lhs_type = lhs[0];
    argstring = lhs_type + "$" + argstring;
}
argstring = string_copy(argstring,1,string_length(argstring) - 1);

var exact_func = _ML_LiF_GetFunc(f, argstring);

if (exact_func < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 
_ML_LiTok_SetType(token, ML_TT_FUNCFLAT);
_ML_LiTok_SetOperator(token, exact_func);
var ctt;
ctt[0] = _ML_LiS_GetRettype(exact_func);
ctt[1] = ML_CTT_VARIABLE;
ds_stack_push(argstack, ctt);


#define _ML_COMP_RemoveExtraTokens
///_ML_COMP_RemoveExtraTokens(tokenList, importantTokenMap)
/// @argType    r,r
/// @returnType void
/// @hidden     true

var tokenlist = argument0;
var important_tokens = argument1;
var tok;

for (var i = ds_list_size(tokenlist) - 1; i >= 0; --i) {
    tok = ds_list_find_value(tokenlist, i);
    if (!ds_map_exists(important_tokens, tok)) {
        _ML_LiTok_Destroy(tok);
    }
}


#define _ML_COMP_Ternary
/// _ML_COMP_Ternary(tok, argstack)
/// @argType    r,r
/// @returnType void
/// @hidden     true
var token = argument0;
var argstack = argument1;

var op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 3) {
    ML_RaiseException_CurParser(ML_EXCEPT_TERNARY,_ML_LiTok_GetPos(argument0),
            "missing value for '" + string(_ML_LiTok_GetVal(argument0)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;   
}
var rhs = ds_stack_pop(argstack);
var rhs_type = rhs[0];

var mhs = ds_stack_pop(argstack);
var mhs_type = mhs[0];

var lhs = ds_stack_pop(argstack);
var lhs_type = lhs[0];

var argstring = lhs_type + "$" + mhs_type + "$" + rhs_type;
var exact_operator = _ML_LiF_GetFunc(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(argument0),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(argument0)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;
} 
_ML_LiTok_SetType(token, ML_TT_FUNCFLAT);
_ML_LiTok_SetOperator(token, exact_operator);
_ML_LiTok_SetArgcount(token, 3);
var ctt;
ctt[0] = _ML_LiS_GetRettype(exact_operator);
ctt[1] = ML_CTT_VARIABLE;
ds_stack_push(argstack, ctt);


#define _ML_COMP_Unary
///_ML_COMP_Unary( token, argstack)
/// @argType    r,r
/// @returnType void
/// @hidden     true

var token = argument0;
var argstack = argument1;
var op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 1) {
    ML_RaiseException_CurParser(ML_EXCEPT_UNOPERATOR,_ML_LiTok_GetPos(token),
            "missing value for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
var lhs = ds_stack_pop(argstack);
var lhs_type = lhs[0];

var argstring = lhs_type;
var exact_operator = _ML_LiF_GetFunc(op, argstring);

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 
_ML_LiTok_SetType(token, ML_TT_FUNCFLAT);
_ML_LiTok_SetOperator(token, exact_operator);
_ML_LiTok_SetArgcount(token, 1);
var ctt;
ctt[0] = _ML_LiS_GetRettype(exact_operator);
ctt[1] = ML_CTT_VARIABLE;
ds_stack_push(argstack, ctt);


#define _ML_COMP_Value
///_ML_COMP_Value( token, argstack)
/// @argType    r,r
/// @returnType void
/// @hidden     true

var tok = argument0;
var argTypeStack = argument1;
var ctt;
ctt[0] = _ML_LiTok_GetOperator(tok);
ctt[1] = ML_CTT_CONSTANT;
ds_stack_push(argTypeStack, ctt);


#define _ML_COMP_Variable
///_ML_COMP_Variable( token, argstack)
/// @argType    r,r
/// @returnType void
/// @hidden     true

var tok = argument0;
var argTypeStack = argument1;
var v = _ML_LiTok_GetOperator(tok);
var ctt;
ctt[0] = _ML_LiVar_GetType(v);
if (_ML_LiVar_GetReadonly(v)) {
    ctt[1] = ML_CTT_VARIABLE;
} else {
    ctt[1] = ML_CTT_ASSIGNABLE;
}
ds_stack_push(argTypeStack, ctt);


#define _ML_EC_DataInBuff
///_ML_EC_DataInBuff(buff, data, type)
/// @argType    r, a, r
/// @returnType void
/// @hidden     true

var buff = argument0;
var data = argument1;
var type = argument2;

buffer_write(buff, buffer_u8, type);
buffer_write(buff, type, data);


#define _ML_EC_RPNtoBuff
///_ML_EC_RPNtoBuff(buffer, queue_source)
/// @argType    r, r
/// @returnType void
/// @hidden     true

var buffer = argument0;
var source = argument1;
var rpn = ds_queue_create();
ds_queue_copy(rpn, source);
var s = ds_queue_size(rpn);

var tok;

buffer_write(b, buffer_u8, ds_type_queue);

repeat (s) {
    tok = ds_queue_dequeue(rpn);   
    
    buffer_write(b,buffer_u8, $C1);
    _ML_LiTok_ToBuff(b, tok);
    buffer_write(b, buffer_u8, $FF);

}

buffer_write(b, buffer_u8, $FF);

ds_queue_destroy(rpn);


#define _ML_FirstStringPos
/// _ML_FirstStringPos(str, token1,token2,...,token16)
/// @argType    s,s ... s
/// @returnType r
/// @hidden     true

var num, str, pos;
num = argument_count - 1;
str = argument[0];

pos = 0;

var i;
for (i = 1; i <= num; ++i) {
    tp = string_pos(argument[i], str);
    if (tp != 0 && (tp < pos || pos == 0)) {
        pos = tp;
    }
}

return pos;


#define _ML_FirstStringPos1
/// _ML_FirstStringPos1(str, token1)
/// @argType    s,s
/// @returnType r
/// @hidden     true

var num, str, pos;
num = 1;
str = argument0;

pos = string_pos(argument1, argument0);

return pos;


#define _ML_FirstStringPos2
/// _ML_FirstStringPos2(str, token1, token2)
/// @argType    s,s,s
/// @returnType r
/// @hidden     true

var num, str, pos, p1, p2;
num = 2;
str = argument[0];
pos = 0;

var i;
for (i = 0; i < num; ++i) {
    tp = string_pos(argument[i+1], str);
    if (tp != 0 && (tp < pos || pos == 0)) {
        pos = tp;
    }
}

return pos;


#define _ML_FirstStringPos3
/// _ML_FirstStringPos3(str, token1, token2, token3)
/// @argType    s,s,s,s
/// @returnType r
/// @hidden     true

var num, str, pos, p1, p2;
num = 3;
str = argument[0];
pos = 0;

var i;
for (i = 0; i < num; ++i) {
    tp = string_pos(argument[i+1], str);
    if (tp != 0 && (tp < pos || pos == 0)) {
        pos = tp;
    }
}

return pos;


#define _ML_Interpret_Detail
/// _ML_Interpret_Detail(parser, string, resobj)
/// @argType    r, s, r
/// @returnType void
/// @hidden     true
/*
**  Usage:
**      ML_Interpret(parser, string, resobj)
**
**  Arguments:
**      parser      parser index
**
**  Returns:
**      result of expression
**
**  Notes:
*/

var rpn, tokenlist, ans;

var parser = argument0;
var func_string = argument1;
var res_obj = argument2;
global._ML_CURRENTPARSER_ = parser;

_ML_LiRO_SetCalculated(res_obj, false);
_ML_LiRO_Clear(res_obj);
if (!ML_NoException(parser)) return 0;

tokenlist = ds_list_create();
rpn = ds_list_create();

do {
    _ML_LexicalAnalysis(parser, tokenlist, func_string);
    if (!ML_NoException(parser))  {break;}
    
    _ML_ShuntingYard(parser, tokenlist, rpn);    
    if (!ML_NoException(parser))  { break;}
    ans = _ML_Parse(parser, rpn, res_obj);    
    if (!ML_NoException(parser)) {break;}
    _ML_LiRO_SetFinal(res_obj, ans);
    _ML_LiRO_SetCalculated(res_obj, true);
} until 1 = 1


//cleanup
ds_list_destroy(rpn);
_ML_TokCleanUp(tokenlist);
ds_list_destroy(tokenlist);



#define _ML_LexicalAnalysis
///_ML_LexicalAnalysis(parser, tokenlist, string)
/// @argType    r, r, s
/// @returnType r
/// @hidden     true

var str, s, c, tc, tokenstr, tstr, p, tokenlist;

var l = 0;
var level = 0;
var maxlevel = 0;

//lists
var parser = argument0;
str = argument2;

var P_ROOTS = _ML_LiP_GetOperatorRoots(parser);

//initialize
tokenlist = argument1;
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
                ++l;
            }
        } else if (_ML_LEX_Alpha(c) || c == "_") {
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if !(_ML_LEX_Word(tc)) break;
                ++l;
            }
            --l;
        } else if (_ML_LEX_Digit(c)) { 
            l = 2;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                if (!_ML_LEX_Digit(tc) && tc != ".") break;
                ++l;
            }
            --l;
        } else if (_ML_LEX_Punct(c)) {
            l = 2;
            tstr = c;
            var baselength = 1;
            var v;
            while (l <= string_length(str) ){
                tc = string_char_at(str,l);
                tstr += tc;
                v = ds_map_find_value(P_ROOTS, tstr);
                if (!is_array(v)) {
                    break;
                }
                if (v[1] > 0) {
                    baselength = l;
                }
                
                ++l;
            }
            l = baselength;
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
if (s > 0) {
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
    } else if _ML_LEX_IsValue(tok, -1 ){
        v = ML_TT_VALUE;
    } else {
        v = ML_TT_UNKNOWN;
    }
    _ML_LEX_TokenSetType(parser, tok, v);
    
    if (!ML_NoException(parser)) return tokenlist;
    //middle tokens
    prevtok = tok;
    for (i = 1; i < s; ++i) {
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
        } else if _ML_LEX_IsValue(tok, prevtok){
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
}
return true;


#define _ML_LEX_Alnum
///_ML_LEX_Alnum(char)
/// @argType    s
/// @returnType r
/// @hidden     true
//echecks  if character is alpha
var v = ord(argument0);
return (v >= 48 && v <= 57) || (v >= 65 && v <= 90) || (v >= 97 && v <= 122);


#define _ML_LEX_Alpha
///_ML_LEX_Alpha(char)
/// @argType    s
/// @returnType r
/// @hidden     true
//echecks  if character is alpha
var v = ord(argument0);
return (v >= 65 && v <= 90) || (v >= 97 && v <= 122);


#define _ML_LEX_Blank
///_ML_LEX_Blank(char)
/// @argType    s
/// @returnType r
/// @hidden     true
//echecks  if character is space
var v = ord(argument0);
return (v == 32 || v == 9);


#define _ML_LEX_Cntrl
///_ML_LEX_Cntrl(char)
/// @argType    s
/// @returnType r
/// @hidden     true
//checks  if character is controll 
var v = ord(argument0);
return (v <= 31);


#define _ML_LEX_Digit
///_ML_LEX_Digit(char)
/// @argType    s
/// @returnType r
/// @hidden     true
//echecks  if character is digit
var v = ord(argument0);
return (v >= 48 && v <= 57);


#define _ML_LEX_Graph
///_ML_LEX_Graph(char)
/// @argType    s
/// @returnType r
/// @hidden     true

var v = ord(argument0);
return (v >= 65 && v <= 90) || (v >= 97 && v <= 122);


#define _ML_LEX_IsAssignoper
///_ML_LEX_IsAssignoper(parser, token, prevtok)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true

var vstr, ret, prevtok, t;
var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument0);
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));
if !ds_map_exists(P_ASSIGNOPER, vstr) return false;
ret = false;
if (prevtok >= 0) {
    switch (_ML_LiTok_GetType(prevtok)) {
    case ML_TT_VARIABLE:
        ret = true;
    break;
    }
}
return ret;


#define _ML_LEX_IsBinoper
///_ML_LEX_IsBinoper(parser, token, prevtok)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true

var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
var vstr, p, ret, prevtok, t;
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));

if !ds_map_exists(P_BINOPER, vstr) return false;
ret = false;
if (prevtok >= 0) {
    switch (_ML_LiTok_GetType(prevtok)) {
    case ML_TT_UNARY:
        if (_ML_LiUOp_GetAffix(_ML_LiTok_GetOperator(prevtok)) == ML_UO_POSTFIX) {
            ret = true;
        }
    break;
    case ML_TT_RIGHTP:
        ret = true;
    break;
    case ML_TT_VARIABLE:
        ret = true;
    break;
    case ML_TT_VALUE:
        ret = true;
    break;
    }
}
return ret;


#define _ML_LEX_IsFunction
///_ML_LEX_IsFunction(parser, token, prevtok)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true

var P_FUNCTION = _ML_LiP_GetFunctionTable(argument0);
var vstr, p, ret, prevtok, t;
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));
return ds_map_exists(P_FUNCTION, vstr);


#define _ML_LEX_IsTernOper
///_ML_LEX_IsTernOper(parser, token, previoustoken)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true


var vstr, p, ret, prevtok, t;
var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument0);
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));

if !ds_map_exists(P_TERNOPER, vstr) return false;
if (prevtok >= 0) {
    switch (_ML_LiTok_GetType(prevtok)) {
    case ML_TT_UNARY:
        if (_ML_LiUOp_GetAffix(_ML_LiTok_GetOperator(prevtok)) == ML_UO_POSTFIX) {
            ret = true;
        }
    break;
    case ML_TT_RIGHTP:
    case ML_TT_VARIABLE:
    case ML_TT_VALUE:
        ret = true;
    break;
    }
}
return ret;


#define _ML_LEX_IsTernOper2
///_ML_LEX_IsTernOper2(parser, token, previoustoken)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true
var vstr, p, ret, prevtok, t;
var P_TERNOPER2 = _ML_LiP_GetTernOps2Table(argument0);
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));

if !ds_map_exists(P_TERNOPER2, vstr) return false;

ret = false;
if (prevtok >= 0) {
    switch (_ML_LiTok_GetType(prevtok)) {
    case ML_TT_UNARY:
        if (_ML_LiUOp_GetAffix(_ML_LiTok_GetOperator(prevtok)) == ML_UO_POSTFIX) {
            ret = true;
        }
    break;
    case ML_TT_RIGHTP:
    case ML_TT_VARIABLE:
    case ML_TT_VALUE:
        ret = true;
    break;
    }
}
return ret;


#define _ML_LEX_IsUnoper
///_ML_LEX_IsUnoper(parser, token, prevtok)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true

var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
var vstr, ret, prevtok, t, op;
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));
var tkey = ds_map_find_first(P_UNOPER);


if !ds_map_exists(P_UNOPER, vstr) return false;
op = ds_map_find_value(P_UNOPER,vstr);
if (prevtok >= 0) {
    ret = false;
    if (_ML_LiUOp_GetAffix(op) == ML_UO_PREFIX) {
        switch (_ML_LiTok_GetType(prevtok)) {
        case ML_TT_BINARY:
            ret = true;
        break;
        case ML_TT_UNARY:
            if (_ML_LiUOp_GetAffix(_ML_LiTok_GetOperator(prevtok)) == ML_UO_PREFIX ) {
                ret = true;
            }
        break;
        case ML_TT_LEFTP:
            ret = true;
        break;
        case ML_TT_ASSIGN:
            ret = true;
        break;
        case ML_TT_COMMA:
            ret = true;
        break;
        case ML_TT_ARGSEP:
            ret = true;
        break;
        }
    } else {
        switch (_ML_LiTok_GetType(prevtok)) {
        case ML_TT_UNARY:
            if (_ML_LiUOp_GetAffix(_ML_LiTok_GetOperator(prevtok)) == ML_UO_POSTFIX) {
                ret = true;
            }
        break;
        
        case ML_TT_RIGHTP:
            ret = true;
        break;
        case ML_TT_FUNCTION:
            ret = true;
        break;
        case ML_TT_VARIABLE:
            ret = true;
        break;
        case ML_TT_VALUE:
            ret = true;
        break;
        }
    }
} else {
    ret = (_ML_LiUOp_GetAffix(op) == ML_UO_PREFIX);
}
return ret;


#define _ML_LEX_IsValue
///_ML_LEX_IsValue(token, prevtok)
/// @argType    r,r
/// @returnType r
/// @hidden     true

var vstr, i, s, prevtok;
vstr = string(_ML_LiTok_GetVal(argument0));
prevtok = argument1;
if (vstr == ".") return false;
var start_c;
start_c = string_char_at(vstr,1);
if (start_c == "'" || start_c == '"') return true;


s = string_length(vstr);
i = 1;
//before dot:
var c;
do {
    c = string_char_at(vstr,i);
    ++i;
    if (c == ".") break;
    if !_ML_LEX_Digit(c) return false;
    
} until (i > s)
if (c = "." && i <= s) {
    do {
        c = string_char_at(vstr,i);
        if !_ML_LEX_Digit(c) return false;
        ++i;
    } until (i > s)
}

return true;


#define _ML_LEX_IsVariable
///_ML_LEX_IsVariable(parser, token, prevtok)
/// @argType    r,r,r
/// @returnType r
/// @hidden     true

var P_VARIABLE = _ML_LiP_GetVariableTable(argument0);
var vstr, p, ret, prevtok, t;
prevtok = argument2;
vstr = string(_ML_LiTok_GetVal(argument1));
return ds_map_exists(P_VARIABLE, vstr);



#define _ML_LEX_Lower
///_ML_LEX_Lower(char)
/// @argType    s
/// @returnType r
/// @hidden     true
v = ord(argument0);
return (v >= 97 && v <= 122);


#define _ML_LEX_Print
///_ML_LEX_Print(char)
/// @argType    s
/// @returnType r
/// @hidden     true

var v = ord(argument0);
return (v >= 65 && v <= 90) || (v >= 97 && v <= 122);


#define _ML_LEX_Punct
///_ML_LEX_Punct(char)
/// @argType    s
/// @returnType r
/// @hidden     true

var v = ord(argument0);
return (v >= 33 && v <= 47) || (v >= 58 && v <= 64) || (v >= 91  && v <= 96) || (v >= 123);


#define _ML_LEX_Space
///_ML_LEX_Space(char)
/// @argType    s
/// @returnType r
/// @hidden     true
var v = ord(argument0);
return v == 32 || (v >= 9 && v <= 13);


#define _ML_LEX_TokenAdd
///_ML_LEX_TokenAdd(list, string, position)
/// @argType    r,s,r
/// @returnType r
/// @hidden     true

var ind = _ML_LiTok_Create(argument1, argument2);
ds_list_add(argument0, ind);

return ind;



#define _ML_LEX_TokenSetType
///_ML_LEX_TokenSetType(parser, token, type)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true


var tok = argument1;
var tokentype = argument2;
var tokenval = string(_ML_LiTok_GetVal(tok));



var operator;
switch (tokentype) {
    case ML_TT_UNARY:
        var P_UNOPER = _ML_LiP_GetUnOpsTable(argument0);
        operator = ds_map_find_value(P_UNOPER, tokenval);
    break;
    case ML_TT_BINARY:
        var P_BINOPER = _ML_LiP_GetBinOpsTable(argument0);
        operator = ds_map_find_value(P_BINOPER, tokenval);
    break;
    case ML_TT_FUNCTION:
        var P_FUNCTION = _ML_LiP_GetFunctionTable(argument0);
        operator = ds_map_find_value(P_FUNCTION, tokenval);
    break;
    case ML_TT_VARIABLE:
        var P_VARIABLE = _ML_LiP_GetVariableTable(argument0);
        operator = ds_map_find_value(P_VARIABLE, tokenval);
    break;
    case ML_TT_ASSIGN:
        var P_ASSIGNOPER = _ML_LiP_GetAssignOpsTable(argument0);
        operator = ds_map_find_value(P_ASSIGNOPER, tokenval);
    break;
    case ML_TT_VALUE:
        if (string_char_at(tokenval,1) == '"' || string_char_at(tokenval,1) == "'") {
            operator = ML_VAL_STRING;
            tokenval = string_copy(tokenval,2,string_length(tokenval)-2);
        } else {
            operator = ML_VAL_REAL;
            tokenval = real(tokenval);
        }
        _ML_LiTok_SetString(tok, tokenval);
    break;
    case ML_TT_TERNARY1:
        var P_TERNOPER = _ML_LiP_GetTernOpsTable(argument0);
        operator = ds_map_find_value(P_TERNOPER, tokenval);
    break;
    case ML_TT_UNKNOWN:
        ML_RaiseException(ML_EXCEPT_UNKNOWNTOKEN, _ML_LiTok_GetPos(tok), 
            "unknown tokentype '" +string(tokenval)+ "' at "+string(_ML_LiTok_GetPos(tok)));
        operator = -1;
    default:
        operator = -1;
    break;
}

_ML_LiTok_SetType(tok, tokentype);
_ML_LiTok_SetOperator(tok, operator);


#define _ML_LEX_Upper
///_ML_LEX_Upper(char)
/// @argType    s
/// @returnType r
/// @hidden     true
var v = ord(argument0);
return (v >= 65 && v <= 90);


#define _ML_LEX_Word
///_ML_LEX_Word(char)
/// @argType    s
/// @returnType r
/// @hidden     true
var v = ord(argument0);
return (v >= 48 && v <= 57) || (v >= 65 && v <= 90) || (v >= 97 && v <= 122) || v == 95;


#define _ML_LEX_Xdigit
///_ML_LEX_Xdigit(char)
/// @argType    s
/// @returnType r
/// @hidden     true
var v = ord(argument0);
return  (v >= 48 && v <= 57) || (v >= 65 && v <= 70) || (v >= 97 && v <= 102);


#define _ML_LiAOpS_Create
///_ML_LiAOpS_Create(script, returntype);

var l = ds_list_create();
ds_list_add(l, argument0); //script
ds_list_add(l, argument1); //return type


return l;



#define _ML_LiAOp_Create
///_ML_LiAOp_Create(name, precedence, associativity)
/// @argType    s,r,r
/// @returnType real
/// @hidden     true

var l = ds_list_create();
ds_list_add(l, argument0); //str
ds_list_add(l, ds_map_create()); //actual underlying
ds_list_add(l, argument1); //precedence
ds_list_add(l, argument2); //associativity

return l;



#define _ML_LiAOp_Destroy
///_ML_LiAOp_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
_ML_LiF_Destroy(argument0);


#define _ML_LiBOpS_Create
///_ML_LiBOpS_Create(script, returntype);

var l = ds_list_create();
ds_list_add(l, argument0); //script
ds_list_add(l, argument1); //return type

return l;



#define _ML_LiBOp_Create
///_ML_LiBOp_Create(name, precedence, associativity)
/// @argType    s,r,r
/// @returnType real
/// @hidden     true

var l = ds_list_create();
ds_list_add(l, argument0); //str
ds_list_add(l, ds_map_create()); //actual underlying
ds_list_add(l, argument1); //precedence
ds_list_add(l, argument2); //associativity

return l;



#define _ML_LiBOp_Destroy
///_ML_LiBOp_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
_ML_LiF_Destroy(argument0);



#define _ML_LiFS_Create
///_ML_LiFS_Create(script, rettype);

var l = ds_list_create();
ds_list_add(l, argument0); //script
ds_list_add(l, argument1); //return type

return l;



#define _ML_LiF_AddSig
///_ML_LiF_AddSig(operator_id, argstring, actual_functor)
var ActualFunctions = ds_list_find_value(argument0, ML_LIFUNC_ACTUAL);
ds_map_add(ActualFunctions, argument1, argument2);



#define _ML_LiF_Create
///_ML_LiF_Create(name)
/// @argType    s
/// @returnType real
/// @hidden     true

var l = ds_list_create();
ds_list_add(l, argument0); //str
ds_list_add(l, ds_map_create()); //actual underlying
return l;


#define _ML_LiF_Destroy
///_ML_LiF_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true

var ActualFunctions = _ML_LiF_GetFuncs(argument0);
var ind = ds_map_find_first(ActualFunctions);
repeat (ds_map_size(ActualFunctions)) {
    _ML_LiS_Destroy(ds_map_find_value(ActualFunctions,ind));
    ind = ds_map_find_next(ActualFunctions, ind);
}
ds_map_destroy(ActualFunctions);
ds_list_destroy(argument0);


#define _ML_LiF_GetFunc
///_ML_LiF_GetFunc(baseopid, signature_string)
/// @argType    r, s
/// @returnType real
/// @hidden     true
var ActualFunctions = _ML_LiF_GetFuncs(argument0);
if (ds_map_exists(ActualFunctions, argument1) ) {
    return ds_map_find_value(ActualFunctions, argument1);
} else {
    return -1;
}



#define _ML_LiF_GetFuncs
///_ML_LiF_GetFuncs(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIFUNC_ACTUAL);


#define _ML_LiOp_GetAssoc
///_ML_LiOp_GetAssoc(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIOP_ASSOC);


#define _ML_LiOp_GetPrec
///_ML_LiOp_GetPrec(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIOP_PREC);


#define _ML_LiP_Create
///_ML_LiP_Create(expression, variable_map)
/// @argType    r,r
/// @returnType real
/// @hidden     true

var ind = ds_list_create();
ds_list_add(ind, ds_map_create()); //binops 0
ds_list_add(ind, ds_map_create()); //unop 1
ds_list_add(ind, ds_map_create()); //assign 2
ds_list_add(ind, ds_map_create()); //ternop 3
ds_list_add(ind, ds_map_create()); //ternop2 4
ds_list_add(ind, ds_map_create()); //function 5
ds_list_add(ind, ds_map_create()); //variable 6

ds_list_add(ind, argument0); //executablestring 7
ds_list_add(ind, argument1); //variable-map 8
ds_list_add(ind, 0); //Error flags 9
ds_list_add(ind, -1); //error pos 10
ds_list_add(ind, ""); //error string 11
ds_list_add(ind, _ML_LiRO_Create()); //resobject 12

ds_list_add(ind, ds_map_create()); //all signature roots 16

return ind;


#define _ML_LiP_Destroy
///_ML_LiP_Destroy(ind);
/// @argType    r
/// @returnType void
/// @hidden     true
var ind = argument0;
ML_ClearFunction(ind);
ML_ClearVariable(ind);
ML_ClearBinaryOper(ind);
ML_ClearUnaryOper(ind);
ML_ClearAssignOper(ind);
ML_ClearTernaryOper(ind);

ds_map_destroy(_ML_LiP_GetBinOpsTable(ind));
ds_map_destroy(_ML_LiP_GetUnOpsTable(ind));
ds_map_destroy(_ML_LiP_GetFunctionTable(ind));
ds_map_destroy(_ML_LiP_GetVariableTable(ind));
ds_map_destroy(_ML_LiP_GetAssignOpsTable(ind));
ds_map_destroy(_ML_LiP_GetTernOpsTable(ind));
ds_map_destroy(_ML_LiP_GetTernOps2Table(ind));
_ML_LiRO_Destroy(_ML_LiP_GetResultObject(ind));
ds_map_destroy(_ML_LiP_GetOperatorRoots(ind));

ds_list_destroy(ind);


#define _ML_LiP_GetAssignOpsTable
///_ML_LiP_GetAssignOpsTable(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_ASOPSTABLE);


#define _ML_LiP_GetBinOpsTable
///_ML_LiP_GetBinOpsTable(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_BINOPSTABLE);


#define _ML_LiP_GetErrorFlags
///_ML_LiP_GetErrorFlags(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_ERRFLAGS);


#define _ML_LiP_GetErrorPos
///_ML_LiP_GetErrorPos(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_ERRPOS);


#define _ML_LiP_GetErrorString
///_ML_LiP_GetErrorString(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_ERRSTRING);


#define _ML_LiP_GetFunctionString
///_ML_LiP_GetFunctionString(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_FUNCSTR);


#define _ML_LiP_GetFunctionTable
///_ML_LiP_GetFunctionTable(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_FUNCTABLE);


#define _ML_LiP_GetOperatorRoots
///_ML_LiP_GetOperatorRoots(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_OPSIGROOTS);


#define _ML_LiP_GetResultObject
///_ML_LiP_GetResultObject(index)
/// @argType    r
/// @returnType real
/// @hidden     true

return ds_list_find_value(argument0, ML_LIP_RESOBJECT);


#define _ML_LiP_GetTernOps2Table
///_ML_LiP_GetTernOps2Table(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_TERNOPS2TABLE);


#define _ML_LiP_GetTernOpsTable
///_ML_LiP_GetTernOpsTable(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_TERNOPSTABLE);


#define _ML_LiP_GetUnOpsTable
///_ML_LiP_GetUnOpsTable(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_UNOPSTABLE);


#define _ML_LiP_GetVariableTable
///_ML_LiP_GetVariableTable(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_VARTABLE);


#define _ML_LiP_GetVarMap
///_ML_LiP_GetVarMap(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIP_VARMAP);


#define _ML_LiP_SetErrorFlags
///_ML_LiP_SetErrorFlags(index, flag)
/// @argType    r, r
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIP_ERRFLAGS, argument1);


#define _ML_LiP_SetErrorPos
///_ML_LiP_SetErrorPos(index, position)
/// @argType    r, r
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIP_ERRPOS, argument1);


#define _ML_LiP_SetErrorString
///_ML_LiP_SetErrorString(index, string)
/// @argType    r, s
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIP_ERRSTRING, argument1);


#define _ML_LiP_SetFunctionString
///_ML_LiP_SetFunctionString(index, string)
/// @argType    r, s
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIP_FUNCSTR, argument1);


#define _ML_LiP_SetVarMap
///_ML_LiP_SetVarMap(index, map)
/// @argType    r, r
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIP_VARMAP, argument1);


#define _ML_LiRO_Add
///_ML_LiRO_Add(ind, answer, type)
/// @argType    r,a,s
/// @returnType void
/// @hidden     true
ds_list_add(_ML_LiRO_GetAll(argument0), argument1);
ds_list_add(_ML_LiRO_GetAllType(argument0), argument2);

#define _ML_LiRO_AddToken
///_ML_LiRO_AddToken(res_obj, token, )
/// @argType    r
/// @returnType real
/// @hidden     true
var lhs_val = 0;
var lhs_type;
var VARMAP = ML_VM_Get(argument0);
var res_obj = argument1;
var lhs = argument2;
if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
    lhs_val = _ML_LiTok_GetVal(lhs);
    lhs_type = _ML_LiTok_GetOperator(lhs);
    _ML_LiRO_Add(res_obj, lhs_val, lhs_type);
} else if (_ML_LiTok_GetType(lhs) == ML_TT_VARIABLE)  {
    var v = _ML_LiTok_GetOperator(lhs);
    lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    lhs_type = _ML_LiVar_GetType(v);
    _ML_LiRO_Add(res_obj, lhs_val, lhs_type);
}
return lhs_val;


#define _ML_LiRO_Clear
///_ML_LiRO_Clear(ind);
/// @argType    r
/// @returnType void
/// @hidden     true
ds_list_clear(_ML_LiRO_GetAll(argument0));
ds_list_clear(_ML_LiRO_GetAllType(argument0));
_ML_LiRO_SetFinal(argument0, 0);


#define _ML_LiRO_Create
///_ML_LiRO_Create()
/// @argType    
/// @returnType real
/// @hidden     true

var ind = ds_list_create();
ds_list_add(ind, false) //set calculated 0
ds_list_add(ind, 0); //answer 1
ds_list_add(ind, ds_list_create()); //all answers 2
ds_list_add(ind, ds_list_create()); //all answers type 3

return ind;


#define _ML_LiRO_Destroy
///_ML_LiRO_Destroy(ind);
/// @argType    r
/// @returnType void
/// @hidden     true

var ind = argument0;
ds_list_destroy(_ML_LiRO_GetAll(ind));
ds_list_destroy(_ML_LiRO_GetAllType(ind));


ds_list_destroy(ind);


#define _ML_LiRO_Get
///_ML_LiRO_Get(ind, n);
/// @argType    r,r
/// @returnType auto
/// @hidden     true
return ds_list_find_value(_ML_LiRO_GetAll(argument0), argument1);


#define _ML_LiRO_GetAll
///_ML_LiRO_GetAll(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIRO_ALLANSWERS);


#define _ML_LiRO_GetAllType
///_ML_LiRO_GetAllType(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIRO_ALLANSWERSTYPE);


#define _ML_LiRO_GetCalculated
///_ML_LiRO_GetCalculated(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIRO_CALCULATED);


#define _ML_LiRO_GetFinal
///_ML_LiRO_GetFinal(index)
/// @argType    r
/// @returnType auto
/// @hidden     true
return ds_list_find_value(argument0, ML_LIRO_ANSWER);


#define _ML_LiRO_GetType
///_ML_LiRO_GetType(ind, n);
/// @argType    r,r
/// @returnType string
/// @hidden     true
var list = _ML_LiRO_GetAllType(argument0);
return ds_list_find_value(list, argument1);


#define _ML_LiRO_SetCalculated
///_ML_LiRO_SetCalculated(index, calc)
/// @argType    r, any
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIRO_CALCULATED, argument1);


#define _ML_LiRO_SetFinal
///_ML_LiRO_SetFinal(index, answer)
/// @argType    r, any
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LIRO_ANSWER, argument1);


#define _ML_LiRO_Size
///_ML_LiRO_Size(ind);
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_size(_ML_LiRO_GetAll(argument0));


#define _ML_LiS_Create
///_ML_LiS_Create(script, rettype);
/// @argType    r,s
/// @returnType real
/// @hidden     true
var l = ds_list_create();
ds_list_add(l, argument0); //script
ds_list_add(l, argument1); //return type

return l;



#define _ML_LiS_Destroy
///_ML_LiS_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
ds_list_destroy(argument0);



#define _ML_LiS_GetRettype
///_ML_LiS_GetRettype(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LIS_RETTYPE);


#define _ML_LiS_GetScript
///_ML_LiS_GetScript(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIS_SCRIPT);


#define _ML_LiTok_Create
///_ML_LiTok_Create( string, pos)
/// @argType    r,r
/// @returnType real
/// @hidden     true
var l = ds_list_create();
ds_list_add(l, ML_TT_UNKNOWN); //type
ds_list_add(l, argument0); //string
ds_list_add(l, argument1); //pos
ds_list_add(l, -1); //operator
ds_list_add(l, 0); //argc
return l;

//operator is a link to function/variable index:
//special for value - is then ML_VAL_REAL/ML_VAL_STRING
//ternary2 also has NOONE

//string is actual value for "ML_TT_VALUE", otherwise just debug string


#define _ML_LiTok_Destroy
///_ML_LiTok_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
ds_list_destroy(argument0);


#define _ML_LiTok_FromBuff
///_ML_LiTok_FromBuff(tok, buffer);
/// @argType    r, r
/// @returnType void
/// @hidden     true

//[type, val, pos, argcount]


var tok = argument0;
var b = argument1;

var v, val_type;
val_type = buffer_read(b, buffer_u8);
v = _ML_BD_GetData(b, val_type);
if (v[1]) { return 0}
_ML_LiTok_SetType(tok, v[0]);



#define _ML_LiTok_GetArgcount
///_ML_LiTok_GetArgcount(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LITOK_ARGC);


#define _ML_LiTok_GetOperator
///_ML_LiTok_GetOperator(index)
/// @argType    r
/// @returnType any
/// @hidden     true

return ds_list_find_value(argument0, ML_LITOK_OP);


#define _ML_LiTok_GetPos
///_ML_LiTok_GetPos(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LITOK_POS);


#define _ML_LiTok_GetType
///_ML_LiTok_GetType(index)
/// @argType    r
/// @returnType r
/// @hidden     true
return ds_list_find_value(argument0, ML_LITOK_TYPE);


#define _ML_LiTok_GetVal
///_ML_LiTok_GetVal(index)
/// @argType    r
/// @returnType any
/// @hidden     true
return ds_list_find_value(argument0, ML_LITOK_STR);


#define _ML_LiTok_SetArgcount
///_ML_LiTok_SetArgcount(index, argc)
/// @argType    r,r
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LITOK_ARGC, argument1);


#define _ML_LiTok_SetOperator
///_ML_LiTok_SetOperator(index, Op)
/// @argType    r,a
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LITOK_OP, argument1);


#define _ML_LiTok_SetString
///_ML_LiTok_SetString(index, str)
/// @argType    r,s
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LITOK_STR, argument1);


#define _ML_LiTok_SetType
///_ML_LiTok_SetType(index, type)
/// @argType    r,r
/// @returnType void
/// @hidden     true
ds_list_replace(argument0, ML_LITOK_TYPE, argument1);


#define _ML_LiTok_ToBuff
///_ML_LiTok_ToBuff(buffer, tok);
/// @argType    r, r
/// @returnType void
/// @hidden     true

//[type, val, pos, argcount]



var tok = argument1;
var s = ds_list_size(tok);
var b = argument0;

var type, val;
val = _ML_LiTok_GetType(tok);
type = buffer_u8;
//_ML_C_DataInBuff(b, val, type);
val = _ML_LiTok_GetVal(tok);
if (is_string(val)) {
    type = buffer_string;
} else {
    type = buffer_f64;
}/*
_ML_C_DataInBuff(b, val, type);
val = _ML_LiTok_GetPos(tok);
type = buffer_u32;
_ML_C_DataInBuff(b, val, type);

val = _ML_LiTok_GetArgcount(tok);
type = buffer_u32;
_ML_C_DataInBuff(b, val, type);//*/


#define _ML_LiTOpS_Create
///_ML_LiTOpS_Create(script, returntype);

var l = ds_list_create();
ds_list_add(l, argument0); //script
ds_list_add(l, argument1); //return type


return l;



#define _ML_LiTOp_Create
///_ML_LiTOp_Create(name_P1, name_P2, precedence, associativity)
/// @argType    s,s,r,r
/// @returnType real
/// @hidden     true

var l = ds_list_create();
ds_list_add(l, argument0 + argument1); //fullname
ds_list_add(l, ds_map_create()); //actual underlying
ds_list_add(l, argument2); //precedence
ds_list_add(l, argument3); //associativity
ds_list_add(l, argument0); //str1
ds_list_add(l, argument1); //str2

return l;



#define _ML_LiTOp_Destroy
///_ML_LiTOp_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
_ML_LiF_Destroy(argument0);


#define _ML_LiTOp_GetFirstName
///_ML_LiTOp_GetFirstName(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LITOP_STR_P1);


#define _ML_LiTOp_GetSecondName
///_ML_LiTOp_GetSecondName(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LITOP_STR_P2);


#define _ML_LiUOpS_Create
///_ML_LiUOpS_Create(script, returntype);

var l = ds_list_create();
ds_list_add(l, argument0); //script
ds_list_add(l, argument1); //return type


return l;



#define _ML_LiUOp_Create
///_ML_LiUOp_Create(name, precedence, associativity, affix)
/// @argType    s,r,r,r
/// @returnType real
/// @hidden     true

var l = ds_list_create();
ds_list_add(l, argument0); //str
ds_list_add(l, ds_map_create()); //actual underlying
ds_list_add(l, argument1); //precedence
ds_list_add(l, argument2); //associativity
ds_list_add(l, argument3); //affix


return l;



#define _ML_LiUOp_Destroy
///_ML_LiUOp_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
_ML_LiF_Destroy(argument0);


#define _ML_LiUOp_GetAffix
///_ML_LiUOp_GetAffix(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIUOP_AFFIX);


#define _ML_LiVar_Create
///_ML_LiVar_Create(string, type, readonly)
/// @argType    s, s, r
/// @returnType real
/// @hidden     true
var l = ds_list_create();
ds_list_add(l, argument0); //str
ds_list_add(l, argument2); //readonly
ds_list_add(l, argument1); //type
return l;


#define _ML_LiVar_Destroy
///_ML_LiVar_Destroy(index)
/// @argType    r
/// @returnType void
/// @hidden     true
ds_list_destroy(argument0);


#define _ML_LiVar_GetReadonly
///_ML_LiVar_GetReadonly(index)
/// @argType    r
/// @returnType real
/// @hidden     true
return ds_list_find_value(argument0, ML_LIVAR_READONLY);


#define _ML_LiVar_GetType
///_ML_LiVar_GetType(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LIVAR_TYPE);


#define _ML_Li_GetName
///_ML_Li_GetName(index)
/// @argType    r
/// @returnType string
/// @hidden     true
return ds_list_find_value(argument0, ML_LI_STR);


#define _ML_NewAssignOper
///  _ML_NewAssignOper(operator, precedence, script,returntype, lhstype, rhstype, assoc)
/// @argType    s,r,r,s,s,s,r
/// @returnType r
/// @hidden     true

var ind = _ML_LiAOp_Create(argument0, argument1, argument6);
_ML_LiF_AddSig(ind, argument4 +"$" + argument5, _ML_AddAssignSig(argument2, argument3));
return ind;


#define _ML_NewBinaryOper
/// _ML_NewBinaryOper(operator,precedence,script,returntype, lhstype, rhstype, assoc)
/// @argType    s,r,r,s,s,s,r
/// @returnType r
/// @hidden     true

var ind = _ML_LiBOp_Create(argument0, argument1, argument6);
_ML_LiF_AddSig(ind, argument4 +"$" + argument5, _ML_AddBinarySig(argument2, argument3));
return ind;


#define _ML_NewFunction
/// _ML_NewFunction(function_string,script,returntype, arglist)
/// @argType    s,r,s,r
/// @returnType r
/// @hidden     true

var ind = _ML_LiF_Create(argument0);
var argstr = "";
var c = ds_list_size(argument3);
if (c > 0) {
    argstr = ds_list_find_value(argument3, 0);
    for (var i = 1; i < c; ++i) {
        argstr += "$" + ds_list_find_value(argument3, i);
    }
}

_ML_LiF_AddSig(ind, argstr, _ML_AddFunctionSig(argument1, argument2));
return ind;


#define _ML_NewTernaryOper
///   _ML_NewTernaryOper(operator1, operator2,precedence,script,returntype, lhstype, mhstype, rhstype, assoc)
/// @argType    s,s,r,r,s,s,s,s,r
/// @returnType r
/// @hidden     true
var ind = _ML_LiTOp_Create(argument0, argument1, argument2, argument8);
_ML_LiF_AddSig(ind, argument5 +"$" + argument6 + "$" +argument7, 
            _ML_AddTernarySig(argument3, argument4));
return ind;


#define _ML_NewUnaryOper
/// _ML_NewUnaryOper(operator, precedence,script,returntype, lhstype, affix)
/// @argType    s,r,r,s,s,r
/// @returnType r
/// @hidden     true

var assoc;
if (argument5 == ML_UO_PREFIX) {
    assoc = ML_O_RIGHTASSOC;
} else {
    assoc = ML_O_LEFTASSOC;
}

var ind = _ML_LiUOp_Create(argument0, argument1, assoc, argument5);
_ML_LiF_AddSig(ind, argument4, _ML_AddUnarySig(argument2, argument3));
return ind;



#define _ML_OpAddRoots
/// _ML_OpAddRoots(parser, string)
/// @argType    r,s
/// @returnType r
/// @hidden     true


var P_ROOTS = _ML_LiP_GetOperatorRoots(argument0);

var operatorstring = argument1;
var length = string_length(operatorstring);
var tstr = "";
var v = 0;
var fullsize = 0;
for (var i = 1; i <= length; ++i) {
    tstr += string_char_at(operatorstring, i);
    v = ds_map_find_value(P_ROOTS, tstr);  
    if (i == length) {
        fullsize = 1;
    }
    if (is_array(v)) {
        v[@ 0] += 1;
        v[@ 1] += fullsize;
    } else {
        v[0] = 1;
        v[1] = fullsize;
        ds_map_add(P_ROOTS, tstr, v);
    }

}
return 0;


#define _ML_OpRemRoots
/// _ML_OpRemRoots(parser, string)
/// @argType    r,s
/// @returnType r
/// @hidden     true

var P_ROOTS = _ML_LiP_GetOperatorRoots(argument0);

var operatorstring = argument1;
var length = string_length(operatorstring);
var tstr = "";
var v = 0;
var fullsize = 0;
for (var i = 1; i <= length; ++i) {
    tstr += string_char_at(operatorstring, i);
    v = ds_map_find_value(P_ROOTS, tstr);
    if (i == length) {
        fullsize = 1;
    }
    if (v[0] > 1) {
        v[@ 0] -= 1;
        v[@ 1] -= fullsize;
    } else {
        ds_map_delete(P_ROOTS, tstr);
    }
}


#define _ML_Parse
///_ML_Parse(parser, ReversePolishQueue, ResultObject)
/// @argType    r,r,r
/// @returnType auto
/// @hidden     true

//reverse polish notation of tokens;
var parser = argument0;
var rpn = argument1;
var res_obj = argument2;
var lhs_val = 0;

var VARMAP = _ML_LiP_GetVarMap(parser);

while (!ds_list_empty(rpn) && ML_NoException(parser)) {
    lhs_val = _ML_PARSE_EvalLine(parser, rpn, res_obj);
}
return lhs_val;


#define _ML_ParseCompiled
///_ML_ParseCompiled(parser, ReversePolishQueue, ResultObject)
/// @argType    r,r,r
/// @returnType auto
/// @hidden     true

//reverse polish notation of tokens;
var parser = argument0;
var rpn = argument1;
var res_obj = argument2;
var VARMAP = _ML_LiP_GetVarMap(parser);

var rpn_size = ds_list_size(rpn);
var tok_index = 0;
//while (!ds_queue_empty(rpn) && ML_NoException(parser)) {
while (tok_index < rpn_size && ML_NoException(parser)) {
    tok_index = _ML_PARSECOMP_EvalLine(parser, rpn, res_obj);
}

return _ML_LiRO_Get(res_obj, _ML_LiRO_Size(res_obj) - 1);


#define _ML_PARSECOMP_EvalLine
///_ML_PARSECOMP_EvalLine(parser, rpn, resultObject)
/// @argType    r,r,r
/// @returnType real
/// @hidden     true
var parser = argument0;
var rpn = argument1;
var res_obj = argument2;
var args = ds_stack_create();
var expression_terminator = false;
var tok, lhs, lhs_val, lhs_type;
var rpn_size = ds_list_size(rpn);
var tok_index = 0;
var temptokens = ds_list_create();

while (tok_index < rpn_size && expression_terminator == false && ML_NoException(parser)) {
    //tok = ds_queue_dequeue(rpn);
    tok = ds_list_find_value(rpn, tok_index);
    ++tok_index;
    expression_terminator = _ML_PARSECOMP_EvalToken(parser, args, tok, temptokens);
}
if (ML_NoException(parser)) {
    if (ds_stack_size(args) > 1) {
        ML_RaiseException(ML_EXCEPT_VALUE,-1,
            "missing operator or function in expression");
    }
}
if (!ds_stack_empty(args)) {
    lhs = ds_stack_pop(args);
    _ML_LiRO_AddToken(parser, res_obj, lhs);
}
ds_stack_destroy(args);

_ML_TokCleanUp(temptokens);
ds_list_destroy(temptokens);
return tok_index;


#define _ML_PARSECOMP_EvalToken
///_ML_PARSECOMP_EvalToken(parser, argTypeStack, token, temptokens)
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true
var parser = argument0;
var args = argument1;
var tok = argument2;
var temptokens = argument3;

switch (_ML_LiTok_GetType(tok)) {
case ML_TT_FUNCFLAT:
    _ML_PARSE_FuncFlat(parser, tok, args, temptokens);
break;
case ML_TT_ASSIGNFLAT:
    _ML_PARSE_AssignFlat(parser, tok, args, temptokens);
break;
case ML_TT_VARIABLE:
case ML_TT_VALUE:
    _ML_PARSE_Value(tok, args);
break;
case ML_TT_EXPRTERMINATOR:
    return true;
break;
}
return false;


#define _ML_PARSE_Assign
///_ML_PARSE_Assign(parser, token, args)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true
var op, lhs, rhs, lhs_val, rhs_val, ret, lhs_type, rhs_type;

var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;
op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 2) {
    ML_RaiseException_CurParser(ML_EXCEPT_BINOPERATOR,_ML_LiTok_GetPos(token),
            "missing value for'" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
rhs = ds_stack_pop(argstack);
if (_ML_LiTok_GetType(rhs) == ML_TT_VALUE) {
    rhs_val = _ML_LiTok_GetVal(rhs);
    rhs_type = _ML_LiTok_GetOperator(rhs);
} else {
    var v = _ML_LiTok_GetOperator(rhs);
    rhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    rhs_type = _ML_LiVar_GetType(v);
}
lhs = ds_stack_top(argstack);
var v;
v = _ML_LiTok_GetOperator(lhs);

if (_ML_LiTok_GetType(lhs) != ML_TT_VARIABLE || _ML_LiVar_GetReadonly(v)) {
    ML_RaiseException_CurParser(ML_EXCEPT_ASSIGN,_ML_LiTok_GetPos(token),
            "Left hand side is not assignable '" + string(_ML_LiTok_GetVal(lhs)) +"' at " +string(_ML_LiTok_GetPos(lhs)));
    return 0;
}

lhs_type = _ML_LiVar_GetType(v);

var exact_operator, argstring;

argstring = lhs_type + "$" + rhs_type;
exact_operator = _ML_LiF_GetFunc(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(argument0),
        "Invalid assignment type for '" + string(_ML_LiTok_GetVal(argument0)) +"' at " +string(_ML_LiTok_GetPos(argument0)));
    return 0;
} 
ret = script_execute(_ML_LiS_GetScript(exact_operator),VARMAP, _ML_Li_GetName(v),rhs_val);
//create "temp" token with lhs_val:
_ML_LiTok_SetString(lhs, ret);
_ML_LiTok_SetType(lhs, ML_TT_VALUE);
_ML_LiTok_SetOperator(lhs, _ML_LiS_GetRettype(exact_operator));


#define _ML_PARSE_AssignFlat
///_ML_PARSE_AssignFlat(parser, token, args, temptokens)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true
var op, lhs, rhs, lhs_val, rhs_val, ret;

var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;
var temptokens = argument3;
var func = _ML_LiTok_GetOperator(token);
var func_script = _ML_LiS_GetScript(func);
if (ds_stack_size(argstack) < 2) {
    ML_RaiseException_CurParser(ML_EXCEPT_BINOPERATOR,_ML_LiTok_GetPos(token),
            "missing value for'" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
rhs = ds_stack_pop(argstack);
if (_ML_LiTok_GetType(rhs) == ML_TT_VALUE) {
    rhs_val = _ML_LiTok_GetVal(rhs);
} else {
    var v = _ML_LiTok_GetOperator(rhs);
    rhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
}
lhs = ds_stack_pop(argstack);
var v = _ML_LiTok_GetOperator(lhs);

if (_ML_LiTok_GetType(lhs) != ML_TT_VARIABLE || _ML_LiVar_GetReadonly(v)) {
    ML_RaiseException_CurParser(ML_EXCEPT_ASSIGN,_ML_LiTok_GetPos(token),
            "Left hand side is not assignable '" + string(_ML_LiTok_GetVal(lhs)) +"' at " +string(_ML_LiTok_GetPos(lhs)));
    return 0;
}

ret = script_execute(func_script, VARMAP, _ML_Li_GetName(v),rhs_val);
//create "temp" token with lhs_val:
var temptok = _ML_LiTok_Create(ret, _ML_LiTok_GetPos(token));
_ML_LiTok_SetType(temptok, ML_TT_VALUE);
_ML_LiTok_SetOperator(temptok, _ML_LiS_GetRettype(func));

ds_stack_push(argstack, temptok);
ds_list_add(temptokens, temptok);


#define _ML_PARSE_Binary
/// _ML_PARSE_Binary(parser, tok, argstack)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true
var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;
var op, lhs, rhs, lhs_val, rhs_val, ret, rhs_type, lhs_type, v;

op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 2) {
    ML_RaiseException_CurParser(ML_EXCEPT_BINOPERATOR, _ML_LiTok_GetPos(token),
            "missing value for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
rhs = ds_stack_pop(argstack);
if (_ML_LiTok_GetType(rhs) == ML_TT_VALUE) {
    rhs_val = _ML_LiTok_GetVal(rhs);
    rhs_type = _ML_LiTok_GetOperator(rhs);
} else {
    v = _ML_LiTok_GetOperator(rhs);
    rhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    rhs_type = _ML_LiVar_GetType(v);
}
lhs = ds_stack_top(argstack);
if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
    lhs_val = _ML_LiTok_GetVal(lhs);
    lhs_type = _ML_LiTok_GetOperator(lhs);
} else {
    v = _ML_LiTok_GetOperator(lhs);
    lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    lhs_type = _ML_LiVar_GetType(v);
}
var exact_operator, argstring;

argstring = lhs_type + "$" + rhs_type;

exact_operator = _ML_LiF_GetFunc(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 
ret = script_execute(_ML_LiS_GetScript(exact_operator),lhs_val,rhs_val);
//create "temp" token with lhs_val:
_ML_LiTok_SetString(lhs, ret);
_ML_LiTok_SetType(lhs, ML_TT_VALUE);
_ML_LiTok_SetOperator(lhs, _ML_LiS_GetRettype(exact_operator));


#define _ML_PARSE_EvalLine
///_ML_PARSE_EvalLine(parser, rpn, resultObject)
/// @argType    r,r,r
/// @returnType auto
/// @hidden     true
var parser = argument0;
var rpn = argument1;
var res_obj = argument2;
var args = ds_stack_create();
var expression_terminator = false;
var tok;
while (!ds_list_empty(rpn) && expression_terminator == false && ML_NoException(parser)) {
    tok = ds_list_find_value(rpn, 0);
    ds_list_delete(rpn, 0);
    _ML_PARSE_EvalToken(parser, args, tok);

}
if (ML_NoException(parser)) {
    if (ds_stack_size(args) > 1) {
        ML_RaiseException(ML_EXCEPT_VALUE,-1,
            "missing operator or function in expression");
    }
}

var lhs, lhs_val;
if (!ds_stack_empty(args)) {
    lhs = ds_stack_pop(args);
    lhs_val = _ML_LiRO_AddToken(parser, res_obj, lhs);
}
ds_stack_destroy(args);
return lhs_val;


#define _ML_PARSE_EvalToken
///_ML_PARSE_EvalToken(parser, argTypeStack, token)
/// @argType    r,r,r
/// @returnType real
/// @hidden     true
var parser = argument0;
var args = argument1;
var tok = argument2;


switch (_ML_LiTok_GetType(tok)) {
case ML_TT_UNARY:
    _ML_PARSE_Unary(parser, tok, args);
break;
case ML_TT_BINARY:
    _ML_PARSE_Binary(parser, tok, args);
break;
case ML_TT_ASSIGN:
    _ML_PARSE_Assign(parser, tok, args);
break;
case ML_TT_TERNARY:
    _ML_PARSE_Ternary(parser, tok, args);
break;
case ML_TT_FUNCTION:
    _ML_PARSE_Function(parser, tok, args);
break;
case ML_TT_VALUE:
case ML_TT_VARIABLE:
    _ML_PARSE_Value(tok, args);
break;
case ML_TT_EXPRTERMINATOR:
    return true;
break;
}
return false;


#define _ML_PARSE_FuncFlat
///_ML_PARSE_FuncFlat(parser, token, args, temptokens)
/// @argType    r,r,r,r
/// @returnType void
/// @hidden     true
var a, lhs, lhs_val, ret;

var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;
var temptokens = argument3;

var func = _ML_LiTok_GetOperator(token);
var func_script = _ML_LiS_GetScript(func);
var argc = _ML_LiTok_GetArgcount(token);
for (var i = argc -1; i >= 0; --i) {
    lhs = ds_stack_pop(argstack);
    if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
        lhs_val = _ML_LiTok_GetVal(lhs);
    } else {
        var v = _ML_LiTok_GetOperator(lhs);
        lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    }
    a[i] = lhs_val;
}


switch (argc) {
case 15:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
break;
case 14:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
break;
case 13:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
break;
case 12:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
break;
case 11:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
break;
case 10:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
break;
case 9:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
break;
case 8:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
break;
case 7:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
break;
case 6:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4], a[5]);
break;
case 5:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3], a[4]);
break;
case 4:
    ret = script_execute(func_script, a[0], a[1], a[2], a[3]);
break;
case 3:
    ret = script_execute(func_script, a[0], a[1], a[2]);
break;
case 2:
    ret = script_execute(func_script, a[0], a[1]);
break;
case 1:
    ret = script_execute(func_script, a[0]);
break
case 0:
    ret = script_execute(func_script);
break;
}
//change the "function" by the "value"

var temptok = _ML_LiTok_Create(ret, _ML_LiTok_GetPos(token));
_ML_LiTok_SetType(temptok, ML_TT_VALUE);
_ML_LiTok_SetOperator(temptok, _ML_LiS_GetRettype(func));

ds_stack_push(argstack, temptok);
ds_list_add(temptokens, temptok);


#define _ML_PARSE_Function
///_ML_PARSE_Function(parser, token, args)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true
var a, argc , f, i, lhs, lhs_val, ret, t;

var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;

f = _ML_LiTok_GetOperator(token);
argc = _ML_LiTok_GetArgcount(token);
var argstring, exact_func;
argstring = "";
for (i = argc -1; i >= 0; --i) {
    lhs = ds_stack_pop(argstack);
    if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
        if (_ML_LiTok_GetOperator(lhs) == ML_VAL_REAL) {
            t = ML_VAL_REAL;
            lhs_val = _ML_LiTok_GetVal(lhs);
        } else {
            t = ML_VAL_STRING;
            lhs_val = _ML_LiTok_GetVal(lhs);
        }
    } else {
        var v;
        v = _ML_LiTok_GetOperator(lhs);
        lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
        t = _ML_LiVar_GetType(v);
    }
    argstring = t + "$" + argstring;
    a[i] = lhs_val;
}
argstring = string_copy(argstring,1,string_length(argstring) - 1);
exact_func = _ML_LiF_GetFunc(f, argstring)
if (exact_func < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    _ML_LiTok_SetString(argument0, 0);
    _ML_LiTok_SetType(argument0, ML_TT_VALUE);
    _ML_LiTok_SetOperator(argument0, ML_VAL_REAL);
    ds_stack_push(argstack,argument0);
    return 0;
} 

switch (argc) {
case 15:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
break;
case 14:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
break;
case 13:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
break;
case 12:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
break;
case 11:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
break;
case 10:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
break;
case 9:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
break;
case 8:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
break;
case 7:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
break;
case 6:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4], a[5]);
break;
case 5:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3], a[4]);
break;
case 4:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2], a[3]);
break;
case 3:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1], a[2]);
break;
case 2:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0], a[1]);
break;
case 1:
    ret = script_execute(_ML_LiS_GetScript(exact_func), a[0]);
break
case 0:
    ret = script_execute(_ML_LiS_GetScript(exact_func));
break;
}
//change the "function" by the "value"
_ML_LiTok_SetString(token, ret);
_ML_LiTok_SetType(token, ML_TT_VALUE);
_ML_LiTok_SetOperator(token, _ML_LiS_GetRettype(exact_func));
ds_stack_push(argstack,token);


#define _ML_PARSE_GetFullFunction
//if (ds_map_exists(argument0.ActualFunctions, argument1) ) {
//    return ds_map_find_value(argument0.ActualFunctions, argument1);
//} else {
//    return -1;
//}


#define _ML_PARSE_RemToken
/*ds_list_delete(tokenstring,argument0);
ds_list_delete(tokenlevel,argument0);
ds_list_delete(tokentype,argument0);
ds_list_delete(tokenpos,argument0);


#define _ML_PARSE_Ternary
/// _ML_PARSE_Ternary(parser, tok, argstack)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true
var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;

var op, lhs, rhs, lhs_val, rhs_val, ret, mhs, mhs_val, rhs_type, lhs_type, mhs_type, v;

op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 3) {
    ML_RaiseException_CurParser(ML_EXCEPT_TERNARY,_ML_LiTok_GetPos(token),
            "missing value for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
rhs = ds_stack_pop(argstack);
if (_ML_LiTok_GetType(rhs) == ML_TT_VALUE) {
    rhs_val = _ML_LiTok_GetVal(rhs);
    rhs_type = _ML_LiTok_GetOperator(rhs);
} else {
    v = _ML_LiTok_GetOperator(rhs);
    rhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    rhs_type = _ML_LiVar_GetType(v);
}

mhs = ds_stack_pop(argstack);
if (_ML_LiTok_GetType(mhs) == ML_TT_VALUE) {
    mhs_val = _ML_LiTok_GetVal(mhs);
    mhs_type = _ML_LiTok_GetOperator(mhs);
} else {
    v = _ML_LiTok_GetOperator(mhs);
    mhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    mhs_type = _ML_LiVar_GetType(v);
}


lhs = ds_stack_top(argstack);
if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
    lhs_val = _ML_LiTok_GetVal(lhs);
    lhs_type = _ML_LiTok_GetOperator(lhs);
} else {
    v = _ML_LiTok_GetOperator(lhs);
    lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    lhs_type = _ML_LiVar_GetType(v);
}

var exact_operator, argstring;

argstring = lhs_type + "$" + mhs_type + "$" + rhs_type;

exact_operator = _ML_LiF_GetFunc(op, argstring)
if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 
ret = script_execute(_ML_LiS_GetScript(exact_operator),lhs_val,mhs_val,rhs_val);
//create "temp" token with lhs_val:
_ML_LiTok_SetString(lhs, ret);
_ML_LiTok_SetType(lhs, ML_TT_VALUE);
_ML_LiTok_SetOperator(lhs, _ML_LiS_GetRettype(exact_operator));


#define _ML_PARSE_Unary
///_ML_PARSE_Unary(parser, token, argstack)
/// @argType    r,r,r
/// @returnType void
/// @hidden     true
var op, lhs, lhs_val, ret, lhs_type;

var VARMAP = _ML_LiP_GetVarMap(argument0);
var token = argument1;
var argstack = argument2;

op = _ML_LiTok_GetOperator(token);
if (ds_stack_size(argstack) < 1) {
    ML_RaiseException_CurParser(ML_EXCEPT_UNOPERATOR,_ML_LiTok_GetPos(token),
            "missing value for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;   
}
lhs = ds_stack_top(argstack);
if (_ML_LiTok_GetType(lhs) == ML_TT_VALUE) {
    lhs_val = _ML_LiTok_GetVal(lhs);
    lhs_type = _ML_LiTok_GetOperator(lhs);
} else {
    var v = _ML_LiTok_GetOperator(lhs);
    lhs_val = ds_map_find_value(VARMAP, _ML_Li_GetName(v));
    lhs_type = _ML_LiVar_GetType(v);
}

var exact_operator, argstring;

argstring = lhs_type;

exact_operator = _ML_LiF_GetFunc(op, argstring)

if (exact_operator < 0) {
    ML_RaiseException_CurParser(ML_EXCEPT_ARGTYPE,_ML_LiTok_GetPos(token),
        "Invalid argument type for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
    return 0;
} 

ret = script_execute(_ML_LiS_GetScript(exact_operator),lhs_val);

//create "temp" token with lhs_val:
_ML_LiTok_SetString(lhs, ret);
_ML_LiTok_SetType(lhs, ML_TT_VALUE);
_ML_LiTok_SetOperator(lhs, _ML_LiS_GetRettype(exact_operator));


#define _ML_PARSE_Value
///_ML_PARSE_Value(token, argstack)
/// @argType    r,r
/// @returnType auto
/// @hidden     true
ds_stack_push(argument1, argument0);


#define _ML_ShuntingYard
///_ML_ShuntingYard(parser, tokens, rpn)
/// @argType    r,r,r
/// @returnType real
/// @hidden     true

var input, curoutput, curstack, token, endtok, o1, o2, t, allstack, alloutput;
var curlevel, allargnum, curargnum, curparenthesis, allparenthesis;

var parser = argument0;
input = argument1;

allstack = ds_stack_create();
alloutput = ds_stack_create();
allargnum = ds_stack_create();
allparenthesis = ds_stack_create();

curstack = ds_stack_create();
curoutput = argument2;
curparenthesis = 1;
curargnum = 1;
curlevel = 0;



var s = ds_list_size(input);
var i = 0;
endtok = false;

while (i < s && !endtok) { //while there are tokens to be read
    token = ds_list_find_value(input, i);

    switch (_ML_LiTok_GetType(token)) {
    case ML_TT_VALUE:
    case ML_TT_VARIABLE:
        if (curargnum == 0) curargnum = 1;
        _ML_SY_HandleValue(token, curoutput);
    break;
    case ML_TT_LEFTP:
        _ML_SY_HandleLeftPar(token, curstack);
        ++curparenthesis;
    break;
    case ML_TT_FUNCTION:
        if (curargnum == 0) curargnum = 1;
        ds_stack_push(allstack, curstack);
        ds_stack_push(alloutput, curoutput);
        ds_stack_push(allargnum, curargnum);
        ds_stack_push(allparenthesis, curparenthesis);
        _ML_SY_HandleFunction(token, curstack);
        ++curlevel;
        curstack = ds_stack_create();
        curoutput = ds_list_create();
        curargnum = 0;
        curparenthesis = -1;
    break;
    case ML_TT_ASSIGN:
    case ML_TT_BINARY:
    case ML_TT_UNARY:
    case ML_TT_TERNARY1:
        _ML_SY_HandleOperator(parser, token, curoutput, curstack);
    break;
    case ML_TT_TERNARY2:
        _ML_SY_HandleTernary2(parser, token, curoutput, curstack);
    break;
    case ML_TT_ARGSEP:
        _ML_SY_HandleArgSep(parser, token, curoutput, curstack);
        ++curargnum;
    break;
    case ML_TT_COMMA: //special case - need to recheck comma's to check against function seperation
        if (curparenthesis == 0) {
            _ML_LiTok_SetType(token, ML_TT_ARGSEP); 
        } else {
            var prevtok,v;
            prevtok = -1;
            v = ML_TT_UNKNOWN;
            if (i > 0) {
                prevtok = ds_list_find_value(input, i - 1);
                if (_ML_LEX_IsBinoper(parser, token, prevtok)) {
                    v = ML_TT_BINARY;    
                } else if (_ML_LEX_IsAssignoper(parser, token, prevtok)) {
                    v = ML_TT_ASSIGN;
                } else if (_ML_LEX_IsTernOper(parser, token, prevtok)) {
                    v = ML_TT_TERNARY1;
                } else if (_ML_LEX_IsTernOper2(parser, token, prevtok)) {
                    v = ML_TT_TERNARY2
                }
            }
            if (v == ML_TT_UNKNOWN) {
                if _ML_LEX_IsFunction(parser, token, prevtok) {
                    v = ML_TT_FUNCTION;
                } else if (_ML_LEX_IsUnoper(parser, token, prevtok)) {
                    v = ML_TT_UNARY;
                } else if _ML_LEX_IsVariable(parser, token, prevtok) {
                    v = ML_TT_VARIABLE;
                } else if _ML_LEX_IsValue(token, prevtok){
                    v = ML_TT_VALUE;
                } else {
                    v = ML_TT_UNKNOWN;
                }
            }
            _ML_LEX_TokenSetType(parser, token, v);
        }
        --i;
    break;
    case ML_TT_RIGHTP:
        if (_ML_SY_HandleRightPar(parser, token, curoutput, curstack, curargnum, alloutput, allstack, curlevel)) {
            ds_stack_destroy(curstack);
            ds_list_destroy(curoutput);
            curoutput = ds_stack_pop(alloutput);
            curstack = ds_stack_pop(allstack);
            curargnum = ds_stack_pop(allargnum);
            curparenthesis = ds_stack_pop(allparenthesis);
            --curlevel;
        } else {
            --curparenthesis;
        }
    break;
    case ML_TT_EOL:
        if (curlevel != 0) {
            ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(token), 
                "unexpected end of line, mismatching parenthesis at " + string(_ML_LiTok_GetPos(token)));
        }
        _ML_SY_HandleEOL(parser, token, curoutput, curstack);
        endtok = true;
    break;
    case ML_TT_EXPRTERMINATOR:
        if (curlevel != 0) {
            ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(token), 
                "unexpected end of expression, mismatching parenthesis at " + string(_ML_LiTok_GetPos(token)));
        }
        _ML_SY_HandleExprTerminator(parser, token, curoutput, curstack);
    break;
    
    default:
        ML_RaiseException(parser, ML_EXCEPT_TOKENTYPE, _ML_LiTok_GetPos(token), 
            "unknown tokentype for token '" + string(_ML_LiTok_GetVal(token)) + "' at " + string(_ML_LiTok_GetPos(token)));
    break;
    
    }
    ++i;
}
var tstack, toutput;
repeat (ds_stack_size(allstack)) {
    ds_stack_destroy(ds_stack_pop(allstack));
}
ds_stack_destroy(allstack);
repeat (ds_stack_size(alloutput)) {
    ds_list_destroy(ds_stack_pop(alloutput));
}
ds_stack_destroy(alloutput);
ds_stack_destroy(allargnum);
ds_stack_destroy(allparenthesis);

ds_stack_destroy(curstack);



if !(endtok) {
    ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(token),
        "Line ended before EOL'" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)));
}
return curoutput;


#define _ML_SY_HandleArgSep
///_ML_SY_HandleArgSep(parser, token, output, stack);
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true
var token, output, stack, parser;
parser = argument0;
token = argument1;
output = argument2;
stack = argument3;

while (!ds_stack_empty(stack)) {
    if (_ML_LiTok_GetType(ds_stack_top(stack)) == ML_TT_LEFTP ) break;
    //ds_queue_enqueue(output, ds_stack_pop(stack));
    ds_list_add(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS,_ML_LiTok_GetPos(token),
        "Mismatched parenthesis for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)))
}
return true;


#define _ML_SY_HandleEOL
///_ML_SY_HandleEOL(parser, token, output, stack);
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true

var token, output, stack, parser;
parser = argument0;
token = argument1;
output = argument2;
stack = argument3;
while (!ds_stack_empty(stack)) {
    var t = ds_stack_pop(stack);
    //untill stack is empty
    if (_ML_LiTok_GetType(t) == ML_TT_ARGSEP || _ML_LiTok_GetType(t) == ML_TT_LEFTP ) {
        ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS,_ML_LiTok_GetPos(t),
            "Mismatched parenthesis for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(t)));
    } else {
        //ds_queue_enqueue(output, t);
        ds_list_add(output, t);
    }
    //add top operator to output
}
//ds_queue_enqueue(output,token);
ds_list_add(output, token);
return false;


#define _ML_SY_HandleExprTerminator
///_ML_SY_HandleExprTerminator(parser, token, output, stack)
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true
var token, output, stack, parser;
parser = argument0;
token = argument1;
output = argument2;
stack = argument3;
while (!ds_stack_empty(stack)) {
    var t = ds_stack_pop(stack);
    //untill stack is empty
    if (_ML_LiTok_GetType(t) == ML_TT_ARGSEP || _ML_LiTok_GetType(t) == ML_TT_LEFTP) {
        ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS, _ML_LiTok_GetPos(t),
            "Mismatched parenthesis for '" + string(_ML_LiTok_GetVal(t)) +"' at " +string(_ML_LiTok_GetPos(t)));
    } else {
        //ds_queue_enqueue(output, t);
        ds_list_add(output, t);
    }
    //add top operator to output
}
//ds_queue_enqueue(output,token);
ds_list_add(output, token);
return false;


#define _ML_SY_HandleFunction
///_ML_SY_HandleFunction(token, functionstack)
/// @argType    r,r
/// @returnType real
/// @hidden     true
ds_stack_push(argument1, argument0);
return false;


#define _ML_SY_HandleLeftPar
///_ML_SY_HandleLeftPar(token, functionstack)
/// @argType    r,r
/// @returnType real
/// @hidden     true
ds_stack_push(argument1, argument0);
return true;


#define _ML_SY_HandleOperator
///_ML_SY_HandleOperator(parser, token, output, stack)
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true
var token, output, stack, o1, o2, t, parser;
parser = argument0;
token = argument1;
output = argument2;
stack = argument3;
o1 = _ML_LiTok_GetOperator(token);
while (!ds_stack_empty(stack)) {
    t = ds_stack_top(stack);
    if !(_ML_SY_TokenIsOperator(t)) break;
    o2 = _ML_LiTok_GetOperator(t);
    if (_ML_SY_OperatorActBefore(o1, o2)) break;
    if (_ML_LiTok_GetType(t) == ML_TT_TERNARY1) {
        ML_RaiseException(parser, ML_EXCEPT_TERNARY,_ML_LiTok_GetPos(token),
            "syntax error. Token '"+ string(_ML_LiTok_GetVal(token)) +"' at "+ _ML_LiTok_GetPos(token) + " can't exist inside ternary operator");
        break;
    }
    //ds_queue_enqueue(output, ds_stack_pop(stack));
    ds_list_add(output, ds_stack_pop(stack));
}
ds_stack_push(stack, token);
return false;


#define _ML_SY_HandleRightPar
///_ML_SY_HandleRightPar(parser, token, output, stack, argcount, stackofoutputs, stackofstacks,  level);
/// @argType    r,r,r,r,r,r,r,r
/// @returnType real
/// @hidden     true
var token, output, stack, level, alloutput, allstack, newstack, newoutput, argc, parser;
parser = argument0;
token = argument1;
output = argument2;
stack = argument3;
argc = argument4;
level = argument7;
alloutput = argument5;
allstack = argument6;

while (!ds_stack_empty(stack)) {
    if (_ML_LiTok_GetType(ds_stack_top(stack)) == ML_TT_LEFTP)  break;
    //ds_queue_enqueue(output, ds_stack_pop(stack));
    ds_list_add(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    ML_RaiseException(parser, ML_EXCEPT_PARENTHESIS,_ML_LiTok_GetPos(token),
        "Mismatched parenthesis for '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)))
} else {
    var t = ds_stack_pop(stack); //remove left parenthesis
    
    if (level > 0 && ds_stack_empty(stack)) {
        //flatten the outputs
        newoutput = ds_stack_top(alloutput);
        newstack = ds_stack_top(allstack);
        //_ML_SY_QueueAppendQueue(newoutput, output); //append output queues
        _ML_SY_ListAppendList(newoutput, output);
        var f = ds_stack_pop(newstack);
        _ML_LiTok_SetArgcount(f, argc);
        //ds_queue_enqueue(newoutput, f);
        ds_list_add(newoutput, f);
        return true;
    }
}
return false;


#define _ML_SY_HandleTernary2
///_ML_SY_HandleTernary2(parser, token, output, stack);
/// @argType    r,r,r,r
/// @returnType real
/// @hidden     true
var token, output, stack, mylist, t, o1, o2, parser;
parser = argument0;
token = argument1;
output = argument2;
stack = argument3;
var P_TERNOPER2 = _ML_LiP_GetTernOps2Table(parser);
mylist = ds_map_find_value(P_TERNOPER2, string(_ML_LiTok_GetVal(token)));
while (!ds_stack_empty(stack)) {
    t = ds_stack_top(stack);
    if (_ML_SY_TernaryIsMatchingToken(t, mylist))  break;
    //ds_queue_enqueue(output, ds_stack_pop(stack));
    ds_list_add(output, ds_stack_pop(stack));
}
if (ds_stack_empty(stack)) {
    ML_RaiseException(parser, ML_EXCEPT_TERNARY,_ML_LiTok_GetPos(token),
        "Mismatched ternary operator, 2nd part before matching 1st, '" + string(_ML_LiTok_GetVal(token)) +"' at " +string(_ML_LiTok_GetPos(token)))
} else {
    t = ds_stack_top(stack);
    _ML_LiTok_SetString(t, string(_ML_LiTok_GetVal(t)) + string(_ML_LiTok_GetVal(token)));
    _ML_LiTok_SetType(t, ML_TT_TERNARY);
}
return true;


#define _ML_SY_HandleValue
///_ML_SY_HandleValue(token, exprqueue)
/// @argType    r,r
/// @returnType real
/// @hidden     true
//ds_queue_enqueue(argument1, argument0);
ds_list_add(argument1, argument0);
return false;


#define _ML_SY_ListAppendList
///_ML_SY_ListAppendList(q1, q2);
/// @argType    r,r
/// @returnType void
/// @hidden     true
//appends q2 to q1

var q1, q2;
q1 = argument0;
q2 = argument1;
var ind = 0;
repeat (ds_list_size(q2)) {
    ds_list_add(q1, ds_list_find_value(q2, ind++));
}


#define _ML_SY_OperatorActBefore
///_ML_SY_OperatorActBefore(o1, o2)
/// @argType    r,r
/// @returnType real
/// @hidden     true
var o1p, o2p, o1a;
o1p = _ML_LiOp_GetPrec(argument0);
o2p = _ML_LiOp_GetPrec(argument1);
o1a = _ML_LiOp_GetAssoc(argument0);
return !(o1p < o2p || (o1a == ML_O_LEFTASSOC && o1p == o2p));


#define _ML_SY_QueueAppendQueue
///_ML_SY_QueueAppendQueue(q1, q2);
/// @argType    r,r
/// @returnType void
/// @hidden     true
//appends q2 to q1

var q1, q2;
q1 = argument0;
q2 = argument1;

repeat (ds_queue_size(q2)) {
    ds_queue_enqueue(q1, ds_queue_dequeue(q2));
}


#define _ML_SY_TernaryIsMatchingToken
/// _ML_SY_TernaryIsMatchingToken(token1, map)
/// @argType    r,r
/// @returnType real
/// @hidden     true
//tests if token is in map
var t1, o1, entry;
t1 = argument0;
entry = argument1;
if (_ML_LiTok_GetType(t1) != ML_TT_TERNARY1) return false;
o1 = _ML_LiTok_GetOperator(t1);
return (ds_list_find_index(entry, o1) >= 0);



#define _ML_SY_TokenIsOperator
///_ML_SY_TokenIsOperator(tok)
/// @argType    r
/// @returnType r
/// @hidden     true
var t = _ML_LiTok_GetType(argument0);

return (t == ML_TT_TERNARY1 || t == ML_TT_TERNARY2 ||
        t == ML_TT_TERNARY || t == ML_TT_BINARY || 
        t == ML_TT_UNARY || t == ML_TT_ASSIGN );


#define _ML_TernaryAddSecond
/// _ML_TernaryAddSecond(parser, oper_2_string, ternary_id)
/// @argType    r,s,r
/// @returnType r
/// @hidden     true
var P_TERNOPER2 = _ML_LiP_GetTernOps2Table(argument0);
var entry;
if (ds_map_exists(P_TERNOPER2,argument1)) {
    entry = ds_map_find_value(P_TERNOPER2, argument1);
} else {
    entry = ds_list_create();
    ds_map_add(P_TERNOPER2, argument1, entry);
}
ds_list_add(entry, argument2);


#define _ML_TokCleanUp
///_ML_TokCleanUp(tokenlist)
/// @argType    r
/// @returnType double
/// @hidden     true

var tokenlist = argument0;


var i, s;
s = ds_list_size(tokenlist) 
for (i = 0; i < s; ++i) {
    _ML_LiTok_Destroy(ds_list_find_value(tokenlist,i));
}



