function [res2] = kiks_compressmatrix(A)

// Ouput variables initialisation (not found in input variables)
res2=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------


A = mtlb_t(A);
[i,j,s] = mtlb_find(mtlb_double(A));
[m,n] = size(mtlb_double(A));
// !! L.11: Scilab uint16() does not work with Complex values: uint16() call IGNORED !
// ! L.11: mtlb_double([m,n,i',j',mtlb_t(s)]) may be replaced by:
// !    --> uint16(mtlb_double([m,n,i',j',mtlb_t(s)])) if mtlb_double([m,n,i',j',mtlb_t(s)]) is real
res2 = mtlb_double([m,n,i',j',mtlb_t(s)]);
endfunction
