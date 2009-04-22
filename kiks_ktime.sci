function [secs] = kiks_ktime(port)

// Ouput variables initialisation (not found in input variables)
secs=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// kiks_ktime(ref)
// 
// returns elapsed time in seconds since kiks_kopen was called for referenced robot
// 
// -----------------------------------------------
//  (c) 2000 Theodor Storm (theodor@tstorm.se)
//  http://www.tstorm.se
// -----------------------------------------------
//function secs=kiks_ktime(port)
global("KIKS_KTIME_VEC","KIKS_RBT_TIME","KIKS_OTHERTIME","KIKS_PAUSETIME","KIKS_LINKTIME");
secs = [];
if mtlb_logic(mtlb_double(port),"<",0) then
  [tmp,sz] = size(mtlb_double(KIKS_RBT_TIME));
  if bool2s(mtlb_logic(abs(mtlb_double(port)),"<=",sz))&bool2s(mtlb_logic(mtlb_double(mtlb_e(KIKS_RBT_TIME,abs(mtlb_double(port)))),">=",0)) then
    %v04 = getdate();  %v04(3:5) = [];  %v04(6) = %v04(6)+%v04(7)/1000;
    if etime(%v04(1:6),KIKS_OTHERTIME)>0 then
      // !! L.17: Unknown function kiks_ksend not converted, original calling sequence used
      kiks_ksend([],[port,port,port,port]);
    end;
    secs = mtlb_e(KIKS_RBT_TIME,abs(mtlb_double(port)));
  end;
else
  [sz,tmp] = size(mtlb_double(KIKS_KTIME_VEC));
  if bool2s(mtlb_logic(mtlb_a(mtlb_double(port),1),"<=",sz))&bool2s(~isempty(KIKS_KTIME_VEC(mtlb_a(mtlb_double(port),1),:))) then
    %v1_1 = getdate();  %v1_1(3:5) = [];  %v1_1(6) = %v1_1(6)+%v1_1(7)/1000;  secs = etime(%v1_1(1:6),KIKS_KTIME_VEC(mtlb_a(mtlb_double(port),1),:));
  end;
end;

return;
endfunction
