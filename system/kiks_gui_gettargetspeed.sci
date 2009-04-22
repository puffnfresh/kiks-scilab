function [] = kiks_gui_gettargetspeed()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_COMPUTER_SPEED","KIKS_COMPUTER_SPEED_SIM","KIKS_WALL_CLOCK","KIKS_GUI_HDL","KIKS_TIMESCALE","KIKS_ACC_LIST","KIKS_updatelmp");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","speed_target");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
nr = get(h,"Value");

// !! L.12: Matlab function findobj not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","acceleration_method");
// !! L.13: Matlab function get not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from get to %get
str = get(h,"string");

// !! L.15: Matlab function sprintf not yet converted, original calling sequence used
str = cell();str((1,2)).entries = sprintf("target speed: %.0f%%",nr);
// !! L.16: Matlab function set not yet converted, original calling sequence used
// L.16: Name conflict: function name changed from set to %set
set(h,"string",str);
KIKS_COMPUTER_SPEED_SIM = mtlb_double(KIKS_COMPUTER_SPEED)*(mtlb_double(nr)/100);
endfunction
