function [] = kiks_kiksnet(password) 

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------
global("KIKS_GUI_KIKSNET_CLIENTS_CNT","KIKS_GUI_HDL","KIKS_MOVLOCK","KIKS_OBJECT_SMALLBALL_RADIUS","KIKS_OBJECT_BALL_RADIUS","KIKS_LIGHTDATA","KIKS_LIGHTARRAY","KIKS_BALLDATA","KIKS_BALLARRAY","KIKSNET_ACTIVE","KIKS_GUI_HDL","KIKS_REMOTE_ARRAY_NEW","KIKS_MMPERPIXEL","KIKS_NET_PASSWORD","KIKS_NET_BUFSIZ","KIKS_FID","KIKS_WALL_WIDTH","KIKS_WALL_RENDER");

if %nargin==1 then
  KIKS_NET_PASSWORD = password;
  if isempty(KIKS_NET_PASSWORD) then
    KIKS_NET_PASSWORD = "[empty_password]";
  end;
else
  KIKS_NET_PASSWORD = [];
end;

KIKS_NET_BUFSIZ = 4096;
KIKS_GUI_KIKSNET_CLIENTS = 0;

if ~isempty(KIKSNET_ACTIVE) then
  KIKSNET_ACTIVE = [];
  return;
end;

KIKSNET_ACTIVE = 1;

// !! L.28: Unknown function kiks_kiksnet_connect not converted, original calling sequence used
connection_result = kiks_kiksnet_connect();
if mtlb_logic(mtlb_double(connection_result),"==",-1) then
  // !! L.30: Unknown function kiks_kiksnet_disconnect not converted, original calling sequence used
  kiks_kiksnet_disconnect;
  return;
end;
%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;t0 = %v0(1:6);
l = 0;
seconds = 0;
// !! L.36: Unknown function kiks_status not converted, original calling sequence used
kiks_status("Session control transferred to KiKS.",1);

%v0_1(3:5) = [];%v13(3:5) = [];
while %t // !! L.38: Unknown function tcpip_status not converted, original calling sequence used
 if KIKSNET_ACTIVE&bool2s(mtlb_logic(mtlb_double(tcpip_status(KIKS_FID)),"~=",0)) then break;end;
 l = l+1;
 xpause(1000*0.04);
 %v0_1 = getdate(); %v0_1(6) = %v0_1(6)+%v0_1(7)/1000; current_seconds = round(etime(%v0_1(1:6),t0));
 %v13 = getdate(); %v13(6) = %v13(6)+%v13(7)/1000;
 if round(etime(%v13(1:6),t0))>seconds then
   fixed_l = l;
   l = 0;
   seconds = current_seconds;
   //kiks_status(sprintf(''- monitoring KiKSnet server for %d seconds @ %d updates per second -'',seconds,fixed_l));
 end;
 // !! L.48: Unknown function kiks_transmit_string not converted, original calling sequence used
 kiks_transmit_string(KIKS_FID,"G");
 // !! L.49: Unknown function kiks_recieve_string not converted, original calling sequence used
 res = kiks_recieve_string(KIKS_FID);

 // !! L.51: Matlab function sscanf not yet converted, original calling sequence used
 KIKS_REMOTE_ARRAY_NEW = sscanf(mtlb_e(res,4:$),"%f");
 // !! L.52: Unknown function kiks_update_remote not converted, original calling sequence used
 kiks_update_remote;
 objstr = "";

 if pmodulo(l,10)==0 then
   // !! L.56: Matlab function findobj not yet converted, original calling sequence used
   // L.56: Name conflict: function name changed from findobj to %findobj
   // !! L.56: Matlab function set not yet converted, original calling sequence used
   // L.56: Name conflict: function name changed from set to %set
   %set(%findobj(KIKS_GUI_HDL,"Tag","t_kiksnetserver_scrollup"),"Enable","on");
   // !! L.57: Matlab function findobj not yet converted, original calling sequence used
   // L.57: Name conflict: function name changed from findobj to %findobj
   // !! L.57: Matlab function set not yet converted, original calling sequence used
   // L.57: Name conflict: function name changed from set to %set
   %set(%findobj(KIKS_GUI_HDL,"Tag","t_kiksnetserver_scrolldown"),"Enable","on");
   // !! L.58: Unknown function kiks_transmit_string not converted, original calling sequence used
   kiks_transmit_string(KIKS_FID,"S");
   // !! L.59: Unknown function kiks_recieve_string not converted, original calling sequence used
   res = kiks_recieve_string(KIKS_FID);
   // !! L.60: Matlab function sscanf not yet converted, original calling sequence used
   num = sscanf(mtlb_e(res,3:$),"%d");
   // !! L.61: Matlab function findobj not yet converted, original calling sequence used
   // L.61: Name conflict: function name changed from findobj to %findobj
   h = %findobj(KIKS_GUI_HDL,"tag","t_kiksnetserver_text_clients");
   // !! L.62: Matlab function sprintf not yet converted, original calling sequence used
   // !! L.62: Matlab function set not yet converted, original calling sequence used
   // L.62: Name conflict: function name changed from set to %set
   %set(h,"string",sprintf("%d",num));
   if mtlb_logic(KIKS_GUI_KIKSNET_CLIENTS,">=",mtlb_double(num)) then
     KIKS_GUI_KIKSNET_CLIENTS = mtlb_s(mtlb_double(num),1);
   end;
   for i = mtlb_imp(1,mtlb_double(num))
     // !! L.67: Unknown function kiks_recieve_string not converted, original calling sequence used
     st = kiks_recieve_string(KIKS_FID);
     // L.68: No equivalent for findstr() in Scilab so mtlb_findstr() is called
     fields = mtlb_findstr(st,";");
     id = mtlb_e(st,1:fields(1)-1);
     ipfourbyte = evstr(mtlb_e(st,fields(1)+1:fields(2)-1));
     ip = kiks_fourbyte2ip(ipfourbyte);
     cde = mtlb_e(st,fields(2)+1:fields(3)-1);
     score = mtlb_e(st,fields(3)+1:fields(4)-1);
     fld = mtlb_s(i,KIKS_GUI_KIKSNET_CLIENTS);
     if bool2s(mtlb_logic(fld,">=",1))&bool2s(mtlb_logic(fld,"<=",4)) then
       kiks_gui_kiksnet_clients(fld,id,ip,cde,score);
     end;
   end;
   emptbeg = mtlb_a(mtlb_s(mtlb_double(num),KIKS_GUI_KIKSNET_CLIENTS),1);
   for i = mtlb_imp(emptbeg,4)
     kiks_gui_kiksnet_clients(i);
   end;
 end;
end;

// !! L.86: Unknown function kiks_status not converted, original calling sequence used
kiks_status("Session control returned to Matlab.",1);
%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;t1 = etime(%v0(1:6),t0);
// !! L.88: Unknown function kiks_kiksnet_disconnect not converted, original calling sequence used
kiks_kiksnet_disconnect;
endfunction
