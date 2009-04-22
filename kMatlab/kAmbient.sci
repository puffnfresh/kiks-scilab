function [r] = kAmbient(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KAMBIENT   Get the value of the ambient light sensors of Khepera
// 
//value = kAmbient(ref)
//  Return a vector of 8 values corresponding to the 8
//  ambient light sensors of Khepera.
//  Use the reference obtained with kopen.

// Written by Yves Piguet, 8/98.

reply = kcmd(ref,"O");
// !! L.12: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(reply,"o,%d,%d,%d,%d,%d,%d,%d,%d");
if isempty(errmsg) then
  r = value;
else
  r = -1;
end;
endfunction
