function [value] = kRadio_send(ref,recvId,buf,msglen) 

// Ouput variables initialisation (not found in input variables)
value=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

value = [];
if bool2s(mtlb_logic(mtlb_double(msglen),">",16))|bool2s(mtlb_logic(mtlb_double(msglen),"<",0)) then
  return;
end;
// !! L.7: Matlab function sprintf not yet converted, original calling sequence used
cmd = sprintf("S,%d,%d",recvId,msglen);
for i = mtlb_imp(1,mtlb_double(msglen))
  // !! L.9: Matlab function sprintf not yet converted, original calling sequence used
  cmd = [cmd,sprintf(",%d",mtlb_e(buf,i))];
end;
for i = mtlb_imp(1,mtlb_s(16,mtlb_double(msglen)))
  cmd = cmd+",0";
end;
value = kTurret(ref,4,cmd);
endfunction
