function [] = kiks_gui_setlimitlistbox(val)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_INT_LIMIT","KIKS_INT_CELL");

if %nargin<1 then
  val = 4;
end;

// !! L.13: Matlab function findobj not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","limit_popup");
// !! L.14: Matlab function set not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from set to %set
set(h,"String",KIKS_INT_CELL);
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
set(h,"Value",val);
endfunction
