function [] = kiks_gui_monitorclsreq()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MONITOR_ON");

// !! L.9: Matlab function gcf not yet converted
// !! L.9: Matlab function get not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from get to %get
name = %get(mtlb(gcf),"Name");
// !! L.10: Matlab function sscanf not yet converted, original calling sequence used
num = abs(mtlb_double(sscanf(name,"Port %d")));
KIKS_MONITOR_ON = mtlb_i(KIKS_MONITOR_ON,num,0);
// !! L.12: Matlab function gcf not yet converted
mtlb_delete(mtlb(gcf));
endfunction
