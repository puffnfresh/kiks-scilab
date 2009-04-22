function [] = kiks_pause(ptime)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------
//  (c) 2000 Theodor Storm (theodor@tstorm.se)
//  http://www.tstorm.se
// -----------------------------------------------
global("KIKS_PHYS_PORT","KIKS_PAUSETIME","KIKS_TIMESCALE","KIKS_RBTARRAY","KIKS_PORT");
if mtlb_logic(abs(mtlb_double(mtlb_max(mtlb_double(mtlb_max(mtlb_double(KIKS_PHYS_PORT),"m")),"m"))),">",0) then
  xpause(1000*ptime);
else
  if isempty(KIKS_PAUSETIME) then KIKS_PAUSETIME = 0;end;
  if isempty(KIKS_TIMESCALE) then
    // KiKS inactive, just pause
    xpause(1000*ptime);
  else
    if mtlb_logic(mtlb_double(KIKS_TIMESCALE),">=",0) then
      // update world during pause time
      [rows,cols] = size(mtlb_double(KIKS_RBTARRAY));
      if cols>0 then
        ref = [-mtlb_double(mtlb_e(KIKS_RBTARRAY,1)),-mtlb_double(mtlb_e(KIKS_RBTARRAY,1)),-mtlb_double(mtlb_e(KIKS_RBTARRAY,1)),-mtlb_double(mtlb_e(KIKS_RBTARRAY,1))];
        t0 = kiks_ktime(-mtlb_double(mtlb_e(KIKS_RBTARRAY,1)));
        while mtlb_logic(mtlb_s(mtlb_double(kiks_ktime(-mtlb_double(mtlb_e(KIKS_RBTARRAY,1)))),mtlb_double(t0)),"<",mtlb_double(ptime))
          KIKS_PAUSETIME = KIKS_PAUSETIME+0.05;
        end;
      else
        xpause(1000*ptime);
      end;
    else
      [rows,cols] = size(mtlb_double(KIKS_RBTARRAY));
      if cols>0 then
        KIKS_PAUSETIME = mtlb_a(KIKS_PAUSETIME,mtlb_double(ptime));
      else
        xpause(1000*ptime);
      end;
    end;
  end;
end;
endfunction
