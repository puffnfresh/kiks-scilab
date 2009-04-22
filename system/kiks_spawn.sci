function [] = kiks_spawn(%type,pos)

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
// 
// kiks_spawn(type,pos)
// 
// places an object of type t at position pos.
// Pos is a 2-dimensional vector [xpos ypos].
// If pos is [] or omitted, the object will be placed at a random position.
// types: 1 = light, 2 = ball, 3 = cylinder
// examples: 
//    kiks_spawn(2,[100,100]);
//     places a ball at coordinates (100,100).
//    kiks_spawn(1);
//     places a light source at a random position.
global("KIKS_ARENA_MASK","KIKS_MMPERPIXEL","KIKS_WALL_WIDTH");

if bool2s(bool2s(%nargin<1)|bool2s(mtlb_logic(mtlb_double(%type),"<",1)))|bool2s(mtlb_logic(mtlb_double(%type),">",3)) then
  help("kiks_spawn");
  error("<KiKS error> unknown object type. Supported types are 1 (light), 2 (ball) and 3 (cylinder).");
end;
if %nargin==2 then
  [rows,cols] = size(mtlb_double(pos));
  if bool2s(rows~=1)|bool2s(cols~=2) then
    help("kiks_spawn");
    error("<KiKS error> Malformed position vector.");
  end;
  [ys,xs] = size(mtlb_double(KIKS_ARENA_MASK));
  ys = ys*mtlb_double(KIKS_MMPERPIXEL);
  xs = xs*mtlb_double(KIKS_MMPERPIXEL);

  if bool2s(bool2s(bool2s(mtlb_logic(mtlb_double(mtlb_e(pos,1)),"<",0))|bool2s(mtlb_logic(mtlb_double(mtlb_e(pos,1)),">",mtlb_s(xs,mtlb_double(KIKS_WALL_WIDTH)*2))))|bool2s(mtlb_logic(mtlb_double(mtlb_e(pos,2)),"<",0)))|bool2s(mtlb_logic(mtlb_double(mtlb_e(pos,2)),">",mtlb_s(ys,mtlb_double(KIKS_WALL_WIDTH)*2))) then
    help("kiks_spawn");
    error("<KiKS error> Illegal position. Position is outside arena.");
  end;
else
  pos = [];
end;

// !! L.42: Unknown function kiks_spawn_object not converted, original calling sequence used
kiks_spawn_object(pos,%type);
endfunction
