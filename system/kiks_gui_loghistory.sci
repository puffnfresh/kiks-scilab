function [] = kiks_gui_loghistory()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_HISTORY_HDL","KIKS_GUI_HDL","KIKS_LOG_HISTORY","KIKS_STATUS_BUFFER","KIKS_STATUS_BUFFER_CNT")

valid_handle = %F;
if ~isempty(KIKS_HISTORY_HDL) then
  try
    close(KIKS_HISTORY_HDL);
    valid_handle = %T;
  end;
end;

if ~valid_handle then
// !! L.14: Matlab function figure not yet converted
  // !! L.14: Matlab function figure not yet converted, original calling sequence used
  h = figure("Visible","off","PaperUnits","points","CloseRequestFcn","kiks_gui_loghistory","Name","KiKS log history","ToolBar","none","KeypressFcn","kiks_matlab_focus","Resize","on","ResizeFcn","p=get(gcf,''Position''); h=findobj(gcf,''tag'',''loghistory''); lp=get(h,''position''); lp(3:4)=p(3:4); set(h,''position'',lp);","Menu","none","NumberTitle","off");
  // !! L.15: Matlab function set not yet converted, original calling sequence used
  // L.15: Name conflict: function name changed from set to %set
  set(h,"Name","KiKS log history");
  // !! L.16: Matlab function get not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from get to %get
  p = get(h,"Position");
  xs = 640;
  ys = 460;
  p = mtlb_i(p,1,mtlb_a(mtlb_double(mtlb_e(p,1)),mtlb_s(mtlb_double(mtlb_e(p,3)),xs)/2));
  p = mtlb_i(p,2,mtlb_a(mtlb_double(mtlb_e(p,2)),mtlb_s(mtlb_double(mtlb_e(p,4)),ys)/2));
  p = mtlb_i(p,3,xs);
  p = mtlb_i(p,4,ys);
  // !! L.23: Matlab function set not yet converted, original calling sequence used
  // L.23: Name conflict: function name changed from set to %set
  set(h,"Position",p);

  // !! L.36: Unknown function mtlb_double not converted, original calling sequence used
  // !! L.36: Unknown function mtlb_double not converted, original calling sequence used
  // !! L.36: Unknown function mtlb_s not converted, original calling sequence used
  // !! L.36: Unknown function mtlb_a not converted, original calling sequence used
  // !! L.36: Unknown function mtlb_double not converted, original calling sequence used
  // !! L.36: Unknown function mtlb_imp not converted, original calling sequence used
  // !! L.36: Matlab function uicontrol not yet converted, original calling sequence used
  try
    logtext = strcat(mtlb_e(KIKS_STATUS_BUFFER,mtlb_imp(mtlb_a(mtlb_s(mtlb_double(KIKS_LOG_HISTORY),mtlb_double(KIKS_STATUS_BUFFER_CNT)),1),mtlb_double(KIKS_LOG_HISTORY))), '|');
  catch
    logtext = '';
  end;

  h1 = uicontrol("Parent",h,"BackgroundColor",[1,1,1],"Units","pixels","FontUnits","points","FontName","Courier New","FontSize",9,"FontWeight","normal","HorizontalAlignment","left","Position",[0,0,xs,ys],"Style","listbox","String",logtext,"Tag","loghistory");
  set(h1,"value",KIKS_STATUS_BUFFER_CNT);

  KIKS_HISTORY_HDL = h;
  // !! L.39: Matlab function findobj not yet converted, original calling sequence used
  // L.39: Name conflict: function name changed from findobj to %findobj
  s = findobj("tag","togglelog");
  // !! L.40: Matlab function set not yet converted, original calling sequence used
  // L.40: Name conflict: function name changed from set to %set
  set(s,"string","close log history");
  // !! L.41: Matlab function set not yet converted, original calling sequence used
  // L.41: Name conflict: function name changed from set to %set
  set(KIKS_HISTORY_HDL,"Visible","on");
else
  //close(KIKS_HISTORY_HDL);
  KIKS_HISTORY_HDL = [];
  // !! L.45: Matlab function findobj not yet converted, original calling sequence used
  // L.45: Name conflict: function name changed from findobj to %findobj
  s = findobj("tag","togglelog");
  // !! L.46: Matlab function set not yet converted, original calling sequence used
  // L.46: Name conflict: function name changed from set to %set
  set(s,"string","view log history");
end;
endfunction
