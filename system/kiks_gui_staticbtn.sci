function [] = kiks_gui_staticbtn()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_GUI_HDL","KIKS_TIMESCALE","KIKS_updatelmp");

KIKS_updatelmp = -1;

KIKS_TIMESCALE = -1;
// !! L.12: Matlab function findobj not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","update_frame");
// !! L.13: Matlab function set not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from set to %set
%set(H,"BackgroundColor",[0.3,0.3,0.3]);
// !! L.14: Matlab function findobj not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","update_text");
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
%set(H,"BackgroundColor",[0.3,0.3,0.3]);

// !! L.17: Matlab function findobj not yet converted, original calling sequence used
// L.17: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","button_dynamic");
// !! L.18: Matlab function set not yet converted, original calling sequence used
// L.18: Name conflict: function name changed from set to %set
%set(H,"Value",0);
// !! L.19: Matlab function findobj not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","button_real");
// !! L.20: Matlab function set not yet converted, original calling sequence used
// L.20: Name conflict: function name changed from set to %set
%set(H,"Value",0);
// !! L.21: Matlab function findobj not yet converted, original calling sequence used
// L.21: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","button_static");
// !! L.22: Matlab function set not yet converted, original calling sequence used
// L.22: Name conflict: function name changed from set to %set
%set(H,"Value",1);

// !! L.24: Matlab function findobj not yet converted, original calling sequence used
// L.24: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","step_popup");
// !! L.25: Matlab function set not yet converted, original calling sequence used
// L.25: Name conflict: function name changed from set to %set
%set(H,"Enable","on");
// !! L.26: Matlab function findobj not yet converted, original calling sequence used
// L.26: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","stat_popup");
// !! L.27: Matlab function set not yet converted, original calling sequence used
// L.27: Name conflict: function name changed from set to %set
%set(H,"Enable","on");

// !! L.29: Matlab function findobj not yet converted, original calling sequence used
// L.29: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","acc_popup");
// !! L.30: Matlab function set not yet converted, original calling sequence used
// L.30: Name conflict: function name changed from set to %set
%set(H,"Enable","off");
// !! L.31: Matlab function findobj not yet converted, original calling sequence used
// L.31: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","limit_popup");
// !! L.32: Matlab function set not yet converted, original calling sequence used
// L.32: Name conflict: function name changed from set to %set
%set(H,"Enable","on");
// !! L.33: Matlab function findobj not yet converted, original calling sequence used
// L.33: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","int_check");
// !! L.34: Matlab function set not yet converted, original calling sequence used
// L.34: Name conflict: function name changed from set to %set
%set(H,"Enable","on");

kiks_gui_getstatlistbox;
endfunction
