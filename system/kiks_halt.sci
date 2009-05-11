function [] = kiks_halt()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SIM_PAUSE","KIKS_HALT_BOOL","KIKS_GUI_HDL");

KIKS_HALT_BOOL = 1;
KIKS_SIM_PAUSE = 0;
// !! L.11: Matlab function findobj not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","haltsim");
// !! L.12: Matlab function set not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from set to %set
set(h,"Enable","off");
// !! L.13: Matlab function findobj not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","haltsim");
// !! L.14: Matlab function set not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from set to %set
set(h,"Enable","off");
// !! L.15: Matlab function findobj not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","loadarena");
// !! L.16: Matlab function set not yet converted, original calling sequence used
// L.16: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.17: Matlab function findobj not yet converted, original calling sequence used
// L.17: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","savearena");
// !! L.18: Matlab function set not yet converted, original calling sequence used
// L.18: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.19: Matlab function findobj not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","addobj");
// !! L.20: Matlab function set not yet converted, original calling sequence used
// L.20: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.21: Matlab function findobj not yet converted, original calling sequence used
// L.21: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","deleteobj");
// !! L.22: Matlab function set not yet converted, original calling sequence used
// L.22: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.23: Matlab function findobj not yet converted, original calling sequence used
// L.23: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","addkhep");
// !! L.24: Matlab function set not yet converted, original calling sequence used
// L.24: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.25: Matlab function findobj not yet converted, original calling sequence used
// L.25: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","deletekhep");
// !! L.26: Matlab function set not yet converted, original calling sequence used
// L.26: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.27: Matlab function findobj not yet converted, original calling sequence used
// L.27: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","loadarena");
// !! L.28: Matlab function set not yet converted, original calling sequence used
// L.28: Name conflict: function name changed from set to %set
set(h,"Enable","on");
endfunction
