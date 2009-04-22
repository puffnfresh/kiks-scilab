function [r] = kSetProfile(ref,vL,aL,vR,aR)

// Ouput variables initialisation (not found in input variables)
r=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSETPROFILE   Set the speed and acceleration profile for
//              the position controller.
// 
//kSetProfile(ref,vL,aL,vR,aR)
//  Set the left and right speed and acceleration
//  of the position controller of Khepera.
//  Use the reference obtained with kopen.

if %nargin<5 then
  vL = 20;
  vR = 20;
  aL = 64;
  aR = 64;
  disp("Resetting to default speed (20) and acceleration (64).");
end;

// !! L.18: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("J,%d,%d,%d,%d",round(mtlb_double(vL)),round(mtlb_double(aL)),round(mtlb_double(vR)),round(mtlb_double(aR))));
if mtlb_logic(mtlb_double(value),"==",asciimat("j")) then
  r = 0;
else
  r = -1;
end;
endfunction
