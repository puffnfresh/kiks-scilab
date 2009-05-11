function [] = kiks_settimescale(tscale)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL");

if bool2s(mtlb_logic(mtlb_double(tscale),"==",1))|bool2s(mtlb_logic(mtlb_double(tscale),"==",2)) then
  // !! L.10: Matlab function findobj not yet converted, original calling sequence used
  // L.10: Name conflict: function name changed from findobj to %findobj
  h = findobj("Tag","timescale_popup");
  // !! L.11: Matlab function get not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from get to %get
  nr = get(h,"Value");
  // !! L.12: Matlab function set not yet converted, original calling sequence used
  // L.12: Name conflict: function name changed from set to %set
  set(h,"Value",tscale);
  kiks_gui_gettimescale;
end;
endfunction
