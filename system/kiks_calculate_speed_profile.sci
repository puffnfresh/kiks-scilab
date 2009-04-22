function [six] = kiks_calculate_speed_pro(max_speed,acc,start_pos,end_pos)

// Ouput variables initialisation (not found in input variables)
six=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SPDC");
six = [0,0,0,0,0,0];
if mtlb_logic(mtlb_s(mtlb_double(end_pos),mtlb_double(start_pos)),"==",0) then return;end;

totaldist = mtlb_s(mtlb_double(end_pos),mtlb_double(start_pos))*(mtlb_double(KIKS_SPDC)/100);// total distance to travel (in mm)
spdsgn = sign(totaldist);

totaldist = abs(totaldist);
max_speed = sign(totaldist)*mtlb_double(max_speed);
acc = sign(totaldist)*mtlb_double(acc);
t0 = 0;// time when speed = 0
t1 = (max_speed*mtlb_double(KIKS_SPDC))/(acc*3.125);// time to reach max_speed
accdist = (((max_speed*mtlb_double(KIKS_SPDC))/2)*t1)*2;// distance travelled during acceleration phases 
maxdist = mtlb_s(totaldist,accdist);// distance to travel with max speed in mm
if mtlb_logic(maxdist,"<",0) then
  tmax = 0;
  t1 = sqrt(totaldist/(acc*3.125));
  max_speed = ((acc*3.125)*t1)/mtlb_double(KIKS_SPDC);
else
  tmax = maxdist/(max_speed*mtlb_double(KIKS_SPDC));  // time to travel with max speed
end;
t2 = mtlb_a(t1,tmax);// time when speed = max_speed_right
t3 = mtlb_a(t2,t1);// time when speed is back to 0 - total time for movement
six = [t0,t1,t2,t3,spdsgn*max_speed,spdsgn*acc];

// Need to check what happens if maxdist<0
endfunction
