function [res] = kiks_siminfo_speed()

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
// returns simulator speed (relative to real time):
// [avg mom]
// where mom is the current speed (average since last call to kiks_siminfo_speed)
// and avg is the average speed since kiks_kopen was called.
global("KIKS_RBT_RTIME","KIKS_RBT_TIME","KIKS_RBT_RTIME_MOM","KIKS_RBT_TIME_MOM")

id = 1;

if mtlb_logic(mtlb_double(mtlb_e(KIKS_RBT_TIME_MOM,id)),">",0) then
  delta = mtlb_s(mtlb_double(mtlb_e(KIKS_RBT_TIME,id)),mtlb_double(mtlb_e(KIKS_RBT_TIME_MOM,id)));
  %v0_1 = getdate();  %v0_1(3:5) = [];  %v0_1(6) = %v0_1(6)+%v0_1(7)/1000;  rdelta = etime(%v0_1(1:6),KIKS_RBT_RTIME_MOM(id,:));
  %v1_1 = getdate();  %v1_1(3:5) = [];  %v1_1(6) = %v1_1(6)+%v1_1(7)/1000;  avg = (mtlb_double(mtlb_e(KIKS_RBT_TIME,id))/etime(%v1_1(1:6),KIKS_RBT_RTIME(id,:)))*100;
  mom = (delta/rdelta)*100;
else
  avg = 100;
  mom = avg;
end;
res = [avg,mom];

KIKS_RBT_TIME_MOM = mtlb_i(KIKS_RBT_TIME_MOM,id,mtlb_e(KIKS_RBT_TIME,id));
%v0 = getdate();%v0(3:5) = [];%v0(6) = %v0(6)+%v0(7)/1000;KIKS_RBT_RTIME_MOM(id,:) = %v0(1:6);
endfunction
