function [] = kiks_arena_window_open()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE","KIKS_GUI_HDL","KIKS_ARENA_HDL");

// !! L.9: Matlab function figure not yet converted
// !! L.9: Matlab function figure not yet converted, original calling sequence used
figure(KIKS_GUI_HDL);
KIKS_2DVISUALIZE = 1;
// !! L.11: Unknown function kiks_arena_window_init not converted, original calling sequence used
kiks_arena_window_init;
// !! L.12: Matlab function findobj not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","toggle2dvis");
// !! L.13: Matlab function set not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from set to %set
%set(H,"String","disable visualization");
// !! L.14: Matlab function findobj not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","arena_redraw");
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
%set(H,"Enable","on");
// !! L.16: Matlab function findobj not yet converted, original calling sequence used
// L.16: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","arena_grid");
// !! L.17: Matlab function set not yet converted, original calling sequence used
// L.17: Name conflict: function name changed from set to %set
%set(H,"Enable","on");

// !! L.19: Unknown function kiks_gui_resize not converted, original calling sequence used
kiks_gui_resize(648);
endfunction
