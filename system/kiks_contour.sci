function [res] = kiks_contour(m)

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------


// !! L.8: Matlab toolbox(es) function bwmorph not converted, original calling sequence used
res = bwmorph(m,"remove");
//b=filter2([0 1/4 0; 1/4 -1 1/4; 0 1/4 0],m);
//res=(b<0);

//inpolygon
endfunction
