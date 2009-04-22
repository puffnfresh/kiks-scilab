function [] = kiks_gui_ixprox()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_AVAIL_NNET","KIKS_PROX_USEARRAY","KIKS_GUI_HDL")

if mtlb_logic(mtlb_double(KIKS_AVAIL_NNET),"==",1) then
  // !! L.10: Matlab function findobj not yet converted, original calling sequence used
  // L.10: Name conflict: function name changed from findobj to %findobj
  h = findobj("Tag","indexprox_chk");
  // !! L.11: Matlab function get not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from get to %get
  nr = get(h,"Value");

  KIKS_PROX_USEARRAY = nr;
else
  // !! L.15: Matlab function findobj not yet converted, original calling sequence used
  // L.15: Name conflict: function name changed from findobj to %findobj
  h = findobj("Tag","indexprox_chk");
  // !! L.16: Matlab function set not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from set to %set
  if type(h) == 9 then
    set(h,"Enable","off");
  end;
  KIKS_PROX_USEARRAY = 1;
end;
endfunction
