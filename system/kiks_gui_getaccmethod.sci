function [] = kiks_gui_getaccmethod()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_WALL_CLOCK","KIKS_GUI_HDL","KIKS_TIMESCALE","KIKS_ACC_LIST","KIKS_updatelmp");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"Tag","acceleration_method");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
nr = %get(h,"Value");

if mtlb_logic(mtlb_double(nr),"==",1) then
  // disable movement limit list box
  // !! L.14: Matlab function findobj not yet converted, original calling sequence used
  // L.14: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"Tag","speed_target");
  // !! L.15: Matlab function set not yet converted, original calling sequence used
  // L.15: Name conflict: function name changed from set to %set
  %set(H,"Enable","off");
  // !! L.16: Matlab function set not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from set to %set
  %set(H,"Visible","off");
  // !! L.17: Matlab function findobj not yet converted, original calling sequence used
  // L.17: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"Tag","compspeed_popup");
  // !! L.18: Matlab function set not yet converted, original calling sequence used
  // L.18: Name conflict: function name changed from set to %set
  %set(H,"Enable","on");
  // !! L.19: Matlab function set not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from set to %set
  %set(H,"Visible","on");
  // !! L.20: Unknown function kiks_gui_getcomplistbox not converted, original calling sequence used
  kiks_gui_getcomplistbox;
else
  // enable movement limit list box
  // !! L.23: Matlab function findobj not yet converted, original calling sequence used
  // L.23: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"Tag","speed_target");
  // !! L.24: Matlab function set not yet converted, original calling sequence used
  // L.24: Name conflict: function name changed from set to %set
  %set(H,"Enable","on");
  // !! L.25: Matlab function set not yet converted, original calling sequence used
  // L.25: Name conflict: function name changed from set to %set
  %set(H,"Visible","on");
  // !! L.26: Matlab function findobj not yet converted, original calling sequence used
  // L.26: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"Tag","compspeed_popup");
  // !! L.27: Matlab function set not yet converted, original calling sequence used
  // L.27: Name conflict: function name changed from set to %set
  %set(H,"Enable","off");
  // !! L.28: Matlab function set not yet converted, original calling sequence used
  // L.28: Name conflict: function name changed from set to %set
  %set(H,"Visible","off");
  // !! L.29: Unknown function kiks_gui_gettargetspeed not converted, original calling sequence used
  kiks_gui_gettargetspeed;
end;
endfunction
