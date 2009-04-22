function [] = KproximityG(ref,action)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KPROXIMITYG   Display the value of the proximity sensors of Khepera
// 
//kProximityG(ref)
//  Display the value of the proximity sensors as an histogram
//   Use the """"Start"""" and """"Stop"""" buttons to control 
//   the animation.                                
//  Use the communication parameters specified with kcmd.
// 
// Written by Skye Legon, 2/99.
//            Yves Piguet, 8/98.
// parts copyright (c) 1998/99 K-Team SA

//   Adapted from Demo by Ned Gulley, 6-21-93; jae Roh, 10-15-96
// parts Copyright (c) 1984-96 by The MathWorks, Inc.
//   $Revision: 5.7 $  $Date: 1996/10/16 21:47:48 $

// Possible actions:
// initialize
// close

// Information regarding the play status will be held in
// the Userdata of the start button handle (which is stored in 
// the figure Userdata) according to the following table:
// (can''t use axis Userdata as it gets clobbered by the bar command)
play = 1;
stop = -1;

maxValue = 1024;// maximum value of a sensor

// !! L.31: Matlab function sprintf not yet converted, original calling sequence used
refstring = sprintf("[%f %f %f %f]",ref);

if %nargin<2 then
  action = "initialize";
end;

if mtlb_strcmp(action,"initialize") then
  // !! L.38: Matlab function watchon not yet converted
  oldFigNumber = mtlb(watchon);




  // !! L.43: Matlab function figure not yet converted, original calling sequence used
  figNumber = figure("Name","Khepera Proximity Sensors (c) K-Team SA 1999","NumberTitle","off","Visible","off");
  mtlb_colordef(figNumber,"black")



  // !! L.48: Matlab function axes not yet converted, original calling sequence used
  axes("Units","normalized","Position",[0.07,0.1,0.75,0.85],"Visible","off");


  // !! L.51: Matlab function text not yet converted, original calling sequence used
  text(0,0,"Press the ""Start"" button to begin","HorizontalAlignment","center");
  set(gca(),"data_bounds",matrix([-1,1,-1,1],2,-1));

  mtlb_eval("set(gcf, ''doublebuffer'', ''on'')","");
  // unsupported feature of Matlab 5.2 to suppress flashing
  // eval is used to avoid fatal errors with previous versions

  //===================================
  // Information for all buttons
  labelColor = [0.8,0.8,0.8];
  yInitPos = 0.9;
  xPos = 0.85;
  btnLen = 0.1;
  btnWid = 0.1;
  btnHt = 0.1;
  // Spacing between the button and the next command''s label
  spacing = 0.05;

  //====================================
  // The CONSOLE frame
  frmBorder = 0.02;
  yPos = 0.05-frmBorder;
  frmPos = [xPos-frmBorder,yPos,btnLen+2*frmBorder,0.9+2*frmBorder];




  // !! L.78: Matlab function uicontrol not yet converted, original calling sequence used
  h = uicontrol("Style","frame","Units","normalized","Position",frmPos,"BackgroundColor",[0.5,0.5,0.5]);

  //====================================
  // The START button
  btnNumber = 1;
  yPos = 0.9-(btnNumber-1)*(btnWid+spacing);
  labelStr = "Start";
  cmdStr = "start";
  callbackStr = "kProximityG("+refstring+",''start'');";

  // Generic button information
  btnPos = [xPos,yPos-spacing,btnLen,btnWid];







  // !! L.97: Matlab function uicontrol not yet converted, original calling sequence used
  startHndl = uicontrol("Style","pushbutton","Units","normalized","Position",btnPos,"String",labelStr,"Interruptible","on","Userdata",stop,"Callback",callbackStr);
  //====================================
  // The MODE popup button
  btnNumber = 2;
  yPos = 0.9-(btnNumber-1)*(btnHt+spacing);
  textStr = "Style";
  // !! L.103: WARNING: Matlab reshape() suppresses singleton higher dimension, it is not the case for matrix...
  popupStr = mtlb_t(matrix(mstr2sci(" hist  polar"),6,2));

  // Generic button information
  btnPos1 = [xPos,yPos-spacing+btnHt/2,btnWid,btnHt/2];
  btnPos2 = [xPos,yPos-spacing,btnWid,btnHt/2];




  // !! L.112: Matlab function uicontrol not yet converted, original calling sequence used
  popupHndl = uicontrol("Style","text","Units","normalized","Position",btnPos1,"String",textStr);
  btnPos = [xPos,yPos-spacing,btnWid,btnHt/2];




  // !! L.118: Matlab function uicontrol not yet converted, original calling sequence used
  popupHndl = uicontrol("Style","popup","Units","normalized","Position",btnPos2,"String",popupStr);

  //====================================
  // The STOP button
  btnNumber = 3;
  yPos = 0.9-(btnNumber-1)*(btnHt+spacing);
  labelStr = "Stop";
  // Setting userdata to -1 (=stop) will stop the demo.
  //callbackStr=''set(gca,''''Userdata'''',-1)'';
  callbackStr = "eval(''v=get(gcf,''''Userdata'''');set(v(1),''''Userdata'''',-1);'')";

  // Generic  button information
  btnPos = [xPos,yPos-spacing,btnLen,btnWid];






  // !! L.137: Matlab function uicontrol not yet converted, original calling sequence used
  stopHndl = uicontrol("Style","pushbutton","Units","normalized","Position",btnPos,"Enable","off","String",labelStr,"Callback",callbackStr);

  //====================================
  // The INFO button
  labelStr = "Info";
  callbackStr = "kProximityG("+refstring+",''info'');";





  // !! L.148: Matlab function uicontrol not yet converted, original calling sequence used
  infoHndl = uicontrol("Style","push","Units","normalized","position",[xPos,0.2,btnLen,0.1],"string",labelStr,"call",callbackStr);

  //====================================
  // The CLOSE button
  labelStr = "Close";
  callbackStr = "close(gcf)";





  // !! L.159: Matlab function uicontrol not yet converted, original calling sequence used
  closeHndl = uicontrol("Style","push","Units","normalized","position",[xPos,0.05,btnLen,0.1],"string",labelStr,"call",callbackStr);

  // Uncover the figure
  hndlList = [startHndl,popupHndl,stopHndl,infoHndl,closeHndl];

  // !! L.164: Matlab function set not yet converted, original calling sequence used
  // L.164: Name conflict: function name changed from set to %set
  %set(figNumber,"Visible","on","UserData",hndlList);

  // !! L.166: Matlab function watchoff not yet converted, original calling sequence used
  watchoff(oldFigNumber);
  // !! L.167: Matlab function figure not yet converted, original calling sequence used
  figure(figNumber);

elseif mtlb_strcmp(action,"start") then
  // !! L.170: Matlab function gcf not yet converted
  figNumber = mtlb(gcf);
  // !! L.171: Matlab function get not yet converted, original calling sequence used
  // L.171: Name conflict: function name changed from get to %get
  hndlList = %get(figNumber,"UserData");
  startHndl = mtlb_e(hndlList,1);
  popupHndl = mtlb_e(hndlList,2);
  stopHndl = mtlb_e(hndlList,3);
  infoHndl = mtlb_e(hndlList,4);
  closeHndl = mtlb_e(hndlList,5);
  // !! L.177: Matlab function set not yet converted, original calling sequence used
  // L.177: Name conflict: function name changed from set to %set
  %set(startHndl,"Userdata",play);
  // !! L.178: Matlab function set not yet converted, original calling sequence used
  // L.178: Name conflict: function name changed from set to %set
  %set([startHndl,closeHndl,infoHndl],"Enable","off");
  // !! L.179: Matlab function set not yet converted, original calling sequence used
  // L.179: Name conflict: function name changed from set to %set
  %set(stopHndl,"Enable","on");
  // !! L.180: Matlab function set not yet converted, original calling sequence used
  // L.180: Name conflict: function name changed from set to %set
  %set(figNumber,"Backingstore","off");

  // ====== Start of Demo

  sensorOrder = [8,1:7];  // back left sensor displayed first
  sensorAngles = (%pi/180)*[180,135,100,80,45,0,260,280];

  // The main loop

  style = 0;  // initialize to impossible value to force plot setup
  sensors = kProximity(ref);
  sensors = mtlb_e(sensors,sensorOrder);

  while %t // !! L.193: Matlab function get not yet converted, original calling sequence used
   // L.193: Name conflict: function name changed from get to %get
   if mtlb_logic(mtlb_double(%get(startHndl,"Userdata")),"==",play) then break;end;
   // initialize plots if we''re just starting, or if we change modes
   // !! L.195: Matlab function get not yet converted, original calling sequence used
   // L.195: Name conflict: function name changed from get to %get
  
   if mtlb_logic(style,"~=",mtlb_double(%get(popupHndl,"Value"))) then
     // !! L.196: Matlab function get not yet converted, original calling sequence used
     // L.196: Name conflict: function name changed from get to %get
     style = %get(popupHndl,"Value");
     if mtlb_logic(mtlb_double(style),"==",1) then // hist
      bar(mtlb_e(sensors,sensorOrder));
      barHndl = gce();
      // ! L.199: mtlb(barHndl) can be replaced by barHndl() or barHndl whether barHndl is an M-file or not
      // !! L.199: Matlab function set not yet converted, original calling sequence used
      // L.199: Name conflict: function name changed from set to %set
      %set(mtlb(barHndl),"EraseMode","background")
      // ! L.200: mtlb(barHndl) can be replaced by barHndl() or barHndl whether barHndl is an M-file or not
      // !! L.200: Matlab function get not yet converted, original calling sequence used
      // L.200: Name conflict: function name changed from get to %get
      vertices = %get(mtlb(barHndl),"Vertices");
      // ! L.201: mtlb(barHndl) can be replaced by barHndl() or barHndl whether barHndl is an M-file or not
      // !! L.201: Matlab function get not yet converted, original calling sequence used
      // L.201: Name conflict: function name changed from get to %get
      faces = %get(mtlb(barHndl),"Faces");
      set(gca(),"data_bounds",matrix([0.5,8.5,0,maxValue+6],2,-1)); // 1024 + 6 = 1030
     else // polar
      // simplified polar routine with fixed max radius 
      rmax = maxValue;
      sensors = mtlb_i(sensors,mtlb_find(bool2s(mtlb_logic(mtlb_double(sensors),"<",50))),50); // set lower bound
      r = mtlb_t(sensors);
      theta = sensorAngles(sensorOrder);
      [dmy,ix] = mtlb_sort(theta);
      theta = mtlb_a(theta(ix) .*. [1,1],mtlb_double(ones(1,max(size(ix))) .*. [-0.03,0.03]));
      // draw circle
      phi = %pi*(0:0.05:2);
      plot(rmax*cos(phi),rmax*sin(phi));
      r = mtlb_double(mtlb_e(r,ix)) .*. [1,1];
      // !! L.215: Matlab function fill not yet converted, original calling sequence used
      polarHndl = fill(r .*cos(theta),r .*sin(theta),"g");
      // !! L.216: Matlab function set not yet converted, original calling sequence used
      // L.216: Name conflict: function name changed from set to %set
      %set(polarHndl,"EraseMode","background");
      set(gca(),"isoview","on");
      set(gca(),"data_bounds",matrix((rmax+6)*[-1,1,-1,1],2,-1)); // 1024 + 6 = 1030
      // L.219: Drawing events are not queued in Scilab
      //drawnow
     end;
   end;
  
   sensors = kProximity(ref);
   sensors = mtlb_e(sensors,sensorOrder);
  
   if mtlb_logic(mtlb_double(style),"==",1) then // hist
    for i = 1:max(size(mtlb_double(sensors)))
      vertices(faces(i,2:3),2) = mtlb_e(sensors,i);
    end;
    // ! L.230: mtlb(barHndl) can be replaced by barHndl() or barHndl whether barHndl is an M-file or not
    // !! L.230: Matlab function set not yet converted, original calling sequence used
    // L.230: Name conflict: function name changed from set to %set
    %set(mtlb(barHndl),"Vertices",vertices);
   else // polar
    sensors = mtlb_i(sensors,mtlb_find(bool2s(mtlb_logic(mtlb_double(sensors),"<",50))),50); // set lower bound
    r = mtlb_t(sensors);
    r = mtlb_double(mtlb_e(r,ix)) .*. [1,1];
    vertices = [r .*cos(theta);r .*sin(theta)]';
    // !! L.236: Matlab function set not yet converted, original calling sequence used
    // L.236: Name conflict: function name changed from set to %set
    %set(polarHndl,"Vertices",vertices);
   end;
   // L.238: Drawing events are not queued in Scilab
   //drawnow
  end;  // Main loop ...

  // ====== End of Demo
  // !! L.242: Matlab function set not yet converted, original calling sequence used
  // L.242: Name conflict: function name changed from set to %set
  %set([startHndl,closeHndl,infoHndl],"Enable","on");
  // !! L.243: Matlab function set not yet converted, original calling sequence used
  // L.243: Name conflict: function name changed from set to %set
  %set(stopHndl,"Enable","off");

elseif mtlb_strcmp(action,"info") then






  // !! L.252: Matlab function strvcat not yet converted, original calling sequence used
  helptext = strvcat("Program for graphical display of Khepera proximity sensors."," ","Authors: Skye Legon, 2/99","         Yves Piguet, 8/98"," ","Copyright 1999 K-Team SA");
  help(helptext,"Khepera Information");

end;// if strcmp(action, ...
endfunction
