function [value] = kLinLight(ref)

// Ouput variables initialisation (not found in input variables)
value=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

reply = kTurret(ref,2,"L");
// !! L.3: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(mtlb_e(reply,3:$),"%d,%d");// cmd==''L''
endfunction