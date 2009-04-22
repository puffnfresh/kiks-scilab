function [ptch] = kiks_remotekheppatch(id)

// Ouput variables initialisation (not found in input variables)
ptch=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_COLOR_BACKGROUND")
col = [0.05,0.2,0];
// !! L.9: Matlab function sprintf not yet converted, original calling sequence used
// !! L.9: Matlab function patch not yet converted, original calling sequence used
ptch = patch("Facecolor",col,"Edgecolor",[0,0,0],"Erase","xor","tag",sprintf("remoteKhep %d",id));
endfunction
