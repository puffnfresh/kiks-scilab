function [] = kiks_gui_kiksnet_passwor(f)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_NET_PASSWORD");

// !! L.4: Matlab function findobj not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from findobj to %findobj
// !! L.4: Matlab function get not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from get to %get
KIKS_NET_PASSWORD = %get(%findobj(f,"tag","passwd"),"string");
if isempty(KIKS_NET_PASSWORD) then
  KIKS_NET_PASSWORD = "[empty_password]";
end;
mtlb_close(f);
endfunction
