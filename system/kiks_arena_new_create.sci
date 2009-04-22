function [] = kiks_arena_new_create(hg,wd,r,c) 

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


if %nargin<4 then
  // !! L.5: Matlab function gcf not yet converted
  // !! L.5: Matlab function findobj not yet converted, original calling sequence used
  // L.5: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb(gcf),"tag","width");
  // !! L.6: Matlab function get not yet converted, original calling sequence used
  // L.6: Name conflict: function name changed from get to %get
  wd = evstr(%get(h,"String"));
  // !! L.7: Matlab function gcf not yet converted
  // !! L.7: Matlab function findobj not yet converted, original calling sequence used
  // L.7: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb(gcf),"tag","height");
  // !! L.8: Matlab function get not yet converted, original calling sequence used
  // L.8: Name conflict: function name changed from get to %get
  hg = evstr(%get(h,"String"));
  // !! L.9: Matlab function gcf not yet converted
  // !! L.9: Matlab function findobj not yet converted, original calling sequence used
  // L.9: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb(gcf),"tag","rounded");
  // !! L.10: Matlab function get not yet converted, original calling sequence used
  // L.10: Name conflict: function name changed from get to %get
  r = %get(h,"Value");
  // !! L.11: Matlab function gcf not yet converted
  // !! L.11: Matlab function findobj not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb(gcf),"tag","color");
  // !! L.12: Matlab function get not yet converted, original calling sequence used
  // L.12: Name conflict: function name changed from get to %get
  c = mtlb_min(255,ceil(mtlb_double(%get(h,"Value"))));
  // !! L.13: Matlab function gcf not yet converted
  mtlb_close(mtlb(gcf));
end;

if bool2s(~isempty(wd))&bool2s(~isempty(hg)) then
  hg = mtlb_s(mtlb_double(hg),20);
  wd = mtlb_s(mtlb_double(wd),20);
  // ! L.19: real(mtlb_a(hg,20)) may be replaced by:
  // !    --> mtlb_a(hg,20) if mtlb_a(hg,20) is Real
  // ! L.19: real(mtlb_a(wd,20)) may be replaced by:
  // !    --> mtlb_a(wd,20) if mtlb_a(wd,20) is Real
  arena = ones(real(mtlb_a(hg,20)),real(mtlb_a(wd,20)));
  arena(mtlb_imp(10,mtlb_a(hg,10)),mtlb_imp(10,mtlb_a(wd,10))) = 0;
  if mtlb_logic(mtlb_double(r),"==",1) then
    max_radius = mtlb_min(100,mtlb_min(hg,wd)/2);
    MX = floor(max_radius)*2+1;
    MY = floor(max_radius)*2+1;
    // ! L.25: real(MX) may be replaced by:
    // !    --> MX if MX is Real
    // ! L.25: real(MY) may be replaced by:
    // !    --> MY if MY is Real
    ROUND_MASK = zeros(real(MX),real(MY));
    for x = 1:MX
      for y = 1:MY
        if sqrt((x-(MX+1)/2)*(x-(MX+1)/2)+(y-(MY+1)/2)*(y-(MY+1)/2))<=max_radius then ROUND_MASK(x,y) = 1;end;
      end;
    end;
  
    [xs,ys] = size(ROUND_MASK);
    x = floor((xs-1)/2);
    y = floor((ys-1)/2);
    arena(1+10:x-1+10,1+10:y-1+10) = abs(mtlb_s(ROUND_MASK(2:x,2:y),1));
    arena(mtlb_imp(mtlb_a(mtlb_s(hg,x),10),mtlb_a(hg,10)),1+10:y-1+10) = abs(mtlb_s(ROUND_MASK(x+1:xs,2:y),1));
    arena(mtlb_imp(mtlb_a(mtlb_s(hg,x),10),mtlb_a(hg,10)),mtlb_imp(mtlb_a(mtlb_s(wd,y),10),mtlb_a(wd,10))) = abs(mtlb_s(ROUND_MASK(x+1:xs,y+1:ys),1));
    arena(1+10:x-1+10,mtlb_imp(mtlb_a(mtlb_s(wd,y),10),mtlb_a(wd,10))) = abs(mtlb_s(ROUND_MASK(2:x,y+1:ys),1));
  end;
  colormask = arena*mtlb_double(c);
  kiks_arena(arena,colormask);
end;
endfunction
