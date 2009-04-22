function [r] = kProximity(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KPROXIMITY   Get the value of the proximity sensors of Khepera
// 
//value = kProximity(ref)
//  Return a vector of 8 values corresponding to the 8
//  proximity sensors of Khepera.
//  Use the reference obtained with kopen.

// Written by Skye Legon, 2/99

retries = 3;
retry = 1;
errmsg = "none yet";
while asciimat(errmsg)&bool2s(retry<=retries)
  reply = kcmd(ref,"N");
  // !! L.16: Matlab function sscanf not yet converted, original calling sequence used
  [r,count,errmsg] = sscanf(reply,"n,%d,%d,%d,%d,%d,%d,%d,%d");
  if errmsg then
    disp("Error reading sensors.  Retrying...")
    retry = retry+1;
  end;
end;
if errmsg then
  disp("Sensors failed.")
  r = -1;
end;
endfunction
