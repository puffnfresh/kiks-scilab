function [] = kiks_quit(silent)

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

global("KIKS_FOREGROUND","KIKS_REGCODE","KIKS_SESSIONACTIVE","KIKS_2DVISUALIZE","KiKS");
global("KIKS_GUI_HDL","KIKS_HISTORY_HDL","KIKS_ARENA_HDL","KIKS_MONITOR_WIN","KIKS_MONITOR_ON");

if %nargin<1 then
  silent = [];
end;

if KIKS_FOREGROUND then
  KIKS_FOREGROUND = [];
end;
try 
  [tmp,sz] = size(mtlb_double(KIKS_MONITOR_ON));
  for i = 1:sz
    if mtlb_e(KIKS_MONITOR_ON,i) then
      //mtlb_delete(mtlb_e(KIKS_MONITOR_WIN,i));
      close(mtlb_e(KIKS_MONITOR_WIN,i));
      KIKS_MONITOR_WIN(i) = [];
    end;
  end;
catch 
end;
try 
  // !! L.27: Unknown function kiks_server_disconnect not converted, original calling sequence used
  kiks_server_disconnect;
catch 
end;
KIKS_SESSIONACTIVE = [];
if bool2s(isempty(silent))&bool2s(bool2s(mtlb_strcmp(KIKS_REGCODE,"EVALUATION"))==1) then
  try  // !! L.32: Matlab function web not yet converted, original calling sequence used
   web("www.tstorm.seregister.php");catch  // !! L.32: Matlab function web not yet converted, original calling sequence used
   web("www.tstorm.seregister.php");end;
end;
// !! L.34: Matlab function findobj not yet converted, original calling sequence used
// L.34: Name conflict: function name changed from findobj to %findobj
a = findobj("name","KiKS");
// !! L.35: Matlab function findobj not yet converted, original calling sequence used
// L.35: Name conflict: function name changed from findobj to %findobj
b = findobj("name","KiKS log history");
// !! L.36: Matlab function findobj not yet converted, original calling sequence used
// L.36: Name conflict: function name changed from findobj to %findobj
c = findobj("name","KiKSnet");
clearglobal("KIKS_*");
clearglobal("KIKSNET_*");
//mtlb_delete(b);
close(b);
b = [];
//mtlb_delete(a);
close(a);
a = [];
//mtlb_delete(c);
close(c);
c = [];
endfunction
