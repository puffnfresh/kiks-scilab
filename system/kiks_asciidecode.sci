function [res] = kiks_asciidecode(str)

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


res = [];
str = double(mtlb_double(str));
[tmp,sz] = size(str);

for i = 1:2:sz
  // !! L.13: Matlab function bitshift not yet converted, original calling sequence used
  res = [res,mtlb_a(mtlb_double(bitshift(str(i)-asciimat("A"),4)),str(i+1)-asciimat("A"))];
end;
endfunction
