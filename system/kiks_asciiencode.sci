function [res] = kiks_asciiencode(data)

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


data = double(mtlb_double(data));
res = "";
[tmp,sz] = size(data);

for i = 1:sz
  // !! L.13: Matlab function bitshift not yet converted, original calling sequence used
  // !! L.13: Matlab function strcat not yet converted, original calling sequence used
  // L.13: Name conflict: function name changed from strcat to %strcat
  res = %strcat(res,char(mtlb_a(asciimat("A"),mtlb_double(bitshift(data(i),-4,8)))));
  // !! L.14: Matlab function bitshift not yet converted, original calling sequence used
  // !! L.14: Matlab function bitshift not yet converted, original calling sequence used
  // !! L.14: Matlab function strcat not yet converted, original calling sequence used
  // L.14: Name conflict: function name changed from strcat to %strcat
  res = %strcat(res,char(mtlb_a(asciimat("A"),mtlb_double(bitshift(bitshift(data(i),4,8),-4,8)))));
end;
endfunction
