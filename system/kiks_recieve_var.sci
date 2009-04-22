function [res] = kiks_recieve_var(fid,%type,str)

// Ouput variables initialisation (not found in input variables)
res=[];

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

res = [];
bytes = [];
lenstr = [];

if %nargin<3 then
  str = "Reading from socket...";
end;

while %t // !! L.15: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(isempty(bytes))&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 // !! L.16: Unknown function tcpip_read not converted, original calling sequence used
 bytes = tcpip_read(fid,1,"uint8");
 if isempty(bytes) then
   xpause(1000*0.001);
 end;
end;
//bytes

recieved = 0;
while %t // !! L.24: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(mtlb_logic(recieved,"<",mtlb_double(bytes)))&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 // !! L.25: Unknown function tcpip_read not converted, original calling sequence used
 lenstr = [lenstr;tcpip_read(fid,mtlb_s(mtlb_double(bytes),recieved),"uint8")];
 [recieved,tmp] = size(mtlb_double(lenstr));
end;

msglen = 0;
for i = mtlb_imp(1,mtlb_double(bytes))
  // !! L.31: Matlab function bitshift not yet converted, original calling sequence used
  msglen = mtlb_a(msglen,mtlb_double(bitshift(mtlb_e(lenstr,i),8*(i-1))));
end;

ints = round(msglen/2);
recieved = 0;
last_percent = 0;
// !! L.37: Matlab function sprintf not yet converted, original calling sequence used
// !! L.37: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf("%s\n",str));
while %t // !! L.38: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(mtlb_logic(recieved,"<",ints))&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 percent = round((recieved/ints)*100);
 if mtlb_logic(percent,">",last_percent) then
   // !! L.41: Matlab function sprintf not yet converted, original calling sequence used
   // !! L.41: Unknown function kiks_status not converted, original calling sequence used
   kiks_status(sprintf("%s %d%%\n",str,percent));
   last_percent = percent;
 end;
 // !! L.44: Unknown function tcpip_read not converted, original calling sequence used
 rd = tcpip_read(fid,mtlb_s(ints,recieved),%type);
 res = [res;rd];
 [recieved,tmp] = size(mtlb_double(res));
 if max(size(mtlb_double(rd)))==0 then
   xpause(1000*0.001);
 end;
end;
// !! L.51: Matlab function sprintf not yet converted, original calling sequence used
// !! L.51: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf("%s %d bytes recieved.",str,recieved*2));
endfunction
