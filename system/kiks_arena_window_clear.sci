function [] = kiks_arena_window_clear()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE");

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
  // !! L.10: Matlab function findobj not yet converted, original calling sequence used
  // L.10: Name conflict: function name changed from findobj to %findobj
  a = findobj("Type","line");  // clean up lines
  mtlb_delete(a);
end;
endfunction
