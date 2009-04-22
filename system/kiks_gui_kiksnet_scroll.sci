function [] = kiks_gui_kiksnet_scroll(val)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_GUI_HDL","KIKS_GUI_KIKSNET_CLIENTS_CNT")

// ! L.4: mtlb(KIKS_GUI_KIKSNET_CLIENTS) can be replaced by KIKS_GUI_KIKSNET_CLIENTS() or KIKS_GUI_KIKSNET_CLIENTS whether KIKS_GUI_KIKSNET_CLIENTS is an M-file or not
KIKS_GUI_KIKSNET_CLIENTS = mtlb_max(0,mtlb_a(mtlb_double(mtlb(KIKS_GUI_KIKSNET_CLIENTS)),mtlb_double(val)));
// !! L.5: Matlab function findobj not yet converted, original calling sequence used
// L.5: Name conflict: function name changed from findobj to %findobj
// !! L.5: Matlab function set not yet converted, original calling sequence used
// L.5: Name conflict: function name changed from set to %set
%set(%findobj(KIKS_GUI_HDL,"Tag","t_kiksnetserver_scrollup"),"Enable","off");
// !! L.6: Matlab function findobj not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from findobj to %findobj
// !! L.6: Matlab function set not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from set to %set
%set(%findobj(KIKS_GUI_HDL,"Tag","t_kiksnetserver_scrolldown"),"Enable","off");
endfunction
