function [] = kiks_gui_kiksnet_clients(pos,id,ip,cde,score)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_GUI_HDL");

if %nargin>1 then
  // !! L.5: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.5: Matlab function findobj not yet converted, original calling sequence used
  // L.5: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"tag",sprintf("t_kiksnetserver_clientstats_%d",pos));
  if ~isempty(H) then
    // !! L.7: Matlab function set not yet converted, original calling sequence used
    // L.7: Name conflict: function name changed from set to %set
    %set(H,"String",makecell([1,4],id,cde,ip,score));
    // !! L.8: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.8: Matlab function findobj not yet converted, original calling sequence used
    // L.8: Name conflict: function name changed from findobj to %findobj
    // !! L.8: Matlab function set not yet converted, original calling sequence used
    // L.8: Name conflict: function name changed from set to %set
    %set(%findobj(KIKS_GUI_HDL,"tag",sprintf("t_kiksnetserver_clientstats_%d_callsign",pos)),"String",cde);
  end;
else
  // !! L.11: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.11: Matlab function findobj not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from findobj to %findobj
  H = %findobj(KIKS_GUI_HDL,"tag",sprintf("t_kiksnetserver_clientstats_%d",pos));
  if ~isempty(H) then
    // !! L.13: Matlab function set not yet converted, original calling sequence used
    // L.13: Name conflict: function name changed from set to %set
    %set(H,"String",makecell([1,1],""));
    // !! L.14: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.14: Matlab function findobj not yet converted, original calling sequence used
    // L.14: Name conflict: function name changed from findobj to %findobj
    // !! L.14: Matlab function set not yet converted, original calling sequence used
    // L.14: Name conflict: function name changed from set to %set
    %set(%findobj(KIKS_GUI_HDL,"tag",sprintf("t_kiksnetserver_clientstats_%d_callsign",pos)),"String","");
  end;
end;
endfunction
