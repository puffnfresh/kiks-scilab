function [res] = kSetArm(ref,value) 

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// !! L.3: Matlab function sprintf not yet converted, original calling sequence used
res = kTurret(ref,1,sprintf("E,%d",value));
endfunction
