function [] = kiks_pausesim()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SIM_STEP","KIKS_SIM_PAUSE","KIKS_GUI_HDL");

if mtlb_logic(mtlb_double(KIKS_SIM_PAUSE),"==",0) then
  KIKS_SIM_PAUSE = 1;
  // !! L.11: Matlab function findobj not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","pausesim");
  // !! L.12: Matlab function set not yet converted, original calling sequence used
  // L.12: Name conflict: function name changed from set to %set
  set(h,"string",">");
  // !! L.13: Matlab function findobj not yet converted, original calling sequence used
  // L.13: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","stepsim");
  // !! L.14: Matlab function set not yet converted, original calling sequence used
  // L.14: Name conflict: function name changed from set to %set
  set(h,"enable","on");
  KIKS_SIM_STEP = 0;
else
  KIKS_SIM_PAUSE = 0;
  // !! L.18: Matlab function findobj not yet converted, original calling sequence used
  // L.18: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","pausesim");
  // !! L.19: Matlab function set not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from set to %set
  set(h,"string","| |");
  // !! L.20: Matlab function findobj not yet converted, original calling sequence used
  // L.20: Name conflict: function name changed from findobj to %findobj
  h = findobj("tag","stepsim");
  // !! L.21: Matlab function set not yet converted, original calling sequence used
  // L.21: Name conflict: function name changed from set to %set
  set(h,"enable","off");
  KIKS_SIM_STEP = 0;
end;
endfunction
