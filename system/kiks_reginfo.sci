function [] = kiks_reginfo(edit)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_REGINFO_GUI");

reginfo = "";
cde = "";
lic = "";
vfk = "";
org = "";
name = "";
email = "";
licno = "1";
lictype = 1;
enabled = "on";
title = "Enter KiKS license data";
licno = 1;

// !! L.17: Matlab function which not yet converted, original calling sequence used
datapath = which("kiks_reginfo.mat");
if ~isempty(datapath) then
  if %nargin<1 then
    title = "KiKS license data";
    enabled = "off";
  end;
  loadmatfile(datapath);
  // ! L.24: At lest one operand is an empty matrix for operator: asciimat(lic)<0, result set to []

  if [] then
    lictype = 2;
    // !! L.26: Matlab function sprintf not yet converted, original calling sequence used
    licno = sprintf("%d",abs(asciimat(lic)));
  end;
  // ! L.28: At lest one operand is an empty matrix for operator: asciimat(lic)==0, result set to []

  if [] then
    lictype = 1;
    licno = "1";
  end;
  // ! L.32: At lest one operand is an empty matrix for operator: asciimat(lic)==%inf, result set to []

  if [] then
    lictype = 3;
    licno = "1";
  end;
end;

// !! L.38: Matlab function dialog not yet converted, original calling sequence used
h = dialog("Visible","off","PaperUnits","points");
// !! L.39: Matlab function set not yet converted, original calling sequence used
// L.39: Name conflict: function name changed from set to %set
%set(h,"Name",title);
// !! L.40: Matlab function get not yet converted, original calling sequence used
// L.40: Name conflict: function name changed from get to %get
p = %get(h,"Position");
xs = 360;
ys = 200;
p = mtlb_i(p,1,mtlb_a(mtlb_double(mtlb_e(p,1)),mtlb_s(mtlb_double(mtlb_e(p,3)),xs)/2));
p = mtlb_i(p,2,mtlb_a(mtlb_double(mtlb_e(p,2)),mtlb_s(mtlb_double(mtlb_e(p,4)),ys)/2));
p = mtlb_i(p,3,xs);
p = mtlb_i(p,4,ys);
// !! L.47: Matlab function set not yet converted, original calling sequence used
// L.47: Name conflict: function name changed from set to %set
%set(h,"Position",p);









// !! L.57: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","FontWeight","normal","ListboxTop",0,"Position",[1,170,160,16],"HorizontalAlignment","right","String","License type","Style","text","Tag","lictype_txt");









// !! L.67: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"Enable",enabled,"BackgroundColor",[1,1,1],"Callback","kiks_reginfo_lictypecallback;","ListboxTop",0,"Position",[164,172,150,18],"String",makecell([1,3],"Single user license","Multi-user license","Site license"),"Style","popupmenu","Tag","lictype","Value",lictype);











// !! L.79: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","FontWeight","normal","ListboxTop",0,"Position",[1,150,160,16],"HorizontalAlignment","right","String","Number of installations","Style","text","Enable",enabled,"Visible","off","Tag","licno_txt");
if lictype==2 then
  // !! L.81: Matlab function set not yet converted, original calling sequence used
  // L.81: Name conflict: function name changed from set to %set
  %set(h1,"Enable",enabled);
  // !! L.82: Matlab function set not yet converted, original calling sequence used
  // L.82: Name conflict: function name changed from set to %set
  %set(h1,"Visible","on");
end;











// !! L.95: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","BackgroundColor",[1,1,1],"HorizontalAlignment","left","ListboxTop",0,"Position",[164,150,150,18],"String",licno,"Style","edit","Tag","licno","Enable",enabled,"Visible","off","TooltipString","Number of licenses");
if lictype==2 then
  // !! L.97: Matlab function set not yet converted, original calling sequence used
  // L.97: Name conflict: function name changed from set to %set
  %set(h1,"Enable",enabled);
  // !! L.98: Matlab function set not yet converted, original calling sequence used
  // L.98: Name conflict: function name changed from set to %set
  %set(h1,"Visible","on");
end;









// !! L.109: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","FontWeight","normal","ListboxTop",0,"Position",[1,130,160,16],"HorizontalAlignment","right","String","License number","Style","text","Tag","cde_txt");










// !! L.120: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"Enable",enabled,"FontName","verdana","BackgroundColor",[1,1,1],"HorizontalAlignment","left","ListboxTop",0,"Position",[164,130,150,18],"String",cde,"Style","edit","Tag","cde","TooltipString","License number");









// !! L.130: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","FontWeight","normal","ListboxTop",0,"Position",[1,110,160,16],"HorizontalAlignment","right","String","Verification key","Style","text","Tag","vfk_txt");










// !! L.141: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"Enable",enabled,"FontName","verdana","BackgroundColor",[1,1,1],"HorizontalAlignment","left","ListboxTop",0,"Position",[164,110,150,18],"String",vfk,"Style","edit","Tag","vfk","TooltipString","Verification key");

if enabled=="on" then








  // !! L.152: Matlab function uicontrol not yet converted, original calling sequence used
  h1 = uicontrol("Parent",h,"FontName","verdana","FontWeight","normal","ListboxTop",0,"Position",[10,30,340,60],"HorizontalAlignment","left","String","Make sure you have entered all information correctly before saving. Your license will be verified when you connect to a KiKSnet server.","Style","text","Tag","info_txt");





  // !! L.158: Matlab function uicontrol not yet converted, original calling sequence used
  h1 = uicontrol("Parent",h,"Callback","kiks_reginfo_write;","ListboxTop",0,"Position",[10,10,100,20],"String","save license data","Tag","save license data");





  // !! L.164: Matlab function uicontrol not yet converted, original calling sequence used
  h1 = uicontrol("Parent",h,"Callback","close;","ListboxTop",0,"Position",[250,10,100,20],"String","close window","Tag","close window");
else





  // !! L.171: Matlab function uicontrol not yet converted, original calling sequence used
  h1 = uicontrol("Parent",h,"Callback","close;kiks_reginfo(1);","ListboxTop",0,"Position",[10,10,100,20],"String","edit license data","Tag","edit license data");





  // !! L.177: Matlab function uicontrol not yet converted, original calling sequence used
  h1 = uicontrol("Parent",h,"Callback","close;","ListboxTop",0,"Position",[250,10,100,20],"String","close window","Tag","close window");
end;

// !! L.180: Matlab function set not yet converted, original calling sequence used
// L.180: Name conflict: function name changed from set to %set
%set(h,"Visible","on");
endfunction
