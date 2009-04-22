function [] = kiks_gui_getstatlistbox()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_STAT_LIST","KIKS_MAXMOVLIMIT");

// !! L.9: Matlab function findobj not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","stat_popup");
// !! L.10: Matlab function get not yet converted, original calling sequence used
// L.10: Name conflict: function name changed from get to %get
nr = get(h,"Value");
KIKS_MAXMOVLIMIT = mtlb_e(KIKS_STAT_LIST,nr);
if mtlb_logic(mtlb_double(KIKS_MAXMOVLIMIT),">",0) then
  KIKS_MAXMOVLIMIT = 1/mtlb_double(KIKS_MAXMOVLIMIT);
end;
endfunction
