function [ret] = kiksnet_disconnect()

// Ouput variables initialisation (not found in input variables)
ret=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------

global("KIKS_KIKSNET_MONITORING","KIKS_FID","KIKS_GUI_STATUS","KIKS_GUI_HDL","KIKSNET_ACTIVE")
KIKSNET_ACTIVE = [];
KIKS_KIKSNET_MONITORING = [];
if mtlb_logic(mtlb_double(KIKS_FID),">=",0) then
  // !! L.11: Unknown function tcpip_close not converted, original calling sequence used
  tcpip_close(KIKS_FID);
end;
KIKS_FID = -1;
// !! L.14: Matlab function findobj not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from findobj to %findobj
mtlb_delete(%findobj(KIKS_GUI_HDL,"tag","kiksnet_clientstats"));
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
%set(KIKS_GUI_HDL,"name","KiKS");
// !! L.16: Matlab function findobj not yet converted, original calling sequence used
// L.16: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","kiksnet_server_btn");
// !! L.17: Matlab function set not yet converted, original calling sequence used
// L.17: Name conflict: function name changed from set to %set
%set(H,"String","administrate KiKSnet server");
// !! L.18: Matlab function findobj not yet converted, original calling sequence used
// L.18: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","kiksnet_frame");
// !! L.19: Matlab function set not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from set to %set
%set(H,"Position",[3,472,143,94]);
// !! L.20: Matlab function findobj not yet converted, original calling sequence used
// L.20: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"type","uicontrol");
for i = 1:size(mtlb_double(H))
  // !! L.22: Matlab function set not yet converted, original calling sequence used
  // L.22: Name conflict: function name changed from set to %set
  %set(mtlb_e(H,i),"Visible",char(mtlb_e(KIKS_GUI_STATUS,i)));
end;
// !! L.24: Matlab function findobj not yet converted, original calling sequence used
// L.24: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL);
[gui_objs,tmp] = size(mtlb_double(h));
for i = 1:gui_objs
  // !! L.27: Matlab function get not yet converted, original calling sequence used
  // L.27: Name conflict: function name changed from get to %get
  tag = %get(mtlb_e(h,i),"Tag");
  // !! L.28: Matlab function strncmp not yet converted, original calling sequence used

  if strncmp(tag,"t_kiksnetserver_",16) then
    // !! L.29: Matlab function set not yet converted, original calling sequence used
    // L.29: Name conflict: function name changed from set to %set
    %set(mtlb_e(h,i),"Visible","off");
  end;
end;

kiks_delete_remote;
// !! L.34: Unknown function kiks_spawn_robot not converted, original calling sequence used
kiks_spawn_robot;
// L.35: Drawing events are not queued in Scilab
//drawnow
// !! L.36: Unknown function kiks_status not converted, original calling sequence used
kiks_status("<KiKSnet> Disconnected from KiKSnet server.");
endfunction
