function [spd] = kiks_calculate_speed(t0,t1,t2,t3,max_speed,acc,start_time,end_time)

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

global("KIKS_SPDC");

if mtlb_logic(mtlb_double(start_time),"<",mtlb_double(t0)) then
  start_spd = 0;
elseif mtlb_logic(mtlb_double(start_time),"<",mtlb_double(t1)) then
  start_spd = ((mtlb_double(acc)*3.125)*mtlb_double(start_time))/mtlb_double(KIKS_SPDC);
elseif mtlb_logic(mtlb_double(start_time),"<",mtlb_double(t2)) then
  start_spd = max_speed;
elseif mtlb_logic(mtlb_double(start_time),"<",mtlb_double(t3)) then
  start_spd = mtlb_s(mtlb_double(max_speed)*mtlb_double(KIKS_SPDC),(mtlb_double(acc)*3.125)*mtlb_s(mtlb_double(start_time),mtlb_double(t2)))/mtlb_double(KIKS_SPDC);
else
  start_spd = 0;
end;

if mtlb_logic(mtlb_double(end_time),"<",mtlb_double(t0)) then
  end_spd = 0;
elseif mtlb_logic(mtlb_double(end_time),"<",mtlb_double(t1)) then
  end_spd = ((mtlb_double(acc)*3.125)*mtlb_double(end_time))/mtlb_double(KIKS_SPDC);
elseif mtlb_logic(mtlb_double(end_time),"<",mtlb_double(t2)) then
  end_spd = max_speed;
elseif mtlb_logic(mtlb_double(end_time),"<",mtlb_double(t3)) then
  end_spd = mtlb_s(mtlb_double(max_speed)*mtlb_double(KIKS_SPDC),(mtlb_double(acc)*3.125)*mtlb_s(mtlb_double(end_time),mtlb_double(t2)))/mtlb_double(KIKS_SPDC);
else
  end_spd = 0;
end;

spd = mtlb_a(mtlb_double(start_spd),mtlb_double(end_spd))/2;
endfunction
