function [res] = kiks_net_request(id)

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SPDC","KIKS_NET_BUFSIZ","KIKS_FID","KIKS_ROBOT_MATRIX","KIKS_MMPERPIXEL");

res = "";
if mtlb_logic(mtlb_double(KIKS_FID),">",-1) then
  // !! L.11: Matlab function sprintf not yet converted, original calling sequence used
  req = sprintf("R 1 %.3f %.3f %.3f %.3f %.3f %.3f %.3f",KIKS_ROBOT_MATRIX(id,1,1),KIKS_ROBOT_MATRIX(id,1,2),KIKS_ROBOT_MATRIX(id,1,3),mtlb_double(KIKS_ROBOT_MATRIX(id,6,7))*mtlb_double(KIKS_SPDC),mtlb_double(KIKS_ROBOT_MATRIX(id,6,8))*mtlb_double(KIKS_SPDC),KIKS_ROBOT_MATRIX(id,2,2),KIKS_ROBOT_MATRIX(id,2,1));
  // !! L.12: Unknown function kiks_transmit_string not converted, original calling sequence used
  kiks_transmit_string(KIKS_FID,req);
  // !! L.13: Unknown function kiks_recieve_string not converted, original calling sequence used
  res = kiks_recieve_string(KIKS_FID);
end;
endfunction
