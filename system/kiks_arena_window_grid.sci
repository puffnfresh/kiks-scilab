function [] = kiks_arena_window_grid()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE","KIKS_2D_GRID");

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
  kiks_arena_window_close;
  KIKS_2D_GRID = abs(mtlb_s(mtlb_double(KIKS_2D_GRID),1));
  // !! L.12: Unknown function kiks_arena_window_open not converted, original calling sequence used
  kiks_arena_window_open;
end;
endfunction
