function [arena,colormask] = kiks_kad2arena(a)

// Ouput variables initialisation (not found in input variables)
arena=[];
colormask=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


a = double(mtlb_double(a));
arena = [];
colormask = [];

xs = double(a(1));
ys = double(a(2));
// ! L.9: real(ys) may be replaced by:
// !    --> ys if ys is Real
// ! L.9: real(xs) may be replaced by:
// !    --> xs if xs is Real
colormask = zeros(real(ys),real(xs));
i = 3;
while i<max(size(a))
  no_vert = a(i);
  i = i+1;
  x = a(i:i+no_vert-1);
  i = i+no_vert;
  y = a(i:i+no_vert-1);
  i = i+no_vert;
  col = a(i);
  i = i+1;
  // ! L.20: real(mtlb_a(mtlb_s(mtlb_max(y,"m"),mtlb_min(y,"m")),1)) may be replaced by:
  // !    --> mtlb_a(mtlb_s(mtlb_max(y,"m"),mtlb_min(y,"m")),1) if mtlb_a(mtlb_s(mtlb_max(y,"m"),mtlb_min(y,"m")),1) is Real
  // ! L.20: real(mtlb_a(mtlb_s(mtlb_max(x,"m"),mtlb_min(x,"m")),1)) may be replaced by:
  // !    --> mtlb_a(mtlb_s(mtlb_max(x,"m"),mtlb_min(x,"m")),1) if mtlb_a(mtlb_s(mtlb_max(x,"m"),mtlb_min(x,"m")),1) is Real
  mask = zeros(real(mtlb_a(mtlb_s(mtlb_max(y,"m"),mtlb_min(y,"m")),1)),real(mtlb_a(mtlb_s(mtlb_max(x,"m"),mtlb_min(x,"m")),1)));
  [yix,xix] = mtlb_find(bool2s(mtlb_logic(mask,"==",0)));
  // !! L.22: Matlab function inpolygon not yet converted, original calling sequence used
  in = inpolygon(xix,yix,mtlb_a(mtlb_s(x,mtlb_min(x,"m")),1),mtlb_a(mtlb_s(y,mtlb_min(y,"m")),1));
  mask(mtlb_e(yix,mtlb_find(bool2s(mtlb_logic(mtlb_double(in),">",0)))),mtlb_e(xix,mtlb_find(bool2s(mtlb_logic(mtlb_double(in),">",0))))) = 1;
  colormask(mtlb_imp(mtlb_min(y,"m"),mtlb_max(y,"m")),mtlb_imp(mtlb_min(x,"m"),mtlb_max(x,"m"))) = mask*col;
  //    colormask(min(y):max(y),min(x):max(x))=mask*round(rand*100); % visible polygons
  // !! L.26: Unknown function kiks_progress not converted, original calling sequence used
  kiks_progress(i/max(size(a)),"rendering arena ");
end;
arena = mtlb_logic(colormask,">",0);
endfunction
