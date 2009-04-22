function [] = kiks_gui_placerobot()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_RBTARRAY","KIKS_GUI_HDL")

// !! L.4: Unknown function kiks_spawn_robot not converted, original calling sequence used
kiks_spawn_robot;
endfunction
