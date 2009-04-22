function [] = kiks_updaterobot(port,v_time)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_2DVISUALIZE","KIKS_lastupdate","KIKS_updatefreq","KIKS_updatefreqtime","KIKS_MONITOR_WIN","KIKS_MONITOR_ON","KIKS_RBT_TIME");

if mtlb_logic(mtlb_double(v_time),">=",0.01) then
  // !! L.10: Unknown function kiks_moverobot not converted, original calling sequence used
  kiks_moverobot(port,v_time);
end;

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then kiks_draw_robot(port);end;

KIKS_lastupdate = mtlb_i(KIKS_lastupdate,port,mtlb_e(KIKS_RBT_TIME,abs(mtlb_double(port))));
updtime = mtlb_s(mtlb_double(mtlb_e(KIKS_lastupdate,port)),mtlb_double(mtlb_e(KIKS_updatefreqtime,port)));

if mtlb_logic(updtime,">=",1) then
  if mtlb_logic(mtlb_double(mtlb_e(KIKS_MONITOR_ON,port)),"==",1) then
    // !! L.20: Matlab function findobj not yet converted, original calling sequence used
    // L.20: Name conflict: function name changed from findobj to %findobj
    h = %findobj(mtlb_e(KIKS_MONITOR_WIN,port),"Tag","time");
    mins = floor(mtlb_double(mtlb_e(KIKS_lastupdate,port))/60);
    secs = floor(mtlb_s(mtlb_double(mtlb_e(KIKS_lastupdate,port)),mins*60));
    // !! L.23: Matlab function sprintf not yet converted, original calling sequence used
    timestr = sprintf("%2.0f:%2.0f",mins,secs);
    [rows,cols] = size(mtlb_double(timestr));
    for i = 1:cols
      if mtlb_logic(mtlb_double(mtlb_e(timestr,i)),"==",asciimat(" ")) then timestr = mtlb_i(timestr,i,"0");end;
    end;
    // !! L.28: Matlab function set not yet converted, original calling sequence used
    // L.28: Name conflict: function name changed from set to %set
    %set(h,"string",timestr);
  end;
else
  KIKS_updatefreq = mtlb_i(KIKS_updatefreq,port,mtlb_a(mtlb_double(mtlb_e(KIKS_updatefreq,port)),1));
end;
endfunction
