function [] = kiks_gui_roundobjvis(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_ROUNDOBJ_HDL");

// !! L.9: Unknown function kiks_roundobjpatch not converted, original calling sequence used
KIKS_ROUNDOBJ_HDL = mtlb_i(KIKS_ROUNDOBJ_HDL,id,kiks_roundobjpatch(id));
endfunction
