function [r] = kGetStatus(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KGETSTATUS   Get the status of the motion controller
// 
//value = kGetStatus(ref)
//  Return a vector of 6 values corresponding to the motion controller
//  status.
//  Use the reference obtained with kopen.

reply = kcmd(ref,"K");
// !! L.10: Matlab function sscanf not yet converted, original calling sequence used
r = sscanf(reply,"k,%d,%d,%d,%d,%d,%d");
endfunction
