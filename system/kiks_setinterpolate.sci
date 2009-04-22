function [] = kiks_setinterpolate()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_INTERPOLATE","KIKS_GUI_HDL");
// !! L.8: Matlab function findobj not yet converted, original calling sequence used
// L.8: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","int_check");
// !! L.9: Matlab function set not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from set to %set
if type(h) == 9 then
  set(h,"Value",KIKS_INTERPOLATE);
end;

endfunction
