function [res] = kiks_server_request(id)

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------

global("KIKS_SPDC","KIKS_GUI_HDL","KIKS_KIKSNET_PING","KIKS_KIKSNET_PING_COUNT","KIKS_NET_BUFSIZ","KIKS_FID","KIKS_ROBOT_MATRIX","KIKS_MMPERPIXEL","KIKS_KIKSNET_COMMAND","KIKS_KIKSNET_REPLY");

res = "";
KIKS_KIKSNET_REPLY = "";
if ~isempty(KIKS_KIKSNET_COMMAND) then KIKS_KIKSNET_COMMAND = "CMD:"+KIKS_KIKSNET_COMMAND;end;
if mtlb_logic(mtlb_double(KIKS_FID),">",-1) then
  tic;
  // !! L.14: Matlab function sprintf not yet converted, original calling sequence used
  req = sprintf("R 1 %.3f %.3f %.3f %.3f %.3f %.3f %.3f %s",KIKS_ROBOT_MATRIX(id,1,1),KIKS_ROBOT_MATRIX(id,1,2),KIKS_ROBOT_MATRIX(id,1,3),mtlb_double(KIKS_ROBOT_MATRIX(id,6,7))*mtlb_double(KIKS_SPDC),mtlb_double(KIKS_ROBOT_MATRIX(id,6,8))*mtlb_double(KIKS_SPDC),KIKS_ROBOT_MATRIX(id,2,2),KIKS_ROBOT_MATRIX(id,2,1),KIKS_KIKSNET_COMMAND);
  // !! L.15: Unknown function kiks_transmit_string not converted, original calling sequence used
  kiks_transmit_string(KIKS_FID,req);
  res = kiks_recieve_string(KIKS_FID);
  if ~isempty(KIKS_KIKSNET_COMMAND) then
    // !! L.18: Matlab function deblank not yet converted, original calling sequence used
    KIKS_KIKSNET_REPLY = deblank(kiks_recieve_string(KIKS_FID));
  end;
  KIKS_KIKSNET_PING = mtlb_a(mtlb_double(KIKS_KIKSNET_PING),toc());  KIKS_KIKSNET_PING_COUNT = mtlb_a(mtlb_double(KIKS_KIKSNET_PING_COUNT),1);
  if bool2s(isempty(KIKS_KIKSNET_PING_COUNT))|bool2s(mtlb_logic(KIKS_KIKSNET_PING_COUNT,">",10)) then
    // !! L.22: Matlab function findobj not yet converted, original calling sequence used
    // L.22: Name conflict: function name changed from findobj to %findobj
    h = %findobj(KIKS_GUI_HDL,"tag","t_kiksnet_text_ping");
    if ~isempty(KIKS_KIKSNET_PING_COUNT) then
      t = floor((KIKS_KIKSNET_PING*1000)/KIKS_KIKSNET_PING_COUNT);
    else
      t = floor(KIKS_KIKSNET_PING*1000);
    end;
    if mtlb_logic(t,">=",10) then // !! L.28: Matlab function sprintf not yet converted, original calling sequence used
     // !! L.28: Matlab function set not yet converted, original calling sequence used
     // L.28: Name conflict: function name changed from set to %set
     %set(h,"String",sprintf("%d ms",t));else // !! L.28: Matlab function set not yet converted, original calling sequence used
     // L.28: Name conflict: function name changed from set to %set
     %set(h,"String","<10 ms");end;
    KIKS_KIKSNET_PING = 0;
    KIKS_KIKSNET_PING_COUNT = 0;
  end;
end;
KIKS_KIKSNET_COMMAND = "";
endfunction
