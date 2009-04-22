function [] = kiks_monitor_update(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MONITOR_UPD","KIKS_DIST_FWD","KIKS_DIST_BWD","KIKS_DIST_STR","KIKS_SIM_LINVIS_2DMODE","KIKS_GUI_HDL","KIKS_GLOBALTIME","KIKS_SIM_LINVIS_IMG","KIKS_LIGHT_POS","KIKS_PROX_POS","KIKS_ROBOT_MATRIX","KIKS_MONITOR_ON","KIKS_MONITOR_WIN")

if mtlb_logic(mtlb_double(mtlb_e(KIKS_MONITOR_ON,id)),"==",1) then
  if isempty(KIKS_MONITOR_UPD) then %v0_1 = getdate(); %v0_1(3:5) = []; %v0_1(6) = %v0_1(6)+%v0_1(7)/1000; KIKS_MONITOR_UPD = %v0_1(1:6);end;
  %v13 = getdate();  %v13(3:5) = [];  %v13(6) = %v13(6)+%v13(7)/1000;
  if etime(%v13(1:6),KIKS_MONITOR_UPD)<0.1 then return;end;
  %v2_1 = getdate();  %v2_1(3:5) = [];  %v2_1(6) = %v2_1(6)+%v2_1(7)/1000;  KIKS_MONITOR_UPD = %v2_1(1:6);
  // !! L.13: Matlab function findobj not yet converted, original calling sequence used
  // L.13: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","l");
  // !! L.14: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.14: Matlab function set not yet converted, original calling sequence used
  // L.14: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%d",round(mtlb_double(KIKS_ROBOT_MATRIX(id,1,5)))));
  // !! L.15: Matlab function findobj not yet converted, original calling sequence used
  // L.15: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","r");
  // !! L.16: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.16: Matlab function set not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%d",round(mtlb_double(KIKS_ROBOT_MATRIX(id,1,6)))));
  // !! L.17: Matlab function findobj not yet converted, original calling sequence used
  // L.17: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","angle");
  // !! L.18: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.18: Matlab function set not yet converted, original calling sequence used
  // L.18: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%d°",pmodulo(round(mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))/(%pi/180)),360)));
  // !! L.19: Matlab function findobj not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","dist_fwd");
  // !! L.20: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.20: Matlab function set not yet converted, original calling sequence used
  // L.20: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%3.1f cm",mtlb_double(KIKS_DIST_FWD)/10));
  // !! L.21: Matlab function findobj not yet converted, original calling sequence used
  // L.21: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","dist_bwd");
  // !! L.22: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.22: Matlab function set not yet converted, original calling sequence used
  // L.22: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%3.1f cm",mtlb_double(KIKS_DIST_BWD)/10));
  // !! L.23: Matlab function findobj not yet converted, original calling sequence used
  // L.23: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","dist_straight");
  // !! L.24: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.24: Matlab function set not yet converted, original calling sequence used
  // L.24: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%3.1f cm",mtlb_double(KIKS_DIST_STR)/10));
  // !! L.25: Matlab function findobj not yet converted, original calling sequence used
  // L.25: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","dist_total");
  // !! L.26: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.26: Matlab function set not yet converted, original calling sequence used
  // L.26: Name conflict: function name changed from set to %set
  set(h,"string",sprintf("%3.1f cm",mtlb_a(mtlb_double(KIKS_DIST_FWD),mtlb_double(KIKS_DIST_BWD))/10));

  for sens = 1:8
    // !! L.29: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.29: Matlab function findobj not yet converted, original calling sequence used
    // L.29: Name conflict: function name changed from findobj to %findobj
    h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag",sprintf("L%d",sens));
    // !! L.30: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.30: Matlab function set not yet converted, original calling sequence used
    // L.30: Name conflict: function name changed from set to %set
    set(h,"string",sprintf("%d",KIKS_ROBOT_MATRIX(id,KIKS_LIGHT_POS,sens)));
    // !! L.31: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.31: Matlab function findobj not yet converted, original calling sequence used
    // L.31: Name conflict: function name changed from findobj to %findobj
    h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag",sprintf("%d",sens));
    // !! L.32: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.32: Matlab function set not yet converted, original calling sequence used
    // L.32: Name conflict: function name changed from set to %set
    set(h,"string",sprintf("%d",KIKS_ROBOT_MATRIX(id,KIKS_PROX_POS,sens)));
  end;

  // !! L.35: Matlab function findobj not yet converted, original calling sequence used
  // L.35: Name conflict: function name changed from findobj to %findobj
  h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","Axes2Image1");
  if KIKS_SIM_LINVIS_2DMODE then
    img(1:length(KIKS_SIM_LINVIS_IMG(id,:,:)),1:length(KIKS_SIM_LINVIS_IMG(id,:,:))) = KIKS_SIM_LINVIS_IMG(id,:,:);
    // !! L.38: Matlab function set not yet converted, original calling sequence used
    // L.38: Name conflict: function name changed from set to %set
    set(h,"CData",img);
  else
    // !! L.40: Matlab function set not yet converted, original calling sequence used
    // L.40: Name conflict: function name changed from set to %set
    set(h,"CData",KIKS_SIM_LINVIS_IMG(id,:));
  end;
end;
endfunction
