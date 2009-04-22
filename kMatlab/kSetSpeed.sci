function [r] = kSetSpeed(ref,left,right)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSETSPEED   send a speed command to Khepera
// 
//kSetSpeed(ref,left,right)
//  
//  Use the communication parameters specified with kcmd.

// Written by Yves Piguet, 08/98

// !! L.10: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("D,%d,%d",round(mtlb_double(left)),round(mtlb_double(right))));
if mtlb_logic(mtlb_double(value),"==",asciimat("d")) then
  r = 0;
else
  r = -1;
end;
endfunction
