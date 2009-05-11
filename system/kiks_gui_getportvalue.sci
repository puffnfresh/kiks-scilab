function [num] = kiks_gui_getportvalue()

// Ouput variables initialisation (not found in input variables)
num=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","kheppopup");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
s = get(h,"String");
// !! L.11: Matlab function get not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from get to %get
v = get(h,"Value");

[y,x] = size(mtlb_double(s));

for i = 1:y
  // !! L.16: Matlab function sprintf not yet converted, original calling sequence used
  f(1,i) = makecell([1,1],sprintf("str%d",i));
end;
// !! L.18: Matlab function cell2struct not yet converted, original calling sequence used
sc = cell2struct(s,f,1);
// !! L.19: Matlab function sprintf not yet converted, original calling sequence used
// !! L.19: Matlab function getfield not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from getfield to %getfield
str = %getfield(sc,sprintf("str%d",v));
// !! L.20: Matlab function sscanf not yet converted, original calling sequence used
num = abs(mtlb_double(sscanf(str,"Port %d")));
endfunction
