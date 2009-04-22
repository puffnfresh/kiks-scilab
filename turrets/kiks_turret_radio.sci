function [response] = kiks_turret_radio(tcommand,targs) 

// Ouput variables initialisation (not found in input variables)
response=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
// Simulation of the K-team radio turret
global("KIKS_FID","KIKS_KIKSNET_REPLY");

if %nargin<2 then
  // return the turret id
  response = 4;
  return;
end;

select tcommand
  case "B" then // read version
 response = "b,1,0";
  case "F" then // read status
 status = 0;
 if ~isempty(KIKS_KIKSNET_REPLY) then
   // !! L.21: Matlab function sscanf not yet converted, original calling sequence used
   status = sscanf(KIKS_KIKSNET_REPLY,"%d");
 else
   if mtlb_logic(mtlb_double(KIKS_FID),"~=",-1) then
     disp("<KiKS warning> KiKSnet server did not reply to RADIO_STATUS command!");
   end;
 end;
 // !! L.27: Matlab function sprintf not yet converted, original calling sequence used
 response = sprintf("t,4,f,%d",status);
  case "R" then // read reception buffer
 message = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0";
 if ~isempty(KIKS_KIKSNET_REPLY) then
   message = KIKS_KIKSNET_REPLY;
 else
   if mtlb_logic(mtlb_double(KIKS_FID),"~=",-1) then
     disp("<KiKS warning> KiKSnet server did not reply to RADIO_READ command!");
   end;
 end;
 // !! L.37: Matlab function sprintf not yet converted, original calling sequence used
 response = sprintf("t,4,r,%s",message);
  case "S" then // send buffer - already handled by kiks_ksend.m
 response = "t,4,s";
 if bool2s(isempty(KIKS_KIKSNET_REPLY))&bool2s(mtlb_logic(mtlb_double(KIKS_FID),"~=",-1)) then
   disp("<KiKS warning> KiKSnet server did not reply to RADIO_SEND command!");
   response = "z,Protocol error";
 end;
  else
    response = "z,Protocol error";
end;
endfunction
