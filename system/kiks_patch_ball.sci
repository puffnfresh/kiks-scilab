function [ptch] = kiks_patch_ball(id)

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

global("KIKS_COLOR_BACKGROUND","KIKS_COLOR_BALL");
//col=([KIKS_COLOR_BALL KIKS_COLOR_BALL KIKS_COLOR_BALL]/255)+KIKS_COLOR_BACKGROUND;
col = [0.1,0.8,0.5];
// !! L.10: Matlab function sprintf not yet converted, original calling sequence used
// !! L.10: Matlab function patch not yet converted, original calling sequence used
ptch = patch("Selected","off","Facecolor",col,"Edgecolor",[0,0,0],"Erase","xor","tag",sprintf("@ballobj %d",id));
endfunction
