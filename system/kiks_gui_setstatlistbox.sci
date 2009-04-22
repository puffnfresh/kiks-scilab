function [] = kiks_gui_setstatlistbox(val)

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

global("KIKS_GUI_HDL","KIKS_STAT_CELL","KIKS_STAT_LIST");
if %nargin<1 then
  val = 4;
else
  KIKS_MAXMOVLIMIT = mtlb_e(KIKS_STAT_LIST,val);
end;

// !! L.14: Matlab function findobj not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","stat_popup");
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
if ~isempty(h) then
  set(h,"String",KIKS_STAT_LIST);
  // !! L.16: Matlab function set not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from set to %set
  set(h,"Value",val);
end;
endfunction
