function [k2path] = kiks_getsystempath()

// Ouput variables initialisation (not found in input variables)
k2path=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// !! L.2: Matlab function which not yet converted, original calling sequence used
//kpath = which("kiks");
//i = max(size(mtlb_double(kpath)));
//while bool2s(mtlb_logic(mtlb_double(mtlb_e(kpath,i)),"~=",asciimat("\")))&bool2s(mtlb_logic(mtlb_double(mtlb_e(kpath,i)),"~=",asciimat("/"))) i = i-1;end;
//k2path = "";
//for j = 1:i
//  k2path = k2path+mtlb_e(kpath,j);
//end;
k2path = getcwd() + filesep() + 'system' + filesep();
endfunction
