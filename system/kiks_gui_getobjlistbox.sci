function [nr] = kiks_gui_getobjlistbox()

// Ouput variables initialisation (not found in input variables)
nr=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_SENS_LIST","KIKS_PROX_ACCURACY");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"Tag","objpopup");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
nr = %get(h,"Value");
endfunction
