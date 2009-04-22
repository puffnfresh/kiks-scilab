function [spd] = kiks_get_speed_from_prof(tnow,six)

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
// spd = mm/sec
if mtlb_logic(mtlb_double(tnow),"<",mtlb_double(mtlb_e(six,1))) then spd = 0; return;end;
if mtlb_logic(mtlb_double(tnow),"<",mtlb_double(mtlb_e(six,2))) then spd = (mtlb_double(mtlb_e(six,6))*mtlb_double(tnow))*3.125; return;end;
if mtlb_logic(mtlb_double(tnow),"<=",mtlb_double(mtlb_e(six,3))) then spd = mtlb_double(mtlb_e(six,5))*mtlb_double(KIKS_SPDC); return;end;
if mtlb_logic(mtlb_double(tnow),"<",mtlb_double(mtlb_e(six,4))) then spd = mtlb_s(mtlb_double(mtlb_e(six,5))*mtlb_double(KIKS_SPDC),(mtlb_s(mtlb_double(tnow),mtlb_double(mtlb_e(six,3)))*mtlb_double(mtlb_e(six,6)))*3.125); return;end;
spd = 0;
return;
endfunction
