function [] = follow(port,baud,time)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// follow(port,baud,time)
// port = serial port to communicate with (port<0 ==> simulated robot, port>=0 ==> real robot
// baud = baud rate
// time = time to run behaviour

if %nargin<3 then time = 30;end;
if %nargin<2 then baud = 9600;end;
if %nargin<1 then port = -1;end;

// !! L.11: Unknown function kiks_kopen not converted, original calling sequence used
ref = kiks_kopen([port,baud,1]);// KiKS starts up automatically when kiks_kopen is called
reflex = 0;
speed = [1,1];
loops = 0;// for calculating loops/second, not needed for the simulation
%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;t0 = %v0(1:6);// for calculating loops/second, not needed for the simulation
// !! L.16: Unknown function kSetEncoders not converted, original calling sequence used
kSetEncoders(ref,0,0);
while %t // !! L.17: Unknown function kiks_ktime not converted, original calling sequence used
 if mtlb_logic(mtlb_double(kiks_ktime(port)),"<",mtlb_double(time)) then break;end;
 //   kiks_pause(''on'') can be accelerated.
 loops = loops+1; // for calculating loops/second, not needed for the simulation
 // !! L.20: Unknown function kProximity not converted, original calling sequence used
 reflex = kProximity(ref);
 weightsL = [5,0,2,3,3,0,0,0,0];
 weightsR = [7,0,0,-3,-3,0,0,0,0];
 speed = calcspd(weightsL,weightsR,reflex);
 // !! L.24: Unknown function kSetSpeed not converted, original calling sequence used
 kSetSpeed(ref,speed(1),speed(2));
end;
// !! L.26: Unknown function kSetSpeed not converted, original calling sequence used
kSetSpeed(ref,0,0);
// calculate stats
// !! L.28: Unknown function kiks_ktime not converted, original calling sequence used
%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;// !! L.28: Unknown function kiks_ktime not converted, original calling sequence used
%v1 = getdate();%v1(3:5) = [];%v1(6) = %v1(6)+%v1(7)/1000;// L.28: No simple equivalent, so mtlb_fprintf() is called
mtlb_fprintf("%1.0f seconds simulated in %1.0f seconds (%3.0f%% of real time)\n",kiks_ktime(port),etime(%v0(1:6),t0),(mtlb_double(kiks_ktime(port))/etime(%v1(1:6),t0))*100)
// !! L.29: Unknown function kiks_ktime not converted, original calling sequence used
// L.29: No simple equivalent, so mtlb_fprintf() is called
mtlb_fprintf("%1.1f loops / second\n",loops/mtlb_double(kiks_ktime(port)))
// close port
// !! L.31: Unknown function kiks_kclose not converted, original calling sequence used
kiks_kclose(ref);

endfunction
 
 
function [out] = calcspd(weightsL,weightsR,reflex)

// Ouput variables initialisation (not found in input variables)
out=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

mL = mtlb_e(weightsL,1);
mR = mtlb_e(weightsR,1);
for i = 2:9
  mL = mtlb_a((mtlb_double(mtlb_e(weightsL,i))*(1/1023))*mtlb_double(mtlb_e(reflex,i-1)),mtlb_double(mL));
  mR = mtlb_a((mtlb_double(mtlb_e(weightsR,i))*(1/1023))*mtlb_double(mtlb_e(reflex,i-1)),mtlb_double(mR));
end;
out = [round(mL),round(mR)];
endfunction
