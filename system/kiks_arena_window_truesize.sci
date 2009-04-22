function [] = kiks_arena_window_truesi()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_ARENA_HDL")

// !! L.9: Matlab toolbox(es) function truesize not converted, original calling sequence used
truesize(KIKS_ARENA_HDL);
endfunction
