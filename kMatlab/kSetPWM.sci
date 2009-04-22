function [r] = kSetPWM(ref,left,right)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSETPWM   Set motor PWM directly
// 
//kSetPWM(ref,left,right)
//  Set PWM between -255 and 255
//  Use the communication parameters specified with kcmd.

// Written by Skye Legon 2/99.

// !! L.10: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("P,%d,%d",round(mtlb_double(left)),round(mtlb_double(right))));
if mtlb_logic(mtlb_double(value),"==",asciimat("p")) then
  r = 0;
else
  r = -1;
end;
endfunction
