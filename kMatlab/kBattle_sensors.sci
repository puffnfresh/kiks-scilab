function [value] = kBattle_sensors(ref) 

// Ouput variables initialisation (not found in input variables)
value=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

reply = kTurret(ref,99,"S");
// !! L.4: Matlab function sscanf not yet converted, original calling sequence used
value = sscanf(mtlb_e(reply,3:$),"%d,%d,%d,%d,%d,%d,%d");
endfunction
