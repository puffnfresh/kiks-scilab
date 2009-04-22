function [] = kiks_gui_grid(onoff)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE","KIKS_2DGRID","KIKS_ARENA_MX")

KIKS_2DGRID = onoff;
if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
  // !! L.11: Matlab function findobj not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from findobj to %findobj
  h = %findobj("Name","KiKS arena");
  // !! L.12: Matlab function figure not yet converted
  // !! L.12: Matlab function figure not yet converted, original calling sequence used
  figure(h);
  [y,x] = size(mtlb_double(KIKS_ARENA_MX));
  for i = 0:10:y
    plot([0,x],[i,i],"b:");
  end;
  for i = 0:10:x
    plot([i,i],[0,y],"b:");
  end;
end;
endfunction
