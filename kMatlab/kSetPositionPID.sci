function [r] = kSetPositionPID(ref,Kp,Ki,Kd)

// Ouput variables initialisation (not found in input variables)
r=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSETPOSITIONPID   Configuration position PID controller
// 
//kSetPositionPID(ref,Kp,Ki,Kd)
//  Set the proportional, integral, and derivative gain
//  of the position controller of Khepera.
//  Use the reference obtained with kopen.

if %nargin<4 then
  Kp = 3000;
  Ki = 20;
  Kd = 4000;
  disp("Set default PID controller: Kp=3000, Ki=20, Kd=4000")
end;

// !! L.16: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("F,%d,%d,%d",round(mtlb_double(Kp)),round(mtlb_double(Ki)),round(mtlb_double(Kd))));
if mtlb_logic(mtlb_double(value),"==",asciimat("f")) then
  r = 0;
else
  r = -1;
end;
endfunction
