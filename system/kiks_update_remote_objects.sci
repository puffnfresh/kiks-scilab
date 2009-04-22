function [] = kiks_update_remote_objec()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_OBJECT_BALL_MASK_COL","KIKS_OBJECT_BALL_RADIUS","KIKS_OBJECT_SMALLBALL_MASK","KIKS_OBJECT_SMALLBALL_RADIUS","KIKS_ARENA_MASK","KIKS_ARENA_COLORMASK","KIKS_OBJECT_SMALLBALL_MASK_COL","KIKS_REMOTE_OBJECTS_BALL","KIKS_REMOTE_OBJECTS_CYLINDER","KIKS_2DVISUALIZE","KIKS_CYLINDER_HDL","KIKS_OBJECT_SMALLBALL","KIKS_OBJECT_BALL","KIKS_BALL_HDL","KIKS_LIGHT_HDL","KIKS_LIGHTARRAY","KIKS_MMPERPIXEL","KIKS_LIGHTDATA","KIKS_OBJECT_LIGHT","KIKS_WALL_RENDER","KIKS_WALL_WIDTH","KIKS_REMOTE_OBJECTS_ARRAY_NEW","KIKS_REMOTE_OBJECTS_ARRAY","KIKS_REMOTE_OBJECTS_LIGHTS","KIKS_REMOTE_OBJECTS_BALLS","KIKS_REMOTE_OBJECTS_CYLINDERS");
// ! L.8: mtlb(KIKS_REMOTE_OBJECTS_LIGH) can be replaced by KIKS_REMOTE_OBJECTS_LIGH() or KIKS_REMOTE_OBJECTS_LIGH whether KIKS_REMOTE_OBJECTS_LIGH is an M-file or not

if isempty(mtlb(KIKS_REMOTE_OBJECTS_LIGH)) then KIKS_REMOTE_OBJECTS_LIGH = 0;end;
if isempty(KIKS_REMOTE_OBJECTS_BALL) then KIKS_REMOTE_OBJECTS_BALL = 0;end;
// ! L.10: mtlb(KIKS_REMOTE_OBJECTS_CYLI) can be replaced by KIKS_REMOTE_OBJECTS_CYLI() or KIKS_REMOTE_OBJECTS_CYLI whether KIKS_REMOTE_OBJECTS_CYLI is an M-file or not

if isempty(mtlb(KIKS_REMOTE_OBJECTS_CYLI)) then KIKS_REMOTE_OBJECTS_CYLI = 0;end;
lights = 0;
balls = 0;
cylinders = 0;
// ! L.14: mtlb(KIKS_REMOTE_OBJECTS_ARRA) can be replaced by KIKS_REMOTE_OBJECTS_ARRA() or KIKS_REMOTE_OBJECTS_ARRA whether KIKS_REMOTE_OBJECTS_ARRA is an M-file or not
[vectorsize,tmp] = size(mtlb_double(mtlb(KIKS_REMOTE_OBJECTS_ARRA)));
step = 0;
while step<vectorsize
  step = step+1;
  // ! L.18: mtlb(KIKS_REMOTE_OBJECTS_ARRA) can be replaced by KIKS_REMOTE_OBJECTS_ARRA() or KIKS_REMOTE_OBJECTS_ARRA whether KIKS_REMOTE_OBJECTS_ARRA is an M-file or not
  // !! L.18: Unknown function KIKS_REMOTE_OBJECTS_ARRA not converted, original calling sequence used
  type = KIKS_REMOTE_OBJECTS_ARRA(step);
  step = step+1;
  // ! L.20: mtlb(KIKS_REMOTE_OBJECTS_ARRA) can be replaced by KIKS_REMOTE_OBJECTS_ARRA() or KIKS_REMOTE_OBJECTS_ARRA whether KIKS_REMOTE_OBJECTS_ARRA is an M-file or not
  // !! L.20: Unknown function KIKS_REMOTE_OBJECTS_ARRA not converted, original calling sequence used
  radius = KIKS_REMOTE_OBJECTS_ARRA(step);
  step = step+1;
  // ! L.22: mtlb(KIKS_REMOTE_OBJECTS_ARRA) can be replaced by KIKS_REMOTE_OBJECTS_ARRA() or KIKS_REMOTE_OBJECTS_ARRA whether KIKS_REMOTE_OBJECTS_ARRA is an M-file or not
  // !! L.22: Unknown function KIKS_REMOTE_OBJECTS_ARRA not converted, original calling sequence used
  xp = KIKS_REMOTE_OBJECTS_ARRA(step);
  step = step+1;
  // ! L.24: mtlb(KIKS_REMOTE_OBJECTS_ARRA) can be replaced by KIKS_REMOTE_OBJECTS_ARRA() or KIKS_REMOTE_OBJECTS_ARRA whether KIKS_REMOTE_OBJECTS_ARRA is an M-file or not
  // !! L.24: Unknown function KIKS_REMOTE_OBJECTS_ARRA not converted, original calling sequence used
  yp = KIKS_REMOTE_OBJECTS_ARRA(step);
  if mtlb_logic(mtlb_double(type),"==",1) then
    lights = lights+1;
    if lights>KIKS_REMOTE_OBJECTS_LIGH then
      KIKS_LIGHT_HDL = mtlb_i(KIKS_LIGHT_HDL,lights,kiks_patch_light(lights));
      KIKS_LIGHTARRAY = [KIKS_LIGHTARRAY,lights];
      KIKS_REMOTE_OBJECTS_LIGH = lights;
    end;
    kx = mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL);
    ky = mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL);
    KIKS_LIGHTDATA(lights,1) = xp;
    KIKS_LIGHTDATA(lights,2) = yp;
    // !! L.36: Matlab function set not yet converted, original calling sequence used
    // L.36: Name conflict: function name changed from set to %set
    %set(mtlb_e(KIKS_LIGHT_HDL,lights),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_LIGHT(1,:)),kx),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_LIGHT(2,:)),ky),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)));
  elseif mtlb_logic(mtlb_double(type),"==",2) then
    balls = balls+1;
    if mtlb_logic(balls,">",mtlb_double(KIKS_REMOTE_OBJECTS_BALL)) then
      KIKS_REMOTE_OBJECTS_BALL(balls,1) = 0;
      KIKS_REMOTE_OBJECTS_BALL(balls,2) = 0;
      KIKS_BALL_HDL = mtlb_i(KIKS_BALL_HDL,balls,kiks_patch_ball(balls));
      KIKS_REMOTE_OBJECTS_BALL = balls;
    end;
    oldxp = KIKS_REMOTE_OBJECTS_BALL(balls,1);
    oldyp = KIKS_REMOTE_OBJECTS_BALL(balls,2);
    kx = mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL);
    ky = mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL);
    if bool2s(mtlb_logic(mtlb_double(xp),"~=",oldxp))|bool2s(mtlb_logic(mtlb_double(yp),"~=",oldyp)) then
      // !! L.50: Matlab function set not yet converted, original calling sequence used
      // L.50: Name conflict: function name changed from set to %set
      %set(mtlb_e(KIKS_BALL_HDL,balls),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_BALL(1,:)),kx),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_BALL(2,:)),ky),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)));
      if bool2s(oldxp~=0)&bool2s(oldyp~=0) then
        minx = mtlb_s(floor(oldxp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
        miny = mtlb_s(floor(oldyp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
        maxx = mtlb_a(floor(oldxp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
        maxy = mtlb_a(floor(oldyp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
        // ! L.56: mtlb(KIKS_OBJECT_BALL_MASK_CO) can be replaced by KIKS_OBJECT_BALL_MASK_CO() or KIKS_OBJECT_BALL_MASK_CO whether KIKS_OBJECT_BALL_MASK_CO is an M-file or not
        KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_BALL_MASK_CO)));
      end;
    
      minx = mtlb_s(floor(mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
      miny = mtlb_s(floor(mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
      maxx = mtlb_a(floor(mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
      maxy = mtlb_a(floor(mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_BALL_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
      // ! L.63: mtlb(KIKS_OBJECT_BALL_MASK_CO) can be replaced by KIKS_OBJECT_BALL_MASK_CO() or KIKS_OBJECT_BALL_MASK_CO whether KIKS_OBJECT_BALL_MASK_CO is an M-file or not
      KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_a(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)),mtlb_double(mtlb(KIKS_OBJECT_BALL_MASK_CO)));
    end;
  
    KIKS_REMOTE_OBJECTS_BALL(balls,1) = xp;
    KIKS_REMOTE_OBJECTS_BALL(balls,2) = yp;
  elseif mtlb_logic(mtlb_double(type),"==",3) then
    cylinders = cylinders+1;
    if cylinders>KIKS_REMOTE_OBJECTS_CYLI then
      KIKS_REMOTE_OBJECTS_CYLI(cylinders,1) = 0;
      KIKS_REMOTE_OBJECTS_CYLI(cylinders,2) = 0;
      KIKS_CYLINDER_HDL = mtlb_i(KIKS_CYLINDER_HDL,cylinders,kiks_patch_ball(cylinders));
      KIKS_REMOTE_OBJECTS_CYLI = cylinders;
    end;
    oldxp = KIKS_REMOTE_OBJECTS_CYLI(cylinders,1);
    oldyp = KIKS_REMOTE_OBJECTS_CYLI(cylinders,2);
    kx = mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL);
    ky = mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL);
    if bool2s(mtlb_logic(mtlb_double(xp),"~=",oldxp))|bool2s(mtlb_logic(mtlb_double(yp),"~=",oldyp)) then
      // !! L.81: Matlab function set not yet converted, original calling sequence used
      // L.81: Name conflict: function name changed from set to %set
      %set(mtlb_e(KIKS_CYLINDER_HDL,cylinders),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_SMALLBALL(1,:)),kx),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_SMALLBALL(2,:)),ky),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)));
      if bool2s(oldxp~=0)&bool2s(oldyp~=0) then
        // ! L.83: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
        minx = mtlb_s(floor(oldxp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
        // ! L.84: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
        miny = mtlb_s(floor(oldyp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
        // ! L.85: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
        maxx = mtlb_a(floor(oldxp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
        // ! L.86: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
        maxy = mtlb_a(floor(oldyp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
        // ! L.87: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
        KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
      end;
    
      // ! L.90: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
      minx = mtlb_s(floor(mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
      // ! L.91: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
      miny = mtlb_s(floor(mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
      // ! L.92: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
      maxx = mtlb_a(floor(mtlb_double(xp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
      // ! L.93: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
      maxy = mtlb_a(floor(mtlb_double(yp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_RA))/mtlb_double(KIKS_MMPERPIXEL)));
      // ! L.94: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
      KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_a(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
    end;
    KIKS_REMOTE_OBJECTS_CYLI(cylinders,1) = xp;
    KIKS_REMOTE_OBJECTS_CYLI(cylinders,2) = yp;
  end;
end;



endfunction
