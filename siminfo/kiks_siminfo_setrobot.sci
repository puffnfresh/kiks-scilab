function [res] = kiks_siminfo_setrobot(x,y,radians)

// Ouput variables initialisation (not found in input variables)
res=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// function res = kiks_siminfo_setrobot(x,y,radians)
// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
global("KIKS_RBTARRAY","KIKS_WALL_WIDTH","KIKS_MMPERPIXEL");

res = 1;

if %nargin<3 then
  rot = [];
else
  //rot=degrees*(pi/180);
  rot = radians;
end;

if %nargin<2 then
  res = 0;
  pos = [];
else
  pos = [mtlb_a(mtlb_double(x),mtlb_double(KIKS_WALL_WIDTH)),mtlb_a(mtlb_double(y),mtlb_double(KIKS_WALL_WIDTH))];
end;

if res then
  while size(mtlb_logic(mtlb_double(KIKS_RBTARRAY),">",0))
    // !! L.27: Unknown function kiks_delete_robot not converted, original calling sequence used
    kiks_delete_robot(mtlb_e(KIKS_RBTARRAY,1));
  end;
  // ! L.29: mtlb(kiks_spawn_robot) can be replaced by kiks_spawn_robot() or kiks_spawn_robot whether kiks_spawn_robot is an M-file or not
  // !! L.29: Unknown function kiks_spawn_robot not converted, original calling sequence used
  res = kiks_spawn_robot(pos,rot);
end;
endfunction
