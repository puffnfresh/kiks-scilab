function [str] = kiks_transmit_var(fid,var)

// Ouput variables initialisation (not found in input variables)
str=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2003 Theodor Storm (Theodor.Storm@home.se)
//  http://www.kiks.net
// -----------------------------------------------------


// !! L.8: Matlab function class not yet converted, original calling sequence used

if bool2s(mtlb_strcmp(class(var),"uint16"))~=1 then
  error("<KiKS> kiks_transmit_var: only UINT16 variables are supported.");
  return;
end;

[tmp,len] = size(mtlb_double(var));
t = len*2;
bytes = 0;
lenstr = mtlb_uint8([]);
while t>0
  bytes = bytes+1;
  // !! L.19: Matlab function bitshift not yet converted, original calling sequence used
  t_ = bitshift(t,-8);
  // !! L.20: Matlab function bitshift not yet converted, original calling sequence used
  rest = mtlb_s(t,mtlb_double(bitshift(t_,8)));
  lenstr = [lenstr,rest];
  t = t_;
end;
// !! L.24: Scilab uint8() does not work with Complex values: uint8() call IGNORED !
// ! L.24: [bytes,lenstr] may be replaced by:
// !    --> uint8([bytes,lenstr]) if [bytes,lenstr] is real
sendstr = [bytes,lenstr];
while %t // !! L.25: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(~isempty(sendstr))&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 // !! L.26: Unknown function tcpip_write not converted, original calling sequence used
 sendstr = tcpip_write(fid,sendstr);
end;
while %t // !! L.28: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(~isempty(var))&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 // !! L.29: Unknown function tcpip_write not converted, original calling sequence used
 var = tcpip_write(fid,var);
end;
endfunction
