function [] = kiks_gui_monitorbtn()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_SIM_LINVIS_2DMODE","KIKS_MONITOR_WIN","KIKS_MONITOR_ON","KIKS_ROBOT_MATRIX");

id = 1;

if mtlb_logic(mtlb_double(mtlb_e(KIKS_MONITOR_ON,id)),"==",1) then // turn off monitor
 KIKS_MONITOR_ON = mtlb_i(KIKS_MONITOR_ON,id,0);
 close(mtlb_e(KIKS_MONITOR_WIN,id));
 KIKS_MONITOR_WIN(id) = [];
else // turn on monitor
 // !! L.15: Matlab function findobj not yet converted, original calling sequence used
 // L.15: Name conflict: function name changed from findobj to %findobj
 h = findobj("Name","KiKS");
 // !! L.16: Matlab function get not yet converted, original calling sequence used
 // L.16: Name conflict: function name changed from get to %get
 kikspos = get(h,"Position");

 mainpos = kikspos;
 hp = 6;
 vp = 0;

 // !! L.22: Matlab function get not yet converted, original calling sequence used
 // L.22: Name conflict: function name changed from get to %get
 scrnsz = get(0,"screensize_px");
 // !! L.23: Unknown function kiks_gui_monitor not converted, original calling sequence used
 KIKS_MONITOR_WIN = mtlb_i(KIKS_MONITOR_WIN,id,kiks_gui_monitor());
 // !! L.24: Matlab function sprintf not yet converted, original calling sequence used
 // !! L.24: Matlab function set not yet converted, original calling sequence used
 // L.24: Name conflict: function name changed from set to %set
 set(mtlb_e(KIKS_MONITOR_WIN,id),"Name",sprintf("Port -%d",id));
 // !! L.25: Matlab function get not yet converted, original calling sequence used
 // L.25: Name conflict: function name changed from get to %get
 monpos = get(mtlb_e(KIKS_MONITOR_WIN,id),"Position");
 nr = 0;
 [tmp,sz] = size(mtlb_double(KIKS_MONITOR_ON));
 for i = 1:sz
   if mtlb_logic(mtlb_double(mtlb_e(KIKS_MONITOR_ON,i)),"==",1) then
     nr = nr+1;
   end;
 end;

 //monpos(1)=mainpos(1)+nr*(monpos(3)+6);
 //monpos(2)=mainpos(2)+mainpos(4)+25;
 //monpos(1)=mainpos(1)+mainpos(3)+8;
 monpos = mtlb_i(monpos,1,mtlb_a(mtlb_a(mtlb_double(mtlb_e(mainpos,1)),147),5));
 monpos = mtlb_i(monpos,2,mtlb_e(mainpos,2));
 if KIKS_SIM_LINVIS_2DMODE then
   monpos = mtlb_i(monpos,4,mtlb_a(mtlb_double(mtlb_e(monpos,4)),128));
   // !! L.41: Matlab function findobj not yet converted, original calling sequence used
   // L.41: Name conflict: function name changed from findobj to %findobj
   //h = %findobj(mtlb_e(KIKS_MONITOR_WIN,id),"tag","Axes2");
   h = findobj("tag","Axes2");
   // !! L.42: Matlab function get not yet converted, original calling sequence used
   // L.42: Name conflict: function name changed from get to %get
   ap = get(h,"position");
   ap = mtlb_i(ap,4,128);
   // !! L.44: Matlab function set not yet converted, original calling sequence used
   // L.44: Name conflict: function name changed from set to %set
   set(h,"position",ap);
   // !! L.45: Matlab function set not yet converted, original calling sequence used
   // L.45: Name conflict: function name changed from set to %set
   set(h,"ylim",[1,KIKS_SIM_LINVIS_2DMODE]);
   // !! L.46: Matlab function set not yet converted, original calling sequence used
   // L.46: Name conflict: function name changed from set to %set
   set(h,"xlim",[1,KIKS_SIM_LINVIS_2DMODE]);
   // !! L.47: Matlab function findobj not yet converted, original calling sequence used
   // L.47: Name conflict: function name changed from findobj to %findobj
   h = findobj("tag","Axes2Image1");
   // !! L.48: Matlab function set not yet converted, original calling sequence used
   // L.48: Name conflict: function name changed from set to %set
   set(h,"Ydata",[1,KIKS_SIM_LINVIS_2DMODE]);
   // !! L.49: Matlab function set not yet converted, original calling sequence used
   // L.49: Name conflict: function name changed from set to %set
   set(h,"Xdata",[1,KIKS_SIM_LINVIS_2DMODE]);
   // ! L.50: real(mtlb_double(KIKS_SIM_LINVIS_2DMODE)) may be replaced by:
   // !    --> mtlb_double(KIKS_SIM_LINVIS_2DMODE) if mtlb_double(KIKS_SIM_LINVIS_2DMODE) is Real
   // ! L.50: real(mtlb_double(KIKS_SIM_LINVIS_2DMODE)) may be replaced by:
   // !    --> mtlb_double(KIKS_SIM_LINVIS_2DMODE) if mtlb_double(KIKS_SIM_LINVIS_2DMODE) is Real
   // !! L.50: Matlab function set not yet converted, original calling sequence used
   // L.50: Name conflict: function name changed from set to %set
   set(h,"CData",zeros(real(mtlb_double(KIKS_SIM_LINVIS_2DMODE)),real(mtlb_double(KIKS_SIM_LINVIS_2DMODE))));
 end;
 if mtlb_logic(mtlb_a(mtlb_double(mtlb_e(monpos,2)),mtlb_double(mtlb_e(monpos,4))),">",mtlb_double(mtlb_e(scrnsz,4))) then
   monpos = mtlb_i(monpos,2,mtlb_s(mtlb_s(mtlb_double(mtlb_e(mainpos,2)),mtlb_double(mtlb_e(monpos,4))),25));
 end;

 KIKS_MONITOR_ON = mtlb_i(KIKS_MONITOR_ON,id,1);
 // !! L.57: Matlab function set not yet converted, original calling sequence used
 // L.57: Name conflict: function name changed from set to %set
 set(mtlb_e(KIKS_MONITOR_WIN,id),"Position",monpos);
 // !! L.58: Matlab function findobj not yet converted, original calling sequence used
 // L.58: Name conflict: function name changed from findobj to %findobj
 h = findobj("tag","angle");
 // !! L.59: Matlab function sprintf not yet converted, original calling sequence used
 // !! L.59: Matlab function set not yet converted, original calling sequence used
 // L.59: Name conflict: function name changed from set to %set
 set(h,"string",sprintf("%d°",pmodulo(round(mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))/(%pi/180)),360)));
 // !! L.60: Unknown function kiks_monitor_update not converted, original calling sequence used
 kiks_monitor_update(1);
end;
endfunction
