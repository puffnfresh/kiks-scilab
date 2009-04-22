function [] = kiks_gui_gettimescale()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_WALL_CLOCK","KIKS_GUI_HDL","KIKS_TIMESCALE","KIKS_ACC_LIST","KIKS_updatelmp");

KIKS_updatelmp = -1;

// !! L.11: Matlab function findobj not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"Tag","timescale_popup");
// !! L.12: Matlab function get not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from get to %get
nr = %get(h,"Value");
KIKS_TIMESCALE = mtlb_e(KIKS_ACC_LIST,nr);
if mtlb_logic(mtlb_double(KIKS_TIMESCALE),">",0) then
  // disable movement limit list box
  // !! L.16: Matlab function findobj not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"Tag","stat_popup");
  // !! L.17: Matlab function set not yet converted, original calling sequence used
  // L.17: Name conflict: function name changed from set to %set
  %set(H,"Enable","off");
  // !! L.18: Matlab function findobj not yet converted, original calling sequence used
  // L.18: Name conflict: function name changed from findobj to %findobj
  h = %findobj(KIKS_GUI_HDL,"Tag","compspeed_popup");
  // !! L.19: Matlab function set not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from set to %set
  %set(h,"Enable","off");
  // !! L.20: Matlab function findobj not yet converted, original calling sequence used
  // L.20: Name conflict: function name changed from findobj to %findobj
  h = %findobj(KIKS_GUI_HDL,"tag","acceleration_method");
  // !! L.21: Matlab function set not yet converted, original calling sequence used
  // L.21: Name conflict: function name changed from set to %set
  %set(h,"value",2);
  kiks_gui_getaccmethod;
  // !! L.23: Matlab function set not yet converted, original calling sequence used
  // L.23: Name conflict: function name changed from set to %set
  %set(h,"enable","off");
  KIKS_WALL_CLOCK = [];
else
  // enable movement limit list box
  // !! L.27: Matlab function findobj not yet converted, original calling sequence used
  // L.27: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"Tag","stat_popup");
  // !! L.28: Matlab function set not yet converted, original calling sequence used
  // L.28: Name conflict: function name changed from set to %set
  %set(H,"Enable","on");
  // !! L.29: Matlab function findobj not yet converted, original calling sequence used
  // L.29: Name conflict: function name changed from findobj to %findobj
  h = %findobj(KIKS_GUI_HDL,"Tag","compspeed_popup");
  // !! L.30: Matlab function set not yet converted, original calling sequence used
  // L.30: Name conflict: function name changed from set to %set
  %set(h,"Enable","on");
  // !! L.31: Matlab function findobj not yet converted, original calling sequence used
  // L.31: Name conflict: function name changed from findobj to %findobj
  h = %findobj(KIKS_GUI_HDL,"tag","acceleration_method");
  // !! L.32: Matlab function set not yet converted, original calling sequence used
  // L.32: Name conflict: function name changed from set to %set
  %set(h,"enable","on");
  kiks_gui_getaccmethod;
  KIKS_WALL_CLOCK = [];
end;
endfunction
