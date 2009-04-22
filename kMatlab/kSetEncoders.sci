function [r] = kSetEncoders(ref,left,right)

// Ouput variables initialisation (not found in input variables)
r=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSETENCODERS   Set the encoder values of Khepera
// 
//value = kSetEncoders(ref, left, right)
//  Set the encoders to particular values.
//  if no values are specified, they are reset to zero.
//  Use the reference obtained with kopen.

if %nargin<3 then
  left = 0;
  right = 0;
end;

// !! L.14: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("G,%d,%d",round(mtlb_double(left)),round(mtlb_double(right))));
if mtlb_logic(mtlb_double(value),"==",asciimat("g")) then
  r = 0;
else
  r = -1;
end;
endfunction
