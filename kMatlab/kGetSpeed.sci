function [r] = kGetSpeed(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KGETSPEED   Get the instantaneous speed of Khepera
// 
//value = kGetSpeed(ref)
//  Return a vector of 2 values corresponding to the speed of
//  the wheels of Khepera.
//  Use the reference obtained with kopen.

reply = kcmd(ref,"E");
// !! L.10: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(reply,"e,%d,%d");
if isempty(errmsg) then
  r = value;
else
  r = -1;
end;
endfunction
