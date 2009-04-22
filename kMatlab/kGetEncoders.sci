function [r] = kGetEncoders(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KGETENCODERS   Get the encoder values of Khepera
// 
//value = kGetEncoders(ref)
//  Return a vector of 2 values corresponding to the position of
//  the wheels of Khepera.
//  Use the reference obtained with kopen.

retries = 3;
retry = 1;
errmsg = "none yet";
while asciimat(errmsg)&bool2s(retry<=retries)
  reply = kcmd(ref,"H");
  // !! L.14: Matlab function sscanf not yet converted, original calling sequence used
  [r,count,errmsg] = sscanf(reply,"h,%d,%d");
  if errmsg then
    disp("Error reading encoders.  Retrying...")
    retry = retry+1;
  end;
end;
if errmsg then
  disp("Encoders failed.")
  r = -1;
end;
endfunction
