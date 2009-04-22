function [k2path] = kiks_getsiminfopath()

// Ouput variables initialisation (not found in input variables)
k2path=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

// !! L.7: Matlab function which not yet converted, original calling sequence used
kpath = which("kiks_siminfo_dist_fwd");
i = max(size(mtlb_double(kpath)));
while bool2s(mtlb_logic(mtlb_double(mtlb_e(kpath,i)),"~=",asciimat("\")))&bool2s(mtlb_logic(mtlb_double(mtlb_e(kpath,i)),"~=",asciimat("/"))) i = i-1;end;
k2path = "";
for j = 1:i
  k2path = k2path+mtlb_e(kpath,j);
end;
endfunction
