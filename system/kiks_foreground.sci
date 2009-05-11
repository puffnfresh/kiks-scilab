function [] = kiks_foreground()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_FOREGROUND","KIKS_PORT","KIKS_GUI_HDL")

// !! L.4: Matlab function findobj not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from findobj to %findobj
h = findobj("tag","toggle_foreground");

if KIKS_FOREGROUND then
  KIKS_FOREGROUND = [];
  return;
end;

KIKS_FOREGROUND = 1;
// !! L.12: Unknown function kiks_status not converted, original calling sequence used
kiks_status("Session control transferred to KiKS.",1);
// !! L.13: Matlab function set not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from set to %set
%set(h,"String","go passive");
// L.14: Drawing events are not queued in Scilab
//drawnow
try 
  while KIKS_FOREGROUND
    try 
      xpause(1000*0.05);
      if mtlb_logic(mtlb_double(mtlb_e(KIKS_PORT,1)),"==",1) then ref = [-1,-1,-1,-1]; // !! L.19: Unknown function kProximity not converted, original calling sequence used
       reflex = kProximity(ref); // !! L.19: Unknown function kAmbient not converted, original calling sequence used
       lights = kAmbient(ref);end;
      // L.20: Drawing events are not queued in Scilab
      //drawnow
    catch 
      // !! L.22: Matlab function lasterr not yet converted
      // !! L.22: Unknown function kiks_status not converted, original calling sequence used
      kiks_status("??? "+mtlb(lasterr));
    end;
  end;
  KIKS_FOREGROUND = [];
  // !! L.26: Unknown function kiks_status not converted, original calling sequence used
  kiks_status("Session control returned to Matlab.",1);
  // !! L.27: Matlab function set not yet converted, original calling sequence used
  // L.27: Name conflict: function name changed from set to %set
  %set(h,"String","go active");
catch 
end;
endfunction
