function [] = kiks_gui_setsenslistbox()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_SENS_CELL","KIKS_PROX_ACCURACY");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"Tag","proxsens_popup");
// !! L.10: Matlab function set not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from set to %set
%set(h,"String",KIKS_SENS_CELL);
// !! L.11: Matlab function set not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from set to %set
%set(h,"Value",4);
endfunction
