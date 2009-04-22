function [o] = kiks_generate_wall_polyg(arena)

// Ouput variables initialisation (not found in input variables)
o=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------


[ys,xs] = size(mtlb_double(arena));
res = [];
o = [xs,ys];

// ! L.12: abs(mtlb_double(arena)) may be replaced by:
// !    --> mtlb_double(arena) if mtlb_double(arena) is real
bits = max(size(mtlb_find(abs(mtlb_double(arena)))));
sum = 0;

while mtlb_logic(mtlb_double(mtlb_max(mtlb_double(mtlb_max(mtlb_double(arena),"m")),"m")),">",0)
  // ! L.16: abs(mtlb_double(arena)) may be replaced by:
  // !    --> mtlb_double(arena) if mtlb_double(arena) is real
  [ix_y,ix_x] = mtlb_find(abs(mtlb_double(arena)));
  tl_x = ix_x(1);
  tl_y = ix_y(1);
  col = arena(tl_y,tl_x);

  restofcol = arena(tl_y:ys,tl_x);
  indexes = find(bool2s(mtlb_double(restofcol)~=mtlb_double(col)))';
  if isempty(indexes) then
    bl_y = ys;
  else
    bl_y = tl_y+indexes(1)-2;
  end;
  tr_y = tl_y;

  bl_x = tl_x;
  br_y = bl_y;

  searchspace = arena(tl_y:bl_y,tl_x:xs);
  [ix_y,ix_x] = mtlb_find(bool2s(mtlb_logic(mtlb_double(searchspace),"~=",mtlb_double(col))));
  if isempty(ix_x) then
    br_x = xs;
  else
    br_x = bl_x+ix_x(1)-2;
  end;
  tr_x = br_x;

  arena(tl_y:br_y,tl_x:br_x) = 0;
  res = [res;tl_x,tr_x,br_x,bl_x,tl_y,tr_y,br_y,bl_y,col];
  sum = sum+(bl_y-tl_y+1)*(tr_x-tl_x+1);
  // !! L.45: Unknown function kiks_progress not converted, original calling sequence used
  kiks_progress(sum/bits,"generating polygons ");
end;

[polys,tmp] = size(mtlb_double(res));
// !! L.49: Matlab function sprintf not yet converted, original calling sequence used
// !! L.49: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf("%d polygons generated.",polys));
for i = 1:polys
  // !! L.51: Unknown function kiks_progress not converted, original calling sequence used
  kiks_progress(i/polys,"optimizing polygons ");
  p = double(mtlb_double(res(i,:)));
  o = [o,4,p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9)];
end;
// !! L.55: Scilab uint16() does not work with Complex values: uint16() call IGNORED !
// ! L.55: o may be replaced by:
// !    --> uint16(o) if o is real
o = o;
endfunction
