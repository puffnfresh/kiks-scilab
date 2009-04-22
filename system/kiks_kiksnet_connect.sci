function [fid] = kiksnet_connect() 

// Ouput variables initialisation (not found in input variables)
fid=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------

global("KIKS_KIKSNET_PROTOCOL_VERSION","KIKS_KIKSNET_MONITORING","KIKS_KIKSNET_COMMAND","KIKS_GUI_HDL","KIKS_BALLDATA","KIKS_BALLARRAY","KIKS_LIGHTARRAY","KIKS_RBTARRAY","KIKS_GUI_STATUS","KIKS_NET_PASSWORD","KIKS_FID","KIKS_NET_BUFSIZ","KIKS_ARENA_MASK_ORIG","KIKS_ARENA_COLORMASK_ORIG");

KIKS_KIKSNET_COMMAND = "";
// !! L.11: Matlab function findobj not yet converted, original calling sequence used
// L.11: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"tag","kiksnet_edit");
// !! L.12: Matlab function get not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from get to %get
// !! L.12: Matlab function deblank not yet converted, original calling sequence used
server = deblank(%get(h,"string"));
port = [];
if isempty(server) then
  server = "localhost:20002";
end;
colonPos = mtlb_find(bool2s(mtlb_logic(mtlb_double(server),"==",asciimat(":"))));
if ~isempty(colonPos) then
  // !! L.19: Matlab function sscanf not yet converted, original calling sequence used
  port = sscanf(mtlb_e(server,mtlb_imp(mtlb_a(colonPos,1),$)),"%d");
  server = mtlb_e(server,mtlb_imp(1,mtlb_s(colonPos,1)));
end;
if isempty(port) then port = 20002;end;
if mtlb_strcmp(server,"127.0.0.1") then
  server = "localhost";
end;

if mtlb_logic(mtlb_double(KIKS_FID),">",0) then // !! L.27: Unknown function kiks_kiksnet_disconnect not converted, original calling sequence used
 kiks_kiksnet_disconnect;end;
// !! L.28: Unknown function kiks_status not converted, original calling sequence used
kiks_status("<KiKSnet> connecting to server");

// delete robots
while size(mtlb_logic(mtlb_double(KIKS_RBTARRAY),">",0))
  // !! L.32: Unknown function kiks_delete_robot not converted, original calling sequence used
  kiks_delete_robot(mtlb_e(KIKS_RBTARRAY,1));
end;

// delete lights
//while size(KIKS_LIGHTARRAY>0)
//    kiks_delete_object(KIKS_LIGHTARRAY(1),1);
//end;
// delete balls
//while size(KIKS_BALLARRAY>0)
//    kiks_delete_object(KIKS_BALLARRAY(1),2+KIKS_BALLDATA(KIKS_BALLARRAY(1),5));
//end;

// !! L.44: Matlab function set not yet converted, original calling sequence used
// L.44: Name conflict: function name changed from set to %set
%set(KIKS_GUI_HDL,"name","KiKSnet");
// !! L.45: Matlab function findobj not yet converted, original calling sequence used
// L.45: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"type","uicontrol");
// !! L.46: Matlab function get not yet converted, original calling sequence used
// L.46: Name conflict: function name changed from get to %get
KIKS_GUI_STATUS = %get(H,"Visible");
// !! L.47: Matlab function findobj not yet converted, original calling sequence used
// L.47: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","pushbutton");
// !! L.48: Matlab function set not yet converted, original calling sequence used
// L.48: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.49: Matlab function findobj not yet converted, original calling sequence used
// L.49: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","edit");
// !! L.50: Matlab function set not yet converted, original calling sequence used
// L.50: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.51: Matlab function findobj not yet converted, original calling sequence used
// L.51: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","popupmenu");
// !! L.52: Matlab function set not yet converted, original calling sequence used
// L.52: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.53: Matlab function findobj not yet converted, original calling sequence used
// L.53: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","text");
// !! L.54: Matlab function set not yet converted, original calling sequence used
// L.54: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.55: Matlab function findobj not yet converted, original calling sequence used
// L.55: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","frame");
// !! L.56: Matlab function set not yet converted, original calling sequence used
// L.56: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.57: Matlab function findobj not yet converted, original calling sequence used
// L.57: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","checkbox");
// !! L.58: Matlab function set not yet converted, original calling sequence used
// L.58: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.59: Matlab function findobj not yet converted, original calling sequence used
// L.59: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"style","slider");
// !! L.60: Matlab function set not yet converted, original calling sequence used
// L.60: Name conflict: function name changed from set to %set
%set(H,"Visible","off");
// !! L.61: Matlab function findobj not yet converted, original calling sequence used
// L.61: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","kiksnet_server_btn");
// !! L.62: Matlab function set not yet converted, original calling sequence used
// L.62: Name conflict: function name changed from set to %set
%set(H,"String","disconnect");
// !! L.63: Matlab function set not yet converted, original calling sequence used
// L.63: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.64: Matlab function findobj not yet converted, original calling sequence used
// L.64: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","kiksnet_text");
// !! L.65: Matlab function set not yet converted, original calling sequence used
// L.65: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.66: Matlab function findobj not yet converted, original calling sequence used
// L.66: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","toggle2dvis");
// !! L.67: Matlab function set not yet converted, original calling sequence used
// L.67: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.68: Matlab function findobj not yet converted, original calling sequence used
// L.68: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","webbtn");
// !! L.69: Matlab function set not yet converted, original calling sequence used
// L.69: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.70: Matlab function findobj not yet converted, original calling sequence used
// L.70: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","licbtn");
// !! L.71: Matlab function set not yet converted, original calling sequence used
// L.71: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.72: Matlab function findobj not yet converted, original calling sequence used
// L.72: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","version");
// !! L.73: Matlab function set not yet converted, original calling sequence used
// L.73: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.74: Matlab function findobj not yet converted, original calling sequence used
// L.74: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","reginfo");
// !! L.75: Matlab function set not yet converted, original calling sequence used
// L.75: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.76: Matlab function findobj not yet converted, original calling sequence used
// L.76: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","status_dummy");
// !! L.77: Matlab function set not yet converted, original calling sequence used
// L.77: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.78: Matlab function findobj not yet converted, original calling sequence used
// L.78: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","togglelog");
// !! L.79: Matlab function set not yet converted, original calling sequence used
// L.79: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.80: Matlab function findobj not yet converted, original calling sequence used
// L.80: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","status");
// !! L.81: Matlab function set not yet converted, original calling sequence used
// L.81: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.82: Matlab function findobj not yet converted, original calling sequence used
// L.82: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","kiks_matlab_command");
// !! L.83: Matlab function set not yet converted, original calling sequence used
// L.83: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.84: Matlab function findobj not yet converted, original calling sequence used
// L.84: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","kiksnet_frame");
// !! L.85: Matlab function set not yet converted, original calling sequence used
// L.85: Name conflict: function name changed from set to %set
%set(H,"Position",[3,96,143,470]);
// !! L.86: Matlab function set not yet converted, original calling sequence used
// L.86: Name conflict: function name changed from set to %set
%set(H,"Visible","on");
// !! L.87: Matlab function findobj not yet converted, original calling sequence used
// L.87: Name conflict: function name changed from findobj to %findobj
H = %findobj(KIKS_GUI_HDL,"Tag","t_kiksnetserver_text_server");
// !! L.88: Matlab function set not yet converted, original calling sequence used
// L.88: Name conflict: function name changed from set to %set
%set(H,"string",server);
// !! L.89: Matlab function findobj not yet converted, original calling sequence used
// L.89: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL);
[gui_objs,tmp] = size(mtlb_double(h));
for i = 1:gui_objs
  // !! L.92: Matlab function get not yet converted, original calling sequence used
  // L.92: Name conflict: function name changed from get to %get
  tag = %get(mtlb_e(h,i),"Tag");
  // !! L.93: Matlab function strncmp not yet converted, original calling sequence used

  if strncmp(tag,"t_kiksnetserver_",16) then
    // !! L.94: Matlab function set not yet converted, original calling sequence used
    // L.94: Name conflict: function name changed from set to %set
    %set(mtlb_e(h,i),"Visible","on");
  end;
end;

// L.98: Drawing events are not queued in Scilab
//drawnow

//arena=kiks_compressmatrix(double(KIKS_ARENA_MASK_ORIG));
// ! L.101: mtlb(KIKS_ARENA_COLORMASK_ORI) can be replaced by KIKS_ARENA_COLORMASK_ORI() or KIKS_ARENA_COLORMASK_ORI whether KIKS_ARENA_COLORMASK_ORI is an M-file or not
colormask = kiks_compressmatrix(double(mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI))));

// !! L.103: Unknown function tcpip_open not converted, original calling sequence used
KIKS_FID = tcpip_open(server,port);
if bool2s(mtlb_logic(mtlb_double(KIKS_FID),"==",-1))&bool2s(mtlb_strcmp(server,"localhost")) then // start a local server if none is running
 try 
   if isempty(KIKS_NET_PASSWORD) then
     kiks_gui_kiksnet_passwor("Set administrator password");
   end;
   // !! L.109: Matlab function sprintf not yet converted, original calling sequence used
   [%v0_1$2,%v1_1$1] = dos(sprintf("%sKiKSnet\\kiksnet.exe %s &",kiks_getpath(),KIKS_NET_PASSWORD));
   tries = 0;
   while bool2s(mtlb_logic(mtlb_double(KIKS_FID),"==",-1))&bool2s(tries<10) // it might take a few seconds to start up KiKSnet.exe, so we try to connect for 10 seconds.
    // !! L.112: Unknown function tcpip_open not converted, original calling sequence used
    KIKS_FID = tcpip_open(server,port);
    tries = tries+1;
    if mtlb_logic(mtlb_double(KIKS_FID),"==",-1) then
      xpause(1000*1);
    end;
   end;
 catch 
   // !! L.119: Unknown function kiks_kiksnet_disconnect not converted, original calling sequence used
   kiks_kiksnet_disconnect;
   // !! L.120: Unknown function kiks_status not converted, original calling sequence used
   kiks_status("Error: couldn''t start kiksnet.exe");
   return;
 end;
end;

if mtlb_logic(mtlb_double(KIKS_FID),"==",-1) then
  // !! L.126: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.126: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("<KiKSnet> error: could not connect to KiKSnet server %s:%d",server,port));
else
  // ! L.128: mtlb(KIKS_KIKSNET_PROTOCOL_VE) can be replaced by KIKS_KIKSNET_PROTOCOL_VE() or KIKS_KIKSNET_PROTOCOL_VE whether KIKS_KIKSNET_PROTOCOL_VE is an M-file or not
  // !! L.128: Scilab uint8() does not work with Complex values: uint8() call IGNORED !
  // ! L.128: [0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0] may be replaced by:
  // !    --> uint8([0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0]) if [0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0] is real
  sendstr = [0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0];
  while %t // !! L.129: Unknown function tcpip_status not converted, original calling sequence used
   if bool2s(~isempty(sendstr))&bool2s(mtlb_logic(mtlb_double(tcpip_status(KIKS_FID)),"~=",0)) then break;end;
   // !! L.130: Unknown function tcpip_write not converted, original calling sequence used
   sendstr = tcpip_write(KIKS_FID,sendstr);
  end;
  // !! L.132: Unknown function kiks_recieve_string not converted, original calling sequence used
  res = kiks_recieve_string(KIKS_FID);
  if bool2s(mtlb_strcmp(res,"OK"))==0 then
    KIKS_FID = -1;
    // !! L.135: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("<KiKSnet> error: "+res);
  else
    vfk = "000000000";
    lic = -%inf;
  
    %v0_2 = getdate();  %v0_2(3:5) = [];  %v0_2(6) = %v0_2(6)+%v0_2(7)/1000;  t0 = %v0_2(1:6);
    if isempty(KIKS_NET_PASSWORD) then
      KIKS_NET_PASSWORD = "[empty_password]";
    end;
    // !! L.144: Matlab function sprintf not yet converted, original calling sequence used
    cde = sprintf("%s",KIKS_NET_PASSWORD);
    // !! L.145: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.145: Unknown function kiks_transmit_string not converted, original calling sequence used
    kiks_transmit_string(KIKS_FID,sprintf("%s %s %d",cde,vfk,lic));
    // !! L.146: Unknown function kiks_recieve_string not converted, original calling sequence used
    res = kiks_recieve_string(KIKS_FID);
  
    if ~mtlb_strcmp(res,"OK") then // oops, try connecting with a password
     // !! L.149: Unknown function tcpip_close not converted, original calling sequence used
     tcpip_close(KIKS_FID); // silent disconnection
     kiks_gui_kiksnet_passwor("Enter KiKSnet password");
     if isempty(KIKS_NET_PASSWORD) then
       KIKS_NET_PASSWORD = "[empty_password]";
     end;
     // !! L.154: Unknown function tcpip_open not converted, original calling sequence used
     KIKS_FID = tcpip_open(server,port); // reconnect
     // ! L.155: mtlb(KIKS_KIKSNET_PROTOCOL_VE) can be replaced by KIKS_KIKSNET_PROTOCOL_VE() or KIKS_KIKSNET_PROTOCOL_VE whether KIKS_KIKSNET_PROTOCOL_VE is an M-file or not
     // !! L.155: Scilab uint8() does not work with Complex values: uint8() call IGNORED !
     // ! L.155: [0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0] may be replaced by:
     // !    --> uint8([0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0]) if [0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0] is real
     sendstr = [0,mtlb(KIKS_KIKSNET_PROTOCOL_VE),0];
     while %t // !! L.156: Unknown function tcpip_status not converted, original calling sequence used
      if bool2s(~isempty(sendstr))&bool2s(mtlb_logic(mtlb_double(tcpip_status(KIKS_FID)),"~=",0)) then break;end;
      // !! L.157: Unknown function tcpip_write not converted, original calling sequence used
      sendstr = tcpip_write(KIKS_FID,sendstr);
     end;
     // !! L.159: Unknown function kiks_recieve_string not converted, original calling sequence used
     res = kiks_recieve_string(KIKS_FID);
    
     // !! L.161: Matlab function sprintf not yet converted, original calling sequence used
     cde = sprintf("%s",KIKS_NET_PASSWORD);
     // !! L.162: Matlab function sprintf not yet converted, original calling sequence used
     // !! L.162: Unknown function kiks_transmit_string not converted, original calling sequence used
     kiks_transmit_string(KIKS_FID,sprintf("%s %s %d",cde,vfk,lic));
     // !! L.163: Unknown function kiks_recieve_string not converted, original calling sequence used
     res = kiks_recieve_string(KIKS_FID);
    end;
  
    if mtlb_strcmp(res,"OK") then
      // OK, server accepted our serial number.
      // !! L.168: Unknown function kiks_status not converted, original calling sequence used
      kiks_status("<KiKSnet> setting up arena");
      // !! L.169: Unknown function kiks_transmit_var not converted, original calling sequence used
      kiks_transmit_var(KIKS_FID,colormask);
    
      // read arena and colormask from server
      // !! L.172: Unknown function kiks_recieve_var not converted, original calling sequence used
      compressed_colormask = kiks_recieve_var(KIKS_FID,"uint16","<KiKSnet> downloading arena...");
      colormask = kiks_expandmatrix(compressed_colormask);
      arena = mtlb_logic(colormask,">",0);
      KIKS_KIKSNET_MONITORING = 1;
      kiks_arena(arena,colormask,1);
    else
      // !! L.178: Unknown function kiks_status not converted, original calling sequence used
      kiks_status("<KiKSnet> error: "+res);
      // !! L.179: Unknown function kiks_kiksnet_disconnect not converted, original calling sequence used
      kiks_kiksnet_disconnect;
    end;
  end;
end;
fid = KIKS_FID;
endfunction
