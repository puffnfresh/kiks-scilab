function [r] = kStop(ref)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KSTOP   Send stop command to Khepera
// 
//kStop(ref)
//  Specify a zero speed for the left and right wheels.
//  Use the reference obtained with kopen.

// Written by Yves Piguet, 8/98.

kSetSpeed(ref,0,0);
endfunction
