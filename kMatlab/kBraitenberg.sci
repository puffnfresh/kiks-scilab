function [] = kbrberg(ref,ksp)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KRBRBERG   Basic Braitenberg mode
// 
//kbrberg(ref)
//  Avoid obstacles with the Braitenberg algorithm
//  (ctrl-c to stop).
//  Use the reference obtained with kopen.
// 
//kbrberg(ref,speed)
//  Use a speed factor, < 1 to go slower

// Written by Yves Piguet, 8/98.

if %nargin<2 then
  ksp = 0.7;
end;
gain = [-5,-15,-18,6,4,4,3,5;4,4,6,-18,-15,-5,5,3]/400;
offset = 20*[1;1];

gain = gain*mtlb_double(ksp);
offset = offset*mtlb_double(ksp);

while 1
  sensors = kProximity(ref);  // read the proximity sensors
  speed = gain*mtlb_double(sensors)+offset;  // calculate the speed
  kSetSpeed(ref,speed(2),speed(1));  // write the speed
end;
endfunction
