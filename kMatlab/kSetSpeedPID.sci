function [r] = kSetSpeedPID(ref,Kp,Ki,Kd)

// Ouput variables initialisation (not found in input variables)
r=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSETSPEEDPID   Set PID speed controller
// 
//kSetSpeedPID(ref,Kp,Ki,Kd)
//  Set the proportional, integral, and derivative gain
//  of the speed controller of Khepera.
//  Use the reference obtained with kopen.

// Written by Yves Piguet, 8/98.

if %nargin<4 then
  Kp = 3800;
  Ki = 800;
  Kd = 100;
  disp("Set default PID controller: Kp=3800, Ki=800, Kd=100")
end;

// !! L.18: Matlab function sprintf not yet converted, original calling sequence used
value = kcmd(ref,sprintf("A,%d,%d,%d",round(mtlb_double(Kp)),round(mtlb_double(Ki)),round(mtlb_double(Kd))));
if mtlb_logic(mtlb_double(value),"==",asciimat("a")) then
  r = 0;
else
  r = -1;
end;
endfunction
