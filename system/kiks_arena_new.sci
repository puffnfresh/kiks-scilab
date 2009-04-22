function [] = kiks_arena_new()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_ARENA_DEFAULT_COLOR");

// !! L.4: Matlab function dialog not yet converted, original calling sequence used
h = dialog("Visible","off");

// !! L.6: Matlab function set not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from set to %set
%set(h,"Name","New arena");
// !! L.7: Matlab function get not yet converted, original calling sequence used
// L.7: Name conflict: function name changed from get to %get
p = %get(h,"Position");
xs = 300;
ys = 150;
p = mtlb_i(p,1,mtlb_a(mtlb_double(mtlb_e(p,1)),mtlb_s(mtlb_double(mtlb_e(p,3)),xs)/2));
p = mtlb_i(p,2,mtlb_a(mtlb_double(mtlb_e(p,2)),mtlb_s(mtlb_double(mtlb_e(p,4)),ys)/2));
p = mtlb_i(p,3,xs);
p = mtlb_i(p,4,ys);
// !! L.14: Matlab function set not yet converted, original calling sequence used
// L.14: Name conflict: function name changed from set to %set
%set(h,"Position",p);








// !! L.23: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","ListboxTop",0,"Position",[40,120,100,18],"HorizontalAlignment","right","String","width (in mm)","Style","text","Tag","StaticText");











// !! L.35: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"BackgroundColor",[1,1,1],"Units","pixels","FontUnits","points","FontName","Courier New","FontSize",9,"FontWeight","normal","HorizontalAlignment","left","Position",[150,120,100,20],"Style","edit","String","","Tag","width");








// !! L.44: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","ListboxTop",0,"Position",[40,90,100,18],"HorizontalAlignment","right","String","height (in mm)","Style","text","Tag","StaticText");











// !! L.56: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"BackgroundColor",[1,1,1],"Units","pixels","FontUnits","points","FontName","Courier New","FontSize",9,"FontWeight","normal","HorizontalAlignment","left","Position",[150,90,100,20],"Style","edit","String","","Tag","height");








// !! L.65: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"FontName","verdana","ListboxTop",0,"Position",[40,60,100,18],"HorizontalAlignment","right","String","wall color","Style","text","Tag","StaticText");











// !! L.77: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"BackgroundColor",[mtlb_double(KIKS_ARENA_DEFAULT_COLOR)/255,mtlb_double(KIKS_ARENA_DEFAULT_COLOR)/255,mtlb_double(KIKS_ARENA_DEFAULT_COLOR)/255],"Callback","v=get(gco,''Value''); set(gco,''BackgroundColor'',[v/255 v/255 v/255])","Enable","on","ListboxTop",0,"Max",255,"Min",1,"Position",[150,60,100,20],"Style","slider","Tag","color","Value",KIKS_ARENA_DEFAULT_COLOR,"Visible","on");









// !! L.87: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h,"Units","pixels","FontWeight","normal","HorizontalAlignment","left","Position",[100,30,100,20],"Style","checkbox","String","rounded corners","Tag","rounded");








// !! L.96: Matlab function uicontrol not yet converted, original calling sequence used
h3 = uicontrol("Parent",h,"Callback","kiks_arena_new_create;","Enable","on","ListboxTop",0,"Position",[5,5,71,20],"String","OK","Tag","btn_OK");







// !! L.104: Matlab function uicontrol not yet converted, original calling sequence used
h4 = uicontrol("Parent",h,"Callback","close(gcbf);","Enable","on","ListboxTop",0,"Position",[224,5,71,20],"String","Cancel","Tag","btn_cancel");

// !! L.106: Matlab function set not yet converted, original calling sequence used
// L.106: Name conflict: function name changed from set to %set
%set(h,"Visible","on");
endfunction
