function [] = kiks_gui_simulaterobot()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_PROXIMITY_DIRECTIONS","KIKS_PROXIMITY_POSITIONS","KIKS_ROBOT_DISTANCE_BETWEEN_WHEELS","KIKS_ROBOT_DIAMETER","KIKS_PROXIMITY_SENSORS_RANGE","KIKS_RBTARRAY","KIKS_SIM_PROX_DIST","KIKS_1250","KIKS_MMPERPIXEL","KIKS_SIM_PROX_STEP","KIKS_GUI_HDL");

dontspawn = 0;
if isempty(KIKS_RBTARRAY) then
  dontspawn = 1;
end;

while size(mtlb_logic(mtlb_double(KIKS_RBTARRAY),">",0))
  // !! L.15: Unknown function kiks_delete_robot not converted, original calling sequence used
  kiks_delete_robot(mtlb_e(KIKS_RBTARRAY,1));
end;

// !! L.18: Matlab function findobj not yet converted, original calling sequence used
// L.18: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"Tag","simulate_popup");
// !! L.19: Matlab function get not yet converted, original calling sequence used
// L.19: Name conflict: function name changed from get to %get
nr = %get(h,"Value");
// !! L.20: Matlab function get not yet converted, original calling sequence used
// L.20: Name conflict: function name changed from get to %get
robots = %get(h,"String");
robot = char(mtlb_strrep(mtlb_e(robots,nr)," ","_"));

mtlb_eval(robot);

// ! L.25: mtlb(KIKS_PROXIMITY_SENSORS_R) can be replaced by KIKS_PROXIMITY_SENSORS_R() or KIKS_PROXIMITY_SENSORS_R whether KIKS_PROXIMITY_SENSORS_R is an M-file or not
KIKS_SIM_PROX_DIST = mtlb(KIKS_PROXIMITY_SENSORS_R);

KIKS_1250 = mtlb_imp(mtlb_double(KIKS_MMPERPIXEL),ceil(mtlb_double(KIKS_SIM_PROX_STEP)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_SIM_PROX_DIST)/mtlb_double(KIKS_MMPERPIXEL)));
[tmp,sz] = size(KIKS_1250);
KIKS_1250 = KIKS_1250(2:sz);// don''t include (0,0)

// !! L.31: Unknown function kiks_set_robot_data not converted, original calling sequence used
kiks_set_robot_data;

if dontspawn==0 then
  // !! L.34: Unknown function kiks_spawn_robot not converted, original calling sequence used
  kiks_spawn_robot;
end;
endfunction
