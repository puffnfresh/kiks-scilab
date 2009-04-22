function [fig] = kiks_gui_monitor()

// Ouput variables initialisation (not found in input variables)
fig=[];

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

// This is the machine-generated representation of a Handle Graphics object
// and its children.  Note that handle values may change when these objects
// are re-created. This may cause problems with any callbacks written to
// depend on the value of the handle at the time the object was saved.
// This problem is solved by saving the output as a FIG-file.
// 
// To reopen this object, just type the name of the M-file at the MATLAB
// prompt. The M-file and its associated MAT-file must be on your path.
// 
// NOTE: certain newer features in MATLAB may not have been saved in this
// M-file due to limitations of this format, which has been superseded by
// FIG-files.  Figures which have been annotated using the plot editor tools
// are incompatible with the M-file/MAT-file format, and should be saved as
// FIG-files.

loadmatfile("kiks_gui_monitor")

// !! L.35: Matlab function figure not yet converted
// ! L.35: mtlb(mat0) can be replaced by mat0() or mat0 whether mat0 is an M-file or not
// !! L.35: Matlab function figure not yet converted, original calling sequence used
h0 = figure("CloseRequestFcn","kiks_gui_monitorclsreq","Color",[0.8392156862745,0.8274509803922,0.7764705882353],"Colormap",mtlb(mat0),"FileName","C:\sandbox\kiks\system\kiks_gui_monitor.m","MenuBar","none","Name","Details","NumberTitle","off","PaperPosition",[18,180,576,432],"PaperUnits","points","Position",[156,170,151,249],"Tag","Fig2","ToolBar","none");

// !! L.42: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"ListboxTop",0,"Position",[7.5,120,95.25,60.75],"Style","frame","Tag","Frame1");

// ! L.70: mtlb(mat1) can be replaced by mat1() or mat1 whether mat1 is an M-file or not
// !! L.70: Matlab function axes not yet converted, original calling sequence used
h1 = axes("Parent",h0,"Units","pixels","AmbientLightColor",[0.8392156862745,0.8274509803922,0.7764705882353],"CameraUpVector",[0,-1,0],"CameraUpVectorMode","manual","CLim",[0,255],"CLimMode","manual","Color",[0.8392156862745,0.8274509803922,0.7764705882353],"ColorOrder",mtlb(mat1),"DataAspectRatioMode","manual","Layer","top","PlotBoxAspectRatio",[130,155,1],"PlotBoxAspectRatioMode","manual","Position",[10,2,130,155],"Tag","Axes1","TickDir","out","TickDirMode","manual","Visible","off","WarpToFill","off","WarpToFillMode","manual","XColor",[0,0,0],"XLim",[0.5,130.5],"XLimMode","manual","YColor",[0,0,0],"YDir","reverse","YLim",[0.5,155.5],"YLimMode","manual","ZColor",[0,0,0]);

// ! L.77: mtlb(mat2) can be replaced by mat2() or mat2 whether mat2 is an M-file or not
// ! L.77: mtlb(mat3) can be replaced by mat3() or mat3 whether mat3 is an M-file or not
// ! L.77: mtlb(mat4) can be replaced by mat4() or mat4 whether mat4 is an M-file or not
// !! L.77: Matlab function image not yet converted, original calling sequence used
h2 = image("Parent",h1,"BusyAction","cancel","CData",mtlb(mat2),"Interruptible","off","Tag","Axes1Image1","XData",mtlb(mat3),"YData",mtlb(mat4));

// !! L.87: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","center","Interpreter","none","Position",[64.996124031008,-6.6511627906976,1012.0087740598],"String","mon.tif","Tag","Axes1Text4","VerticalAlignment","bottom","Visible","off");
// !! L.88: Matlab function get not yet converted, original calling sequence used
// L.88: Name conflict: function name changed from get to %get
// !! L.88: Matlab function set not yet converted, original calling sequence used
// L.88: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"Title",h2);

// ! L.96: mtlb(mat5) can be replaced by mat5() or mat5 whether mat5 is an M-file or not
// !! L.96: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","center","Position",mtlb(mat5),"Tag","Axes1Text3","VerticalAlignment","cap","Visible","off");
// !! L.97: Matlab function get not yet converted, original calling sequence used
// L.97: Name conflict: function name changed from get to %get
// !! L.97: Matlab function set not yet converted, original calling sequence used
// L.97: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"XLabel",h2);

// !! L.106: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","center","Position",[-32.755813953488,79.007751937985,1012.0087740598],"Rotation",90,"Tag","Axes1Text2","VerticalAlignment","baseline","Visible","off");
// !! L.107: Matlab function get not yet converted, original calling sequence used
// L.107: Name conflict: function name changed from get to %get
// !! L.107: Matlab function set not yet converted, original calling sequence used
// L.107: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"YLabel",h2);

// !! L.113: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","Position",[140.57751937985,248.31007751938,1012.0087740598],"Tag","Axes1Text1","Visible","off");
// !! L.114: Matlab function get not yet converted, original calling sequence used
// L.114: Name conflict: function name changed from get to %get
// !! L.114: Matlab function set not yet converted, original calling sequence used
// L.114: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"ZLabel",h2);

// !! L.123: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[0,44.25,19.5,9.75],"String","0","Style","text","Tag","1");

// !! L.132: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[6,75,20.25,10.5],"String","0","Style","text","Tag","2");

// !! L.141: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[30.75,90,20.25,10.5],"String","0","Style","text","Tag","3");

// !! L.150: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[59.25,90,20.25,10.5],"String","0","Style","text","Tag","4");

// !! L.159: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[85.5,74.25,19.5,10.5],"String","0","Style","text","Tag","5");

// !! L.168: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[74.25,11.25,20.25,9.75],"String","0","Style","text","Tag","7");

// !! L.177: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[17.25,11.25,20.25,9.75],"String","0","Style","text","Tag","8");

// !! L.186: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[25,35,15,9.75],"String","0","Style","text","Tag","l");

// !! L.196: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[71,35,15,9.75],"String","0","Style","text","Tag","r","UserData","[ ]");

// !! L.205: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0,0,0],"ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[93,43.5,20.25,9.75],"String","0","Style","text","Tag","6");

// !! L.215: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0.0313725490196,0.1882352941176,0],"FontWeight","bold","ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[42.75,28.5,27,9.75],"String","00:00","Style","text","Tag","time");

// !! L.223: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[17.25,1.5,20.25,9.75],"String","0","Style","text","Tag","L8");

// !! L.231: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[74.25,1.5,20.25,9.75],"String","0","Style","text","Tag","L7");

// !! L.239: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[93,33.75,20.25,9.75],"String","0","Style","text","Tag","L6");

// !! L.247: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[85.5,64.5,19.5,9.75],"String","0","Style","text","Tag","L5");

// !! L.255: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[59.25,80.25,20.25,9.75],"String","0","Style","text","Tag","L4");

// !! L.263: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[30.75,80.25,20.25,9.75],"String","0","Style","text","Tag","L3");

// !! L.271: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[6,65.25,20.25,9.75],"String","0","Style","text","Tag","L2");

// !! L.279: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,0.5019607843137],"ListboxTop",0,"Position",[0,34.5,19.5,9.75],"String","0","Style","text","Tag","L1");

// !! L.289: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[0.0313725490196,0.1882352941176,0],"FontWeight","bold","ForegroundColor",[1,1,1],"ListboxTop",0,"Position",[43,44,26,10],"String","63°","Style","text","Tag","angle");

// ! L.309: mtlb(mat6) can be replaced by mat6() or mat6 whether mat6 is an M-file or not
// !! L.309: Matlab function axes not yet converted, original calling sequence used
h1 = axes("Parent",h0,"Units","pixels","FontUnits","pixels","CameraUpVector",[0,1,0],"CameraUpVectorMode","manual","Color",[1,1,1],"ColorOrder",mtlb(mat6),"FontSize",13.333333333333,"NextPlot","add","Position",[10,142,129,14],"Tag","Axes2","TickDir","out","TickDirMode","manual","Visible","off","XColor",[0,0,0],"XLim",[0,63],"XLimMode","manual","YColor",[0,0,0],"YLimMode","manual","ZColor",[0,0,0]);

// ! L.317: mtlb(mat7) can be replaced by mat7() or mat7 whether mat7 is an M-file or not
// !! L.317: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","center","Position",mtlb(mat7),"Tag","Axes2Text4","VerticalAlignment","cap","Visible","off");
// !! L.318: Matlab function get not yet converted, original calling sequence used
// L.318: Name conflict: function name changed from get to %get
// !! L.318: Matlab function set not yet converted, original calling sequence used
// L.318: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"XLabel",h2);

// !! L.327: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","center","Position",[-14.765625,0.3846153846154,9.1602540378444],"Rotation",90,"Tag","Axes2Text3","VerticalAlignment","baseline","Visible","off");
// !! L.328: Matlab function get not yet converted, original calling sequence used
// L.328: Name conflict: function name changed from get to %get
// !! L.328: Matlab function set not yet converted, original calling sequence used
// L.328: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"YLabel",h2);

// !! L.335: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","right","Position",[-4.921875,8.1538461538462,9.1602540378444],"Tag","Axes2Text2","Visible","off");
// !! L.336: Matlab function get not yet converted, original calling sequence used
// L.336: Name conflict: function name changed from get to %get
// !! L.336: Matlab function set not yet converted, original calling sequence used
// L.336: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"ZLabel",h2);

// !! L.343: Matlab function text not yet converted, original calling sequence used
h2 = text("Parent",h1,"Color",[0,0,0],"HandleVisibility","off","HorizontalAlignment","center","Position",[31.0078125,1.5384615384615,9.1602540378444],"Tag","Axes2Text1","VerticalAlignment","bottom");
// !! L.344: Matlab function get not yet converted, original calling sequence used
// L.344: Name conflict: function name changed from get to %get
// !! L.344: Matlab function set not yet converted, original calling sequence used
// L.344: Name conflict: function name changed from set to %set
set(get(h2,"Parent"),"Title",h2);

// ! L.351: mtlb(mat8) can be replaced by mat8() or mat8 whether mat8 is an M-file or not
// !! L.351: Matlab function image not yet converted, original calling sequence used
h2 = image("Parent",h1,"BusyAction","cancel","CData",mtlb(mat8),"Interruptible","off","Tag","Axes2Image1","XData",[1,64],"YData",[1,1]);

// !! L.360: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"FontWeight","bold","ListboxTop",0,"Position",[10,168,92,10],"String","distance travelled","Style","text","Tag","StaticText1");

// !! L.369: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"HorizontalAlignment","right","ListboxTop",0,"Position",[10,155,40,10],"String","forwards:","Style","text","Tag","StaticText1");

// !! L.378: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"HorizontalAlignment","right","ListboxTop",0,"Position",[10,145,40,10],"String","backwards:","Style","text","Tag","StaticText1");

// !! L.388: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"FontWeight","demi","HorizontalAlignment","right","ListboxTop",0,"Position",[10,135,40,10],"String","total:","Style","text","Tag","StaticText1");

// !! L.398: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"FontWeight","demi","HorizontalAlignment","right","ListboxTop",0,"Position",[10,125,40,10],"String","straight:","Style","text","Tag","StaticText1");

// !! L.407: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"HorizontalAlignment","left","ListboxTop",0,"Position",[53,155,45,10],"String","0 cm","Style","text","Tag","dist_fwd");

// !! L.416: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"HorizontalAlignment","left","ListboxTop",0,"Position",[53,145,45,10],"String","0 cm","Style","text","Tag","dist_bwd");

// !! L.426: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"FontWeight","demi","HorizontalAlignment","left","ListboxTop",0,"Position",[53,135,45,10],"String","0 cm","Style","text","Tag","dist_total");

// !! L.436: Matlab function uicontrol not yet converted, original calling sequence used
h1 = uicontrol("Parent",h0,"Units","points","BackgroundColor",[1,1,1],"FontWeight","demi","HorizontalAlignment","left","ListboxTop",0,"Position",[53,125,45,10],"String","0 cm","Style","text","Tag","dist_straight");

if %nargout>0 then fig = h0;end;
endfunction
