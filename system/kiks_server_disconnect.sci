function [ret] = kiks_server_disconnect()

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

global("KIKS_RBTARRAY","KIKS_FID","KIKS_GUI_HDL")
if mtlb_logic(mtlb_double(KIKS_FID),">=",0) then
  // !! L.9: Unknown function tcpip_close not converted, original calling sequence used
  tcpip_close(KIKS_FID);
  // !! L.10: Unknown function kiks_status not converted, original calling sequence used
  kiks_status("disconnected from KiKSnet server.");
end;
// !! L.12: Matlab function findobj not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","kiksnet_server_btn");
// !! L.13: Matlab function set not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.14: Matlab function findobj not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from findobj to %findobj
H = findobj("Tag","kiksnet_btn");
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.16: Matlab function set not yet converted, original calling sequence used
// L.16: Name conflict: function name changed from set to %set
set(H,"String","connect to KiKSnet server");
// !! L.17: Matlab function set not yet converted, original calling sequence used
// L.17: Name conflict: function name changed from set to %set
set(H,"Callback","kiks_server_connect;");
// !! L.18: Matlab function findobj not yet converted, original calling sequence used
// L.18: Name conflict: function name changed from findobj to %findobj
H = findobj("Tag","kiksnet_edit");
// !! L.19: Matlab function set not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from set to %set
set(H,"Enable","on");
// !! L.20: Matlab function findobj not yet converted, original calling sequence used
// L.20: Name conflict: function name changed from findobj to %findobj
H = findobj("Tag","callsign");
// !! L.21: Matlab function set not yet converted, original calling sequence used
// L.21: Name conflict: function name changed from set to %set
set(H,"Enable","on");
// !! L.22: Matlab function findobj not yet converted, original calling sequence used
// L.22: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","timescale_popup");
// !! L.23: Matlab function set not yet converted, original calling sequence used
// L.23: Name conflict: function name changed from set to %set
set(h,"Visible","on");
// !! L.24: Matlab function findobj not yet converted, original calling sequence used
// L.24: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","speed_target");
// !! L.25: Matlab function set not yet converted, original calling sequence used
// L.25: Name conflict: function name changed from set to %set
set(h,"Visible","on");
// !! L.26: Matlab function findobj not yet converted, original calling sequence used
// L.26: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","loadarena");
// !! L.27: Matlab function set not yet converted, original calling sequence used
// L.27: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.28: Matlab function findobj not yet converted, original calling sequence used
// L.28: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","savearena");
// !! L.29: Matlab function set not yet converted, original calling sequence used
// L.29: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.30: Matlab function findobj not yet converted, original calling sequence used
// L.30: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","addobj");
// !! L.31: Matlab function set not yet converted, original calling sequence used
// L.31: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.32: Matlab function findobj not yet converted, original calling sequence used
// L.32: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","deleteobj");
// !! L.33: Matlab function set not yet converted, original calling sequence used
// L.33: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.34: Matlab function findobj not yet converted, original calling sequence used
// L.34: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","addkhep");
// !! L.35: Matlab function set not yet converted, original calling sequence used
// L.35: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.36: Matlab function findobj not yet converted, original calling sequence used
// L.36: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","deletekhep");
// !! L.37: Matlab function set not yet converted, original calling sequence used
// L.37: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.38: Matlab function findobj not yet converted, original calling sequence used
// L.38: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","loadarena");
// !! L.39: Matlab function set not yet converted, original calling sequence used
// L.39: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.40: Matlab function findobj not yet converted, original calling sequence used
// L.40: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","radioid");
// !! L.41: Matlab function set not yet converted, original calling sequence used
// L.41: Name conflict: function name changed from set to %set
set(h,"string","n/a");
// !! L.42: Matlab function findobj not yet converted, original calling sequence used
// L.42: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","limit_popup");
// !! L.43: Matlab function set not yet converted, original calling sequence used
// L.43: Name conflict: function name changed from set to %set
set(h,"Visible","on");
// !! L.44: Matlab function findobj not yet converted, original calling sequence used
// L.44: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","simulate_popup");
// !! L.45: Matlab function set not yet converted, original calling sequence used
// L.45: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.46: Matlab function findobj not yet converted, original calling sequence used
// L.46: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","arena_reset");
// !! L.47: Matlab function set not yet converted, original calling sequence used
// L.47: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.48: Matlab function findobj not yet converted, original calling sequence used
// L.48: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","arena_checkpoint");
// !! L.49: Matlab function set not yet converted, original calling sequence used
// L.49: Name conflict: function name changed from set to %set
set(h,"Enable","on");
// !! L.50: Matlab function findobj not yet converted, original calling sequence used
// L.50: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","stat_popup");
// !! L.51: Matlab function set not yet converted, original calling sequence used
// L.51: Name conflict: function name changed from set to %set
set(h,"Visible","on");
// !! L.52: Matlab function findobj not yet converted, original calling sequence used
// L.52: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","acceleration_method");
// !! L.53: Matlab function set not yet converted, original calling sequence used
// L.53: Name conflict: function name changed from set to %set
set(h,"Visible","on");

// Disable KiKSnet GUI stuff
// !! L.56: Matlab function findobj not yet converted, original calling sequence used
// L.56: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","text_time_mode");
// !! L.57: Matlab function set not yet converted, original calling sequence used
// L.57: Name conflict: function name changed from set to %set
set(h,"Visible","on");
// !! L.58: Matlab function findobj not yet converted, original calling sequence used
// L.58: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","text_time_acceleration_method");
// !! L.59: Matlab function set not yet converted, original calling sequence used
// L.59: Name conflict: function name changed from set to %set
set(h,"String","time acceleration method");
// !! L.60: Matlab function findobj not yet converted, original calling sequence used
// L.60: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","text_movement_limit");
// !! L.61: Matlab function set not yet converted, original calling sequence used
// L.61: Name conflict: function name changed from set to %set
set(h,"String","movement limit");
// !! L.62: Matlab function findobj not yet converted, original calling sequence used
// L.62: Name conflict: function name changed from findobj to %findobj
h = findobj("Tag","text_interpolation_limit");
// !! L.63: Matlab function set not yet converted, original calling sequence used
// L.63: Name conflict: function name changed from set to %set
set(h,"Visible","on");

// !! L.65: Matlab function findobj not yet converted, original calling sequence used
// L.65: Name conflict: function name changed from findobj to %findobj
h = findobj(tmp] = size(mtlb_double(h));
for i = 1:gui_objs
  // !! L.68: Matlab function get not yet converted, original calling sequence used
  // L.68: Name conflict: function name changed from get to %get
  tag = get(mtlb_e(h,i),"Tag");
  // !! L.69: Matlab function strncmp not yet converted, original calling sequence used

  if strncmp(tag,"t_kiksnet_",10) then
    // !! L.70: Matlab function set not yet converted, original calling sequence used
    // L.70: Name conflict: function name changed from set to %set
    set(mtlb_e(h,i),"Visible","off");
  end;
end;
// !! L.73: Matlab function findobj not yet converted, original calling sequence used
// L.73: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","t_kiksnet_text_ping");
// !! L.74: Matlab function set not yet converted, original calling sequence used
// L.74: Name conflict: function name changed from set to %set
set(h,"String","?");

kiks_delete_remote;
KIKS_FID = -1;
if isempty(KIKS_RBTARRAY) then
  // !! L.79: Unknown function kiks_spawn_robot not converted, original calling sequence used
  kiks_spawn_robot;
end;
endfunction
