function [] = kiks_transmit_string(fid,str)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------

strlen = max(size(mtlb_double(str)));
t = strlen;
bytes = 0;
lenstr = "";
while t>0
  bytes = bytes+1;
  // !! L.13: Matlab function bitshift not yet converted, original calling sequence used
  t_ = bitshift(t,-8);
  // !! L.14: Matlab function bitshift not yet converted, original calling sequence used
  rest = mtlb_s(t,mtlb_double(bitshift(t_,8)));
  lenstr = lenstr+rest;
  t = t_;
end;
sendstr = bytes+lenstr+str;
while %t // !! L.19: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(~isempty(sendstr))&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 // !! L.20: Unknown function tcpip_write not converted, original calling sequence used
 sendstr = tcpip_write(fid,sendstr);
end;
endfunction
