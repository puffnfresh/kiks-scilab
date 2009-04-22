function [] = kiks_gui_getcomplistbox()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_COMP_LIST","KIKS_COMPUTER_SPEED_SIM");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"Tag","compspeed_popup");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
nr = %get(h,"Value");
KIKS_COMPUTER_SPEED_SIM = mtlb_e(KIKS_COMP_LIST,nr);
endfunction
