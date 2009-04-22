function [res] = kiks_recieve_string(fid)

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

global("KIKS_NET_BUFSIZ");
res = [];
ok = 0;
while %t // !! L.10: Unknown function tcpip_status not converted, original calling sequence used
 if bool2s(ok~=1)&bool2s(mtlb_logic(mtlb_double(tcpip_status(fid)),"~=",0)) then break;end;
 // !! L.11: Unknown function tcpip_readln not converted, original calling sequence used
 [res,ok] = tcpip_readln(fid,KIKS_NET_BUFSIZ);
 if mtlb_logic(mtlb_double(ok),"~=",1) then
   xpause(1000*0.001);
 end;
end;
endfunction
