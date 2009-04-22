function [] = kBraitenbergG(ref,ksp,action)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KPROXIMITYG   Display the value of the proximity sensors of Khepera
// 
//kProximityG(ref)
//  Display the value of the proximity sensors as an histogram or
//  polar plot
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
// info

// Information regarding the play status will be held in
// the axis user data according to the following table:

global("y");// save robot position as global

if isempty(y) then
  y = [0;0;0];
end;

play = 1;
stop = -1;

XAxis = [-200,200];
YAxis = [-200,200];

if %nargin<2 then
  ksp = 0.7;
end;

if %nargin<3 then
  action = "initialize";
end;

gain = [-5,-15,-18,6,4,4,3,5;4,4,6,-18,-15,-5,5,3]/400;
offset = 20*[1;1];

gain = gain*mtlb_double(ksp);
offset = offset*mtlb_double(ksp);

// put parameters in a string for callback

// !! L.55: Matlab function sprintf not yet converted, original calling sequence used
refstring = sprintf("[%f %f %f %f]",ref);
// !! L.56: Matlab function sprintf not yet converted, original calling sequence used
kspstring = sprintf("%f",ksp);

if mtlb_strcmp(action,"initialize") then
  // !! L.59: Matlab function watchon not yet converted
  oldFigNumber = mtlb(watchon);




  // !! L.64: Matlab function figure not yet converted, original calling sequence used
  figNumber = figure("Name","Khepera Braitenberg Simulation (c) K-Team SA 1999","NumberTitle","off","Visible","off");
  mtlb_colordef(figNumber,"black")



  // !! L.69: Matlab function axes not yet converted, original calling sequence used
  axes("Units","normalized","Position",[0.05,0.1,0.75,0.85],"Visible","off");


  // !! L.72: Matlab function text not yet converted, original calling sequence used
  text(0,0,"Press the ""Start"" button to see the Braitenberg demo","HorizontalAlignment","center");
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
  // Spacing between the button and the next command''s label
  spacing = 0.05;

  //====================================
  // The CONSOLE frame
  frmBorder = 0.02;
  yPos = 0.05-frmBorder;
  frmPos = [xPos-frmBorder,yPos,btnLen+2*frmBorder,0.9+2*frmBorder];




  // !! L.98: Matlab function uicontrol not yet converted, original calling sequence used
  h = uicontrol("Style","frame","Units","normalized","Position",frmPos,"BackgroundColor",[0.5,0.5,0.5]);

  //====================================
  // The START button
  btnNumber = 1;
  yPos = 0.9-(btnNumber-1)*(btnWid+spacing);
  labelStr = "Start";
  cmdStr = "start";
  //callbackStr=''kBraitenbergG(''''start'''');'';
  callbackStr = "kBraitenbergG("+refstring+","+kspstring+",''start'');";

  // Generic button information
  btnPos = [xPos,yPos-spacing,btnLen,btnWid];






  // !! L.117: Matlab function uicontrol not yet converted, original calling sequence used
  startHndl = uicontrol("Style","pushbutton","Units","normalized","Position",btnPos,"String",labelStr,"Interruptible","on","Callback",callbackStr);

  //====================================
  // The STOP button
  btnNumber = 2;
  yPos = 0.9-(btnNumber-1)*(btnWid+spacing);
  labelStr = "Stop";
  // Setting userdata to -1 (=stop) will stop the demo.
  callbackStr = "set(gca,''Userdata'',-1)";

  // Generic  button information
  btnPos = [xPos,yPos-spacing,btnLen,btnWid];






  // !! L.135: Matlab function uicontrol not yet converted, original calling sequence used
  stopHndl = uicontrol("Style","pushbutton","Units","normalized","Position",btnPos,"Enable","off","String",labelStr,"Callback",callbackStr);

  //====================================
  // The RESET button
  btnNumber = 3;
  yPos = 0.9-(btnNumber-1)*(btnWid+spacing);
  labelStr = "Reset";
  callbackStr = "if ~exist(''y'') global y; end; y=[0;0;0];";

  // Generic  button information
  btnPos = [xPos,yPos-spacing,btnLen,btnWid];






  // !! L.152: Matlab function uicontrol not yet converted, original calling sequence used
  resetHndl = uicontrol("Style","pushbutton","Units","normalized","Position",btnPos,"Enable","off","String",labelStr,"Callback",callbackStr);

  //====================================
  // The INFO button
  labelStr = "Info";
  callbackStr = "kBraitenbergG("+refstring+","+kspstring+",''info'');";





  // !! L.163: Matlab function uicontrol not yet converted, original calling sequence used
  infoHndl = uicontrol("Style","push","Units","normalized","position",[xPos,0.2,btnLen,0.1],"string",labelStr,"call",callbackStr);

  //====================================
  // The CLOSE button
  labelStr = "Close";
  callbackStr = "close(gcf)";





  // !! L.174: Matlab function uicontrol not yet converted, original calling sequence used
  closeHndl = uicontrol("Style","push","Units","normalized","position",[xPos,0.05,btnLen,0.1],"string",labelStr,"call",callbackStr);

  // Uncover the figure
  hndlList = [startHndl,stopHndl,resetHndl,infoHndl,closeHndl];

  // !! L.179: Matlab function set not yet converted, original calling sequence used
  // L.179: Name conflict: function name changed from set to %set
  %set(figNumber,"Visible","on","UserData",hndlList);

  // !! L.181: Matlab function watchoff not yet converted, original calling sequence used
  watchoff(oldFigNumber);
  // !! L.182: Matlab function figure not yet converted, original calling sequence used
  figure(figNumber);

elseif mtlb_strcmp(action,"start") then
  // !! L.185: Matlab function gca not yet converted, original calling sequence used
  axHndl = gca();
  // !! L.186: Matlab function gcf not yet converted
  figNumber = mtlb(gcf);
  // !! L.187: Matlab function get not yet converted, original calling sequence used
  // L.187: Name conflict: function name changed from get to %get
  hndlList = %get(figNumber,"UserData");
  startHndl = mtlb_e(hndlList,1);
  stopHndl = mtlb_e(hndlList,2);
  resetHndl = mtlb_e(hndlList,3);
  infoHndl = mtlb_e(hndlList,4);
  closeHndl = mtlb_e(hndlList,5);
  // !! L.193: Matlab function set not yet converted, original calling sequence used
  // L.193: Name conflict: function name changed from set to %set
  %set([startHndl,resetHndl,closeHndl,infoHndl],"Enable","off");
  // !! L.194: Matlab function set not yet converted, original calling sequence used
  // L.194: Name conflict: function name changed from set to %set
  %set(stopHndl,"Enable","on");

  // ====== Start of Demo
  // !! L.197: Matlab function set not yet converted, original calling sequence used
  // L.197: Name conflict: function name changed from set to %set
  %set(figNumber,"Backingstore","off");
  // The graphics axis limits are set to values known 
  // to contain the solution.







  // !! L.207: Matlab function set not yet converted, original calling sequence used
  // L.207: Name conflict: function name changed from set to %set
  %set(axHndl,"XLim",XAxis,"YLim",YAxis,"Userdata",play,"XTick",[],"YTick",[],"Drawmode","fast","Visible","on","NextPlot","add","Userdata",play);
  xlabel("X");
  ylabel("Y");

  // Save L steps and plot like a comet tail.
  L = 50;
  Y = mtlb_double(y)*ones(1,L);

  // !! L.215: All children will be deleted, no HandleVisibility property in Scilab graphics.
  %v1_2 = gca();  delete(%v1_2.children);





  // !! L.221: Matlab function line not yet converted, original calling sequence used
  head = line("color","r","Marker",".","markersize",25,"erase","xor","xdata",mtlb_e(y,1),"ydata",mtlb_e(y,2));




  // !! L.226: Matlab function line not yet converted, original calling sequence used
  body = line("color","y","LineStyle","-","erase","none","xdata",[],"ydata",[]);




  // !! L.231: Matlab function line not yet converted, original calling sequence used
  tail = line("color","b","LineStyle","-","erase","none","xdata",[],"ydata",[]);

  WHEEL_RADIUS = 7.81;
  AXLE_LENGTH = 53;
  MM_PER_ENC = ((%pi*2)*WHEEL_RADIUS)/600;

  kSetEncoders(ref,0,0);  // reset to zero
  oldPosition = mtlb_double(kGetEncoders(ref))*MM_PER_ENC;
  x1 = mtlb_e(y,1);
  x2 = mtlb_e(y,2);
  Theta = mtlb_e(y,3);

  // The main loop
  while %t // !! L.244: Matlab function get not yet converted, original calling sequence used
   // L.244: Name conflict: function name changed from get to %get
   if mtlb_logic(mtlb_double(%get(axHndl,"Userdata")),"==",play) then break;end;
   sensors = kProximity(ref); // read the proximity sensors
   speed = gain*mtlb_double(sensors)+offset; // calculate the speed
   kSetSpeed(ref,speed(2),speed(1)); // write the speed
  
   newPosition = mtlb_double(kGetEncoders(ref))*MM_PER_ENC;
   dTheta = (mtlb_s(newPosition,oldPosition)'*[-1;1])/AXLE_LENGTH;
   l = (mtlb_s(newPosition,oldPosition)'*[1;1])/2;
   x1 = mtlb_a(mtlb_double(mtlb_e(x1,$)),cos(mtlb_a(mtlb_double(Theta),dTheta/2))*l);
   x2 = mtlb_a(mtlb_double(mtlb_e(x2,$)),sin(mtlb_a(mtlb_double(Theta),dTheta/2))*l);
   Theta = mtlb_a(mtlb_double(Theta),dTheta);
   y = [x1;x2;Theta];
   oldPosition = newPosition;
  
   // Update the plot
   Y = [y,Y(:,1:L-1)];
   // !! L.260: Matlab function set not yet converted, original calling sequence used
   // L.260: Name conflict: function name changed from set to %set
   %set(head,"xdata",Y(1,1),"ydata",Y(2,1))
   // !! L.261: Matlab function set not yet converted, original calling sequence used
   // L.261: Name conflict: function name changed from set to %set
   %set(body,"xdata",Y(1,1:2),"ydata",Y(2,1:2))
   // !! L.262: Matlab function set not yet converted, original calling sequence used
   // L.262: Name conflict: function name changed from set to %set
   %set(tail,"xdata",Y(1,L-1:L),"ydata",Y(2,L-1:L))
   // L.263: Drawing events are not queued in Scilab
   //drawnow
  
  end;  // Main loop ...
  // ====== End of Demo
  kStop(ref);
  // !! L.268: Matlab function set not yet converted, original calling sequence used
  // L.268: Name conflict: function name changed from set to %set
  %set([startHndl,resetHndl,closeHndl,infoHndl],"Enable","on");
  // !! L.269: Matlab function set not yet converted, original calling sequence used
  // L.269: Name conflict: function name changed from set to %set
  %set(stopHndl,"Enable","off");

elseif mtlb_strcmp(action,"info") then






  // !! L.278: Matlab function strvcat not yet converted, original calling sequence used
  helptext = strvcat("Program for graphical simulation of Khepera Braitenberg vehicle."," ","Authors: Skye Legon, 2/99","         Yves Piguet, 8/98"," ","Copyright 1999 K-Team SA");
  help(helptext,"Khepera Information");

end;// if strcmp(action, ...
endfunction
