function [] = kiks_arena_window_close()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE","KIKS_GUI_HDL","KIKS_ARENA_HDL");

KIKS_2DVISUALIZE = 0;

// !! L.11: Matlab function findobj not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","toggle2dvis");
// !! L.12: Matlab function set not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from set to %set
%set(H,"String","enable visualization");
// !! L.13: Matlab function findobj not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","arena_redraw");
// !! L.14: Matlab function set not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from set to %set
%set(H,"Enable","off");
// !! L.15: Matlab function findobj not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","arena_grid");
// !! L.16: Matlab function set not yet converted, original calling sequence used
// L.16: Name conflict: function name changed from set to %set
%set(H,"Enable","off");
// !! L.17: Matlab function findobj not yet converted, original calling sequence used
// L.17: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"type","patch");
mtlb_delete(H);
// !! L.19: Matlab function findobj not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"type","image");
mtlb_delete(H);
// !! L.21: Unknown function kiks_gui_resize not converted, original calling sequence used
kiks_gui_resize;
endfunction
