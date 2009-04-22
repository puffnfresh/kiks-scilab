function [] = kiks_matlab_focus()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_GUI_HDL")

// !! L.4: Matlab function figure not yet converted
// !! L.4: Matlab function figure not yet converted, original calling sequence used
figure(KIKS_GUI_HDL);
// !! L.5: Matlab function findobj not yet converted, original calling sequence used
// L.5: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"tag","kiks_matlab_command");
// !! L.6: Matlab function set not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from set to %set
%set(KIKS_GUI_HDL,"CurrentObject",h);
endfunction
