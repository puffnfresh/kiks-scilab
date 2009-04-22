function [] = kiks_gui_getlimitlistbox()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_INT_LIMIT","KIKS_INT_LIST");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","limit_popup");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
nr = get(h,"Value");
KIKS_INT_LIMIT = mtlb_e(KIKS_INT_LIST,nr);
endfunction
