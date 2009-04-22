function [] = kiks_arena(arena,colormask,nokhep)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// kiks_arena(arena)
// 
// Reinitializes the arena; works as kiks(arena) but does
// not restart the simulator.
// 
// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
global("KIKS_ARENA_WALLS","KIKS_ARENA_DEFAULT_COLOR","KIKS_TOOLBOX_IMAGES","KIKS_ARENA_CONTOUR","KIKS_BALLDATA","KIKS_FID","KIKS_ARENA_MASK_ORIG","KIKS_ARENA_COLORMASK_ORIG","KIKS_MMPERPIXEL","KIKS_SIM_LINVIS_2DMODE","KIKS_tracestep","KIKS_BALL_TRACE_IX","KIKS_2DVISUALIZE","KIKS_ARENA_MX","KIKS_ARENA_MASK","KIKS_ARENA_COLORMASK","KIKS_ARENA_HEIGHT","KIKS_SESSIONACTIVE","KIKS_WALL_WIDTH","KIKS_RBTARRAY","KIKS_BALLARRAY","KIKS_ROUNDOBJARRAY","KIKS_LIGHTARRAY","KIKS_WALL_RENDER");

KIKS_ARENA_WALLS = [];

oldvis = KIKS_2DVISUALIZE;
if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
  kiks_arena_window_close;
end;

if %nargin<3 then
  nokhep = [];
end;

if %nargin<2 then
  colormask = [];
end;

if type(arena)==10 then
  arenaloaded = [];
  // L.34: No equivalent for findstr() in Scilab so mtlb_findstr() is called

  if ~isempty(mtlb_findstr(mtlb_lower(arena),".tif")) then
    // !! L.31: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Loading arena from TIF file...");
    // !! L.32: Unknown function kiks_tif2arena not converted, original calling sequence used
    [arena,colormask] = kiks_tif2arena(arena);
    //        [arena,colormask]=kiks_kad2arena(KIKS_ARENA_WALLS);
  elseif ~isempty(mtlb_findstr(mtlb_lower(arena),".kad")) then
    // !! L.35: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Loading arena from KiKS Arena Data file...");
    loadmatfile(arena,"-MAT");
    // ! L.37: mtlb(walls) can be replaced by walls() or walls whether walls is an M-file or not
    KIKS_ARENA_WALLS = mtlb(walls);
    // !! L.38: Unknown function kiks_kad2arena not converted, original calling sequence used
    [arena,colormask] = kiks_kad2arena(KIKS_ARENA_WALLS);
  end;
end;

//if isempty(KIKS_SESSIONACTIVE) then
  kiks(arena,colormask);
  return;
//end;

//xs = 695; ys = 498; % size of UmU''s ''Khepera pens''
xs = 500;ys = 650;

if ~isempty(arena) then
  [ys,xs] = size(mtlb_double(arena));

  if bool2s(ys<100)|bool2s(xs<100) then
    arena = [];
    if xs<100 then xs = 100;end;
    if ys<100 then ys = 100;end;
    // !! L.57: Unknown function kiks_status not converted, original calling sequence used
    kiks_status("Warning: arena width or height cannot be less than 100mm.");
  end;
end;

// delete robots
while size(mtlb_logic(mtlb_double(KIKS_RBTARRAY),">",0))
  // !! L.63: Unknown function kiks_delete_robot not converted, original calling sequence used
  kiks_delete_robot(mtlb_e(KIKS_RBTARRAY,1));
end;

// delete lights
while size(mtlb_logic(mtlb_double(KIKS_LIGHTARRAY),">",0))
  // !! L.68: Unknown function kiks_delete_object not converted, original calling sequence used
  kiks_delete_object(mtlb_e(KIKS_LIGHTARRAY,1),1);
end;

// delete balls
while size(mtlb_logic(mtlb_double(KIKS_BALLARRAY),">",0))
  // !! L.73: Unknown function kiks_delete_object not converted, original calling sequence used
  kiks_delete_object(mtlb_e(KIKS_BALLARRAY,1),2+mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,1),5)));
end;


KIKS_BALL_TRACE_IX = [];
KIKS_tracestep = [];

if isempty(arena) then
  //arena = zeros(ys, xs);
  kiks_arena_new_create(ys,xs,1,KIKS_ARENA_DEFAULT_COLOR);
  return;
end;

if isempty(colormask) then
  // !! L.87: Scilab uint8() does not work with Complex values: uint8() call IGNORED !
  // ! L.87: double(mtlb_double(arena))*255 may be replaced by:
  // !    --> uint8(double(mtlb_double(arena))*255) if double(mtlb_double(arena))*255 is real
  colormask = double(mtlb_double(arena))*255;
end;

[ys,xs] = size(mtlb_double(arena));

if bool2s(ys>1)&bool2s(xs>1) then
  if isempty(colormask) then
    // !! L.94: Scilab uint8() does not work with Complex values: uint8() call IGNORED !
    // ! L.94: double(mtlb_double(arena))*255 may be replaced by:
    // !    --> uint8(double(mtlb_double(arena))*255) if double(mtlb_double(arena))*255 is real
    colormask = double(mtlb_double(arena))*255;
  end;

  // !! L.97: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.97: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Setting up arena (%d x %d mm)\n",xs,ys));
  pos = [];
  rot = [];
  kheps = 0;
  while mtlb_logic(mtlb_double(mtlb_min(mtlb_double(mtlb_min(mtlb_double(arena),"m")),"m")),"<",0) // robot start position included
   kheps = kheps+1;
   rot(1,kheps) = matrix((abs(mtlb_double(mtlb_min(mtlb_double(mtlb_min(mtlb_double(arena),"m")),"m")))*%pi)/180,1,-1);
   [y,x] = mtlb_find(bool2s(mtlb_logic(mtlb_double(arena),"==",mtlb_double(mtlb_min(mtlb_double(mtlb_min(mtlb_double(arena),"m")),"m")))));
   arena(y,x) = 0;
   xpos(1,kheps) = matrix(x,1,-1);
   ypos(1,kheps) = matrix(y,1,-1);
  end;
  [py,px] = mtlb_find(bool2s(mtlb_logic(arena,"==",3)));
  [ly,lx] = mtlb_find(bool2s(mtlb_logic(arena,"==",2)));
  [cy,cx] = mtlb_find(bool2s(mtlb_logic(arena,"==",4)));

  arena(py,px) = 0;
  arena(ly,lx) = 0;
  arena(cy,cx) = 0;

  KIKS_ARENA_MASK_ORIG = arena;
  KIKS_ARENA_COLORMASK_ORI = colormask;
  //max(max(KIKS_ARENA_COLORMASK_ORIG))
  [ys,xs] = size(arena);

  // ! L.122: real(mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2)) may be replaced by:
  // !    --> mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2) if mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2) is Real
  // ! L.122: real(mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2)) may be replaced by:
  // !    --> mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2) if mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2) is Real
  KIKS_ARENA_MX = zeros(real(mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2)),real(mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2))); 
  KIKS_ARENA_MX(mtlb_imp(1,floor(mtlb_double(KIKS_WALL_WIDTH))),:) = 1;
  KIKS_ARENA_MX(mtlb_imp(mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))),mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2)),:) = 1;
  KIKS_ARENA_MX(:,mtlb_imp(1,floor(mtlb_double(KIKS_WALL_WIDTH)))) = 1;
  KIKS_ARENA_MX(:,mtlb_imp(mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))),mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2))) = 1;
  KIKS_ARENA_MX(mtlb_imp(mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),1),mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),ys)),mtlb_imp(mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),1),mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),xs))) = arena;

  wall_color = mtlb_min(255,mtlb_max(mtlb_double(KIKS_ARENA_DEFAULT_COLOR),1));

  // ! L.131: real(mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2)) may be replaced by:
  // !    --> mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2) if mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2) is Real
  // ! L.131: real(mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2)) may be replaced by:
  // !    --> mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2) if mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2) is Real
  KIKS_ARENA_COLORMASK = zeros(real(mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2)),real(mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2)));
  KIKS_ARENA_COLORMASK(mtlb_imp(1,floor(mtlb_double(KIKS_WALL_WIDTH))),:) = wall_color;
  KIKS_ARENA_COLORMASK(mtlb_imp(mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))),mtlb_a(ys,floor(mtlb_double(KIKS_WALL_WIDTH))*2)),:) = wall_color;
  KIKS_ARENA_COLORMASK(:,mtlb_imp(1,floor(mtlb_double(KIKS_WALL_WIDTH)))) = wall_color;
  KIKS_ARENA_COLORMASK(:,mtlb_imp(mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))),mtlb_a(xs,floor(mtlb_double(KIKS_WALL_WIDTH))*2))) = wall_color;
  KIKS_ARENA_COLORMASK(mtlb_imp(mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),1),mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),ys)),mtlb_imp(mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),1),mtlb_a(floor(mtlb_double(KIKS_WALL_WIDTH)),xs))) = colormask;

  [rows,cols] = size(KIKS_ARENA_MX);
  if mtlb_logic(mtlb_double(KIKS_MMPERPIXEL),">",1) then
    // !! L.140: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.140: Unknown function kiks_status not converted, original calling sequence used
    kiks_status(sprintf("Downsampling arena (%dx)... \n",floor(mtlb_double(KIKS_MMPERPIXEL))));
    // !! L.141: Unknown function kiks_scale not converted, original calling sequence used
    exec('kiks_scale.sci');
    KIKS_ARENA_MX = kiks_scale(KIKS_ARENA_MX,rows/mtlb_double(KIKS_MMPERPIXEL),cols/mtlb_double(KIKS_MMPERPIXEL));
    [rows,cols] = size(mtlb_double(KIKS_ARENA_COLORMASK));
    // !! L.143: Unknown function kiks_scale not converted, original calling sequence used
    KIKS_ARENA_COLORMASK = kiks_scale(KIKS_ARENA_COLORMASK,rows/mtlb_double(KIKS_MMPERPIXEL),cols/mtlb_double(KIKS_MMPERPIXEL));
    // !! L.144: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.144: Unknown function kiks_status not converted, original calling sequence used
    kiks_status(sprintf("Downsampling arena (%dx)... done.\n",floor(mtlb_double(KIKS_MMPERPIXEL))));
  end;
  KIKS_ARENA_MASK = KIKS_ARENA_MX;

  exec('kiks_spawn_robot.sci');
  if kheps>0 then
    for k = 1:kheps
      // !! L.150: Unknown function kiks_spawn_robot not converted, original calling sequence used
      kiks_spawn_robot(mtlb_s(mtlb_a([xpos(k),ypos(k)],mtlb_double(KIKS_WALL_WIDTH)),mtlb_double(KIKS_WALL_RENDER)),rot(k));
    end;
  else
    if isempty(nokhep) then // !! L.153: Unknown function kiks_spawn_robot not converted, original calling sequence used
     kiks_spawn_robot;end;
  end;

  lights = size(lx);
  for l = 1:lights
    // !! L.158: Unknown function kiks_spawn_object not converted, original calling sequence used
    kiks_spawn_object([lx(l),ly(l)],1);
  end;

  objs = size(px);
  for p = 1:objs
    // !! L.163: Unknown function kiks_spawn_object not converted, original calling sequence used
    kiks_spawn_object([px(p),py(p)],2);
  end;

  objs = size(cx);
  for p = 1:objs
    // !! L.168: Unknown function kiks_spawn_object not converted, original calling sequence used
    kiks_spawn_object([cx(p),cy(p)],3);
  end;
end;

KIKS_2DVISUALIZE = oldvis;
if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
  // !! L.174: Unknown function kiks_arena_window_open not converted, original calling sequence used
  kiks_arena_window_open;
end;
endfunction
