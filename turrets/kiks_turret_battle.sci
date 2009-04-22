function [response] = kiks_turret_battle(tcommand,targs)

// Ouput variables initialisation (not found in input variables)
response=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
// The incredible nuclear powered Battle Turret
// 
// Supported commands:
// 
//    B: returns version.
//    F: fires cannon and returns [id,distance] of target hit.
//    S: returns [X,Y,angle,distance_to_target,energy_percent,energy_points,times_hit] sensor values.
global("KIKS_FIRE_HDL","KIKS_2DVISUALIZE","KIKS_WALL_RENDER","KIKS_WALL_WIDTH","KIKS_MMPERPIXEL","KIKS_ARENA_COLORMASK","KIKS_FID","KIKS_ROBOT_MATRIX","KIKS_WALL_WIDTH","KIKS_KIKSNET_REPLY");

if %nargin<2 then
  // return the turret id
  response = 99;
  return;
end;

select tcommand
  case "B" then
    // !! L.22: Matlab function sprintf not yet converted, original calling sequence used
    response = sprintf("t,99,b,1,0");
  case "F" then // fire cannon - this is handled by server
 target = -1;
 distance = -1;
 if ~isempty(KIKS_KIKSNET_REPLY) then
   // !! L.27: Matlab function sscanf not yet converted, original calling sequence used
   vec = sscanf(KIKS_KIKSNET_REPLY,"%d");
   target = mtlb_e(vec,1);
   distance = mtlb_e(vec,2);
   if bool2s(mtlb_logic(mtlb_double(distance),">",0))&bool2s(mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0)) then
     kx = KIKS_ROBOT_MATRIX(1,1,1);
     ky = KIKS_ROBOT_MATRIX(1,1,2);
     ang = KIKS_ROBOT_MATRIX(1,1,3);
     shot_xcoord = [0,4,3,8,5,distance,distance,5,8,3,4,0]/mtlb_double(KIKS_MMPERPIXEL);
     shot_ycoord = [3,11,4,9,2,1,-1,-2,-9,-4,-11,-3]/mtlb_double(KIKS_MMPERPIXEL);
     shot_xcoord = mtlb_a(shot_xcoord,mtlb_double(KIKS_ROBOT_MATRIX(1,2,2))/mtlb_double(KIKS_MMPERPIXEL));
     KIKS_WALL_WIDTH_SCALED = mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL);
     KIKS_WALL_RENDER_SCALED = mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL);
     xdata = mtlb_a(mtlb_s(mtlb_a(mtlb_s(shot_xcoord*cos(-mtlb_double(ang)),shot_ycoord*sin(-mtlb_double(ang))),floor(mtlb_double(kx)/mtlb_double(KIKS_MMPERPIXEL))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED));
     ydata = mtlb_a(mtlb_s(mtlb_a(mtlb_a(shot_xcoord*sin(-mtlb_double(ang)),shot_ycoord*cos(-mtlb_double(ang))),floor(mtlb_double(ky)/mtlb_double(KIKS_MMPERPIXEL))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED));
     // !! L.41: Matlab function set not yet converted, original calling sequence used
     // L.41: Name conflict: function name changed from set to %set
     %set(mtlb_e(KIKS_FIRE_HDL,1),"Visible","on","xdata",xdata,"ydata",ydata);
     // L.42: Drawing events are not queued in Scilab
     //drawnow
   end;
 else
   if mtlb_logic(mtlb_double(KIKS_FID),"~=",-1) then
     disp("<KiKS warning> KiKSnet server did not reply to FIRE command!");
   end;
 end;
 // !! L.49: Matlab function sprintf not yet converted, original calling sequence used
 response = sprintf("t,99,f,%d,%d",target,distance);
  case "S" then // Return sensor values:
 //      x,y position of robot (in mm, from top left corner)
 //      angle robot is facing
 //      distance (in mm) to whatever the turret is aiming at
 //      energy level (in percent)
 //      energy level (in points)
 distance = -1; // distance to target (from edge of Khepera)
 [ys,xs] = size(mtlb_double(KIKS_ARENA_COLORMASK));
 start_dist = mtlb_a(ceil(mtlb_double(KIKS_ROBOT_MATRIX(1,2,2))/mtlb_double(KIKS_MMPERPIXEL)),1);
 end_dist = max(ys,xs);
 coord_vector = mtlb_imp(start_dist,end_dist);
 ray_xvals = round(mtlb_a(coord_vector*cos(mtlb_double(KIKS_ROBOT_MATRIX(1,1,3))),mtlb_double(KIKS_ROBOT_MATRIX(1,1,1))/mtlb_double(KIKS_MMPERPIXEL)));
 ray_yvals = round(mtlb_a(-coord_vector*sin(mtlb_double(KIKS_ROBOT_MATRIX(1,1,3))),mtlb_double(KIKS_ROBOT_MATRIX(1,1,2))/mtlb_double(KIKS_MMPERPIXEL)));

 idx = mtlb_a(mtlb_s(ray_xvals,1)*ys,ray_yvals); // calculate index values for these points
 idx = mtlb_i(idx,mtlb_find(bool2s(mtlb_logic(idx,">",ys*xs))),ys*xs);
 idx = mtlb_i(idx,mtlb_find(bool2s(mtlb_logic(idx,"<",1))),1);

 // ! L.68: abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))) may be replaced by:
 // !    --> mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) if mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) is real
 distance = min(mtlb_s(mtlb_find(abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)))),1),"m");

 energy_points = -1;
 energy_percent = -1;
 hits = -1;
 if ~isempty(KIKS_KIKSNET_REPLY) then
   // !! L.74: Matlab function sscanf not yet converted, original calling sequence used
   envals = sscanf(KIKS_KIKSNET_REPLY,"%d");
   energy_percent = mtlb_e(envals,1);
   energy_points = mtlb_e(envals,2);
   hits = mtlb_e(envals,3);
 else
   if mtlb_logic(mtlb_double(KIKS_FID),"~=",-1) then
     disp("<KiKS warning> KiKSnet server did not reply to SENSORS command!");
   end;
 end;

 x = floor(mtlb_s(mtlb_double(KIKS_ROBOT_MATRIX(1,1,1)),mtlb_double(KIKS_WALL_WIDTH)));
 y = floor(mtlb_s(mtlb_double(KIKS_ROBOT_MATRIX(1,1,2)),mtlb_double(KIKS_WALL_WIDTH)));
 ang = pmodulo(round(mtlb_double(KIKS_ROBOT_MATRIX(1,1,3))/(%pi/180)),360);

 // !! L.88: Matlab function sprintf not yet converted, original calling sequence used
 response = sprintf("t,99,s,%d,%d,%d,%d,%d,%d,%d",x,y,ang,round(distance*mtlb_double(KIKS_MMPERPIXEL)),energy_percent,energy_points,hits);
  else
    response = "z,Protocol error";
end;
KIKS_KIKSNET_REPLY = "";
endfunction
