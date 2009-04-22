function [res] = kiks_checkpoint()

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_ROBOT_MATRIX","KIKS_OBJECT_BALL","KIKS_OBJECT_SMALLBALL","KIKS_BALLDATA","KIKS_RBTARRAY","KIKS_BALLARRAY","KIKS_ROUNDOBJARRAY","KIKS_LIGHTARRAY","KIKS_LIGHTDATA");
global("KIKS_CHK_ROBOT_MATRIX","KIKS_CHK_OBJECT_BALL","KIKS_CHK_OBJECT_SMALLBALL","KIKS_CHK_BALLDATA","KIKS_CHK_KHEPARRAY","KIKS_CHK_BALLARRAY","KIKS_CHK_ROUNDOBJARRAY","KIKS_CHK_LIGHTARRAY","KIKS_CHK_LIGHTDATA");
global("KIKS_CHECKPOINT");

%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;KIKS_CHECKPOINT = %v0(1:6);
KIKS_CHK_ROBOT_MATRIX = KIKS_ROBOT_MATRIX;
KIKS_CHK_OBJECT_BALL = KIKS_OBJECT_BALL;
KIKS_CHK_OBJECT_SMALLBAL = KIKS_OBJECT_SMALLBALL;
KIKS_CHK_BALLDATA = KIKS_BALLDATA;
KIKS_CHK_KHEPARRAY = KIKS_RBTARRAY;
KIKS_CHK_BALLARRAY = KIKS_BALLARRAY;
KIKS_CHK_ROUNDOBJARRAY = KIKS_CHK_ROUNDOBJARRAY;
KIKS_CHK_LIGHTARRAY = KIKS_LIGHTARRAY;
KIKS_CHK_LIGHTDATA = KIKS_LIGHTDATA;
endfunction
