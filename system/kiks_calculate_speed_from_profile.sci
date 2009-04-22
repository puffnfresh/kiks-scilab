function [spd] = kiks_calculate_speed_fro(t0,t1,t2,t3,max_speed,acc,time)

// Ouput variables initialisation (not found in input variables)
spd=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SPDC")

if mtlb_logic(mtlb_double(time),"<",mtlb_double(t0)) then spd = 0; return;end;
if mtlb_logic(mtlb_double(time),"<",mtlb_double(t1)) then spd = ((mtlb_double(acc)*3.125)*mtlb_double(time))/mtlb_double(KIKS_SPDC); return;end;
if mtlb_logic(mtlb_double(time),"<",mtlb_double(t2)) then spd = max_speed; return;end;
if mtlb_logic(mtlb_double(time),"<",mtlb_double(t3)) then spd = mtlb_s(mtlb_double(max_speed)*mtlb_double(KIKS_SPDC),(mtlb_double(acc)*3.125)*mtlb_s(mtlb_double(time),mtlb_double(t2)))/mtlb_double(KIKS_SPDC); return;end;
spd = 0;return;
endfunction
