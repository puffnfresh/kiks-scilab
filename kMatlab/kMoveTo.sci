function [r] = kMoveTo(ref,left,right)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KMOVETO   Send target position command to Khepera
// 
//kMoveTo(ref,left,right)
//  Specify the target position for the left wheel and right
//  wheel in pulses (1 pulse = 1/12 mm).
//  Use the reference obtained with kopen.

// Written by Yves Piguet, 8/98.

// !! L.11: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("C,%d,%d",round(mtlb_double(left)),round(mtlb_double(right))));
if mtlb_logic(mtlb_double(value),"==",asciimat("c")) then
  r = 0;
else
  r = -1;
end;
endfunction
