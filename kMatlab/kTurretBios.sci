function [r] = kTurretBios(ref,turretID)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KTURRETBIOS   return bios version of turret
// 
//kTurretBios(ref,turretID)
//  
//  Use the communication parameters specified with kcmd.

// Written by Skye Legon, 02/99

reply = kTurret(ref,turretID,"B");
// !! L.11: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(reply,"b,%d,%d");
if isempty(errmsg) then
  // !! L.13: Matlab function sprintf not yet converted, original calling sequence used
  disp(sprintf("Turret BIOS version %d.%d",mtlb_e(value,1),mtlb_e(value,2)));
  r = value;
else
  r = -1;
end;
endfunction
