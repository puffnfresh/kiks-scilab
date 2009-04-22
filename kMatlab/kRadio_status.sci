function [res] = kRadio_status(ref) 

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// [ready_to_send message_recieved send_failed]=kRadio_status(ref);
res = "";
reply = kTurret(ref,4,"F");
// !! L.6: Matlab function sscanf not yet converted, original calling sequence used
[value,count,errmsg] = sscanf(mtlb_e(reply,3:$),"%d");
if value then
  // !! L.8: Matlab function bitget not yet converted, original calling sequence used
  // !! L.8: Matlab function bitget not yet converted, original calling sequence used
  // !! L.8: Matlab function bitget not yet converted, original calling sequence used
  res = [bitget(value,1),bitget(value,2),bitget(value,3)];
end;
endfunction
