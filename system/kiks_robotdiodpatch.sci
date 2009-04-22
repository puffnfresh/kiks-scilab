function [ptch] = kiks_robotdiodpatch(id,col)

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

// !! L.7: Matlab function sprintf not yet converted, original calling sequence used
// !! L.7: Matlab function patch not yet converted, original calling sequence used
ptch = patch("Facecolor",col,"EdgeColor","none","Erase","xor","tag",sprintf("%ddiod",id));
endfunction
