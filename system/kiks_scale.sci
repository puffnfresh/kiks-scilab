function [ret] = kiks_scale(a,rsz,csz)

// Ouput variables initialisation (not found in input variables)
ret=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
// downsample a matrix

[rows,cols] = size(mtlb_double(a));

if mtlb_logic([rows,cols],"==",mtlb_double([rsz,csz])) then
  ret = a;
  return;
end;

rscale = rows/mtlb_double(rsz);
cscale = cols/mtlb_double(csz);

rix = round(mtlb_imp(1,rscale,rows));
cix = round(mtlb_imp(1,cscale,cols));
ret = a(rix,cix);
endfunction
