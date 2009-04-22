function [r] = kTurret(ref,turretID,textString)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KTURRET   Send command (in form of text string) to turret
// 
//kTurret(ref,turretID,textString)
//  
//  The response of the turret is returned as a string.
//  A higher-level routine could thus call kTurret, and then
//  parse the returned string.
//  e.g. see the included kTurretBios command
//  Use the communication parameters specified with kcmd.

// Written by Skye Legon, 02/99

// !! L.14: Matlab function sprintf not yet converted, original calling sequence used
reply = kcmd(ref,[sprintf("T,%d,",turretID),textString]);
// !! L.15: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(reply,"t,%d,%s");
turret_response = mtlb_t(char(mtlb_e(value,2:max(size(mtlb_double(value))))));
if isempty(errmsg) then
  r = turret_response;
else
  r = -1;
end;
endfunction
