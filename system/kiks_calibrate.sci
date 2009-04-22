function [] = kiks_calibrate(port,baud,forceul)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------
//  (c) 2000 Theodor Storm (theodor@tstorm.se)
//  http://www.tstorm.se
// -----------------------------------------------
// kiks_calibrate(port,baud): Calibrate KiKS
// 
// Measures how many flops/second this computer can handle and,
// optionally, calculates how much execution time each KSEND call to a 
// real robot requires. You need a robot connected to a serial port
// in order to perform this operation.
// 
// If you have a robot connected to your computer,
// port is the # of the serial port a real robot is connected to.
// baud is the baud rate to run the calibration process at - choose the baud
// rate that you will usually run the real robot at for best results.
// 
// If you do not have a robot connected to the computer,
// do not specify port and baud rate and only computer speed will be measured.
// 
// NOTE: kiks_calibrate will restart KiKS.

global("KIKS_GUI_HDL","KIKS_COMPUTER_SPEED","KIKS_VISUALIZE","KIKS_KSEND_CONSTANT","KIKS_MAX_SPEED","KIKS_WALL_TIME","KIKS_CALIBRATE_BAUD","KIKS_KSEND_VARIATION");

getksend = 1;
if %nargin<3 then
  forceul = [];
end;
if %nargin<2 then
  baud = 9600;
end;
if %nargin<1 then
  port = -1;
end;

if mtlb_logic(mtlb_double(port),"==",-1) then
  getksend = 0;
end;

arena = zeros(100,100);
arena(50,50) = -360;
kiks_arena(arena);
// !! L.43: Unknown function kiks_gui_setstatlistbox not converted, original calling sequence used
kiks_gui_setstatlistbox(7);

xpause(1000*0.25);
if mtlb_logic(mtlb_double(KIKS_VISUALIZE),">",0) then
  kiks_arena_window_close;
end;

xpause(1000*0.25);
// !! L.51: Matlab function sprintf not yet converted, original calling sequence used
// !! L.51: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf("Calibrating KiKS, please wait. This will take a few moments.\n"),1);
KIKS_COMPUTER_SPEED = 0;

if getksend==1 then
  KIKS_KSEND_CONSTANT = 0;
  KIKS_KSEND_VARIATION = 0;
  // !! L.57: Unknown function kiks_settimescale not converted, original calling sequence used
  kiks_settimescale(KIKS_MAX_SPEED);
  maxksend = mtlb_double(baud)/64;
  KIKS_CALIBRATE_BAUD = baud;
  constarray = [];
  flops_total = 0;
  flops_time = 0;

  %v0_1(3:5) = [];  %v1_1(3:5) = [];
  for i = 1:10
    //   loops=0;
    // !! L.66: Unknown function kiks_kopen not converted, original calling sequence used
    ref = kiks_kopen([port,baud,0]);
    nrksend = 0;
    while mtlb_logic(nrksend,"<",maxksend)
      // !! L.69: Matlab function sprintf not yet converted, original calling sequence used
      // !! L.69: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend([sprintf("G,%d,%d",nrksend,nrksend),10],ref);
      nrksend = nrksend+1;
      // !! L.71: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend("H"+10,ref);
      nrksend = nrksend+1;
      // !! L.73: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend("D,0,0"+10,ref);
      nrksend = nrksend+1;
    end;
    // !! L.76: Unknown function kiks_ktime not converted, original calling sequence used
    realruntime = kiks_ktime(port);
    // !! L.77: Unknown function kiks_kclose not converted, original calling sequence used
    kiks_kclose(ref);
    realksend = nrksend;
  
    //  loops=0;
    // !! L.81: Unknown function kiks_kopen not converted, original calling sequence used
    ref = kiks_kopen([-1,baud,0]);
    // !! L.82: Matlab function flops not yet converted
    flops_before = mtlb(flops);
    %v0_1 = getdate();  %v0_1(6) = %v0_1(6)+%v0_1(7)/1000;  t0 = %v0_1(1:6);
    nrksend = 0;
    while mtlb_logic(nrksend,"<",maxksend)
      // !! L.86: Matlab function sprintf not yet converted, original calling sequence used
      // !! L.86: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend([sprintf("G,%d,%d",nrksend,nrksend),10],ref);
      nrksend = nrksend+1;
      // !! L.88: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend("H"+10,ref);
      nrksend = nrksend+1;
      // !! L.90: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend("D,0,0"+10,ref);
      nrksend = nrksend+1;
    end;
    // !! L.93: Unknown function kiks_ktime not converted, original calling sequence used
    simruntime = kiks_ktime(-1);
    // !! L.94: Matlab function flops not yet converted
    flops_total = mtlb_a(flops_total,mtlb_s(mtlb_double(mtlb(flops)),mtlb_double(flops_before)));
    %v1_1 = getdate();  %v1_1(6) = %v1_1(6)+%v1_1(7)/1000;  flops_time = flops_time+etime(%v1_1(1:6),t0);
    // !! L.96: Unknown function kiks_kclose not converted, original calling sequence used
    kiks_kclose(ref);
    simksend = nrksend;
  
    constarray(1,i) = matrix((mtlb_s(mtlb_double(realruntime),mtlb_double(simruntime))/nrksend)*mtlb_double(baud),1,-1);
    // !! L.100: Matlab function sprintf not yet converted, original calling sequence used
    calibration_progress = sprintf("%d%%",i*10);
    // !! L.101: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.101: Unknown function kiks_status not converted, original calling sequence used
    kiks_status(sprintf("%s...",calibration_progress),1);
  end;

  constarray = mtlb_sort(constarray);
  KIKS_KSEND_CONSTANT = mean(constarray(2:9),"m");  // ignore lowest and highest values
  KIKS_KSEND_VARIATION = constarray(9)-constarray(2);
end;

//KIKS_COMPUTER_SPEED=flops_total/flops_time;
//KIKS_COMPUTER_SPEED=flops_time;
// !! L.111: Unknown function kiks_speedtest not converted, original calling sequence used
KIKS_COMPUTER_SPEED = kiks_speedtest(3);
// !! L.112: Matlab function sprintf not yet converted, original calling sequence used
// !! L.112: Unknown function kiks_status not converted, original calling sequence used
kiks_status(sprintf("Computer speed index: %1.2f\n",KIKS_COMPUTER_SPEED),1);
// !! L.113: Unknown function kiks_save_settings not converted, original calling sequence used
kiks_save_settings;
// !! L.114: Unknown function kiks_status not converted, original calling sequence used
kiks_status("Calibration finished.");
// !! L.115: Unknown function kiks_quit not converted, original calling sequence used
kiks_quit(1);
endfunction
