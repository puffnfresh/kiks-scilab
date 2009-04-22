function [] = kiks_arena_edit_mode()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_GUI_HDL","KIKS_ARENA_EDITING_MODE","KIKS_COLOR_BACKGROUND");

KIKS_ARENA_EDITING_MODE = pmodulo(mtlb_a(mtlb_double(KIKS_ARENA_EDITING_MODE),1),2);

// !! L.6: Matlab function findobj not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"tag","arena_edit_mode");
select KIKS_ARENA_EDITING_MODE
  case 0 then
    // !! L.8: Matlab function set not yet converted, original calling sequence used
    // L.8: Name conflict: function name changed from set to %set
    %set(h,"String","mode: draw");
    // !! L.9: Matlab function findobj not yet converted, original calling sequence used
    // L.9: Name conflict: function name changed from findobj to %findobj
    h = %findobj(KIKS_GUI_HDL,"tag","arena_color_slider");
    // !! L.10: Matlab function set not yet converted, original calling sequence used
    // L.10: Name conflict: function name changed from set to %set
    %set(h,"enable","on");
    // !! L.11: Matlab function get not yet converted, original calling sequence used
    // L.11: Name conflict: function name changed from get to %get
    v = %get(h,"Value");    // !! L.11: Matlab function set not yet converted, original calling sequence used
    // L.11: Name conflict: function name changed from set to %set
    %set(h,"BackgroundColor",[mtlb_double(v)/255,mtlb_double(v)/255,mtlb_double(v)/255]);
  case 1 then
    // !! L.13: Matlab function set not yet converted, original calling sequence used
    // L.13: Name conflict: function name changed from set to %set
    %set(h,"String","mode: erase");
    // !! L.14: Matlab function findobj not yet converted, original calling sequence used
    // L.14: Name conflict: function name changed from findobj to %findobj
    h = %findobj(KIKS_GUI_HDL,"tag","arena_color_slider");
    // !! L.15: Matlab function set not yet converted, original calling sequence used
    // L.15: Name conflict: function name changed from set to %set
    %set(h,"enable","off");
    // !! L.16: Matlab function set not yet converted, original calling sequence used
    // L.16: Name conflict: function name changed from set to %set
    %set(h,"BackgroundColor",KIKS_COLOR_BACKGROUND);
end;
endfunction
