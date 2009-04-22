function [] = kiks_status(buffer,dual,replace)

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

global("KIKS_LOG_HISTORY","KIKS_HISTORY_HDL","KIKS_GUI_HDL","KIKS_STATUS_BUFFER","KIKS_STATUS_BUFFER_CNT");
if %nargin<2 then
  dual = [];
end;
if %nargin<3 then
  replace = [];
end;

// !! L.15: Matlab function sprintf not yet converted, original calling sequence used
// !! L.15: Matlab function sprintf not yet converted, original calling sequence used
buffer = mtlb_strrep(buffer,"\n\n","\n");
if max(size(buffer))<1 then
  return;
end;
if mtlb_logic(mtlb_double(mtlb_e(buffer,1)),"==",10) then
  buffer = mtlb_e(buffer,2:$);
end;
if mtlb_logic(mtlb_double(mtlb_e(buffer,$)),"~=",10) then
  // !! L.23: Matlab function sprintf not yet converted, original calling sequence used
  buffer = [buffer;sprintf("\n")];
end;
// !! L.25: Matlab function sprintf not yet converted, original calling sequence used
// L.25: No equivalent for findstr() in Scilab so mtlb_findstr() is called
strbuffer = "";
for i = 1:max(size(buffer))
  strbuffer = strbuffer + buffer(i);
end;

nostrs = mtlb_findstr(strbuffer, "\n");

if mtlb_logic(max(size(nostrs)),">=",mtlb_double(KIKS_LOG_HISTORY)) then
  // !! L.27: Unknown function kiks_status not converted, original calling sequence used
  kiks_status("<buffer too large for log window>");
  return;
end;

if isempty(KIKS_STATUS_BUFFER) then
  // ! L.32: mtlb(kiks_preferences) can be replaced by kiks_preferences() or kiks_preferences whether kiks_preferences is an M-file or not
  // !! L.32: Unknown function kiks_preferences not converted, original calling sequence used
  kiks_preferences();
  // ! L.33: real(KIKS_LOG_HISTORY) may be replaced by:
  // !    --> KIKS_LOG_HISTORY if KIKS_LOG_HISTORY is Real
  KIKS_STATUS_BUFFER = cell(real(KIKS_LOG_HISTORY),1);
  KIKS_STATUS_BUFFER_CNT = 0;
end;

if isempty(replace) then
  KIKS_STATUS_BUFFER = mtlb_i(KIKS_STATUS_BUFFER,mtlb_imp(1,mtlb_s(mtlb_double(KIKS_LOG_HISTORY),max(size(nostrs)))),mtlb_e(KIKS_STATUS_BUFFER,mtlb_imp(1+max(size(nostrs)),mtlb_double(KIKS_LOG_HISTORY))));
end;

while ~isempty(nostrs)
  str = mtlb_e(buffer,1:nostrs(1)-1);
  // !! L.43: Matlab function now not yet converted
  // !! L.43: Matlab function datestr not yet converted, original calling sequence used
  str = "["+datestr(mtlb(now),13)+"] "+str;
  buffer = mtlb_e(buffer,nostrs(1)+1:$);
  // !! L.45: Matlab function sprintf not yet converted, original calling sequence used
  // L.45: No equivalent for findstr() in Scilab so mtlb_findstr() is called
  nostrs = mtlb_findstr(buffer,sprintf("\n"));
  KIKS_STATUS_BUFFER = cell();  KIKS_STATUS_BUFFER(1,mtlb_s(mtlb_double(KIKS_LOG_HISTORY),max(size(nostrs)))) = makecell([1,1],str);
  if isempty(replace) then
    KIKS_STATUS_BUFFER_CNT = mtlb_min(mtlb_double(KIKS_LOG_HISTORY),mtlb_a(mtlb_double(KIKS_STATUS_BUFFER_CNT),1));
  end;
  if bool2s(isempty(KIKS_GUI_HDL))|bool2s(~isempty(dual)) then
    disp("<KiKS> "+str);
  end;
end;

if ~isempty(KIKS_GUI_HDL) then
  // !! L.55: Matlab function findobj not yet converted, original calling sequence used
  // L.55: Name conflict: function name changed from findobj to %findobj
  s = findobj("tag","status");
  
  // !! L.56: Matlab function set not yet converted, original calling sequence used
  // L.56: Name conflict: function name changed from set to %set
  set(s,"String",mtlb_e(KIKS_STATUS_BUFFER,KIKS_LOG_HISTORY));

  if ~isempty(KIKS_HISTORY_HDL) then
    // !! L.58: Matlab function findobj not yet converted, original calling sequence used
    // L.58: Name conflict: function name changed from findobj to %findobj
    s = findobj("tag","loghistory");
    // !! L.59: Matlab function set not yet converted, original calling sequence used
    // L.59: Name conflict: function name changed from set to %set
    if ~isempty(cell2mat(KIKS_STATUS_BUFFER)) then
      set(s,"String",mtlb_e(cell2mat(KIKS_STATUS_BUFFER),mtlb_imp(mtlb_s(mtlb_a(mtlb_double(KIKS_LOG_HISTORY),1),mtlb_double(KIKS_STATUS_BUFFER_CNT)),$)));
    end;
    // !! L.60: Matlab function set not yet converted, original calling sequence used
    // L.60: Name conflict: function name changed from set to %set
    set(s,"Value",KIKS_STATUS_BUFFER_CNT);
    // L.61: Drawing events are not queued in Scilab
    //drawnow
  end;
end;
endfunction
