function [res] = kiks_siminfo_setobject(row,x,y,spd,ang)

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// function res = kiks_siminfo_setobject(row,x,y,spd,ang)
// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
global("KIKS_2DVISUALIZE","KIKS_OBJECT_BALL_RADIUS","KIKS_OBJECT_BALL_SMALLRATIO","KIKS_ARENA_MASK","KIKS_OBJECT_SMALLBALL_MASK","KIKS_OBJECT_BALL_MASK","KIKS_MMPERPIXEL","KIKS_WALL_RENDER","KIKS_WALL_WIDTH","KIKS_LIGHTARRAY","KIKS_LIGHTDATA","KIKS_BALLARRAY","KIKS_BALLDATA")

[lrows,lcols] = size(mtlb_double(KIKS_LIGHTDATA));
[brows,bcols] = size(mtlb_double(KIKS_BALLDATA));

res = 1;

try 
  if mtlb_logic(mtlb_double(row),"<=",lrows) then // we''re manipulating a light source
   id = row;
   if ~isempty(x) then KIKS_LIGHTDATA(id,1) = mtlb_a(mtlb_double(x),mtlb_double(KIKS_WALL_WIDTH));end;
   if ~isempty(y) then KIKS_LIGHTDATA(id,2) = mtlb_a(mtlb_double(y),mtlb_double(KIKS_WALL_WIDTH));end;
   if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
     // !! L.20: Unknown function kiks_draw_light not converted, original calling sequence used
     kiks_draw_light(id);
   end;
  else // we''re manipulating a ball or cylinder
   id = mtlb_s(mtlb_double(row),lrows);
   oldx = KIKS_BALLDATA(id,1);
   nxp = oldx;
   oldy = KIKS_BALLDATA(id,2);
   nyp = oldy;
   cylinder = KIKS_BALLDATA(id,5);
   theRadius = KIKS_OBJECT_BALL_RADIUS;
   if cylinder then // ! L.30: mtlb(KIKS_OBJECT_BALL_SMALLRA) can be replaced by KIKS_OBJECT_BALL_SMALLRA() or KIKS_OBJECT_BALL_SMALLRA whether KIKS_OBJECT_BALL_SMALLRA is an M-file or not
    theRadius = mtlb_double(theRadius)*mtlb_double(mtlb(KIKS_OBJECT_BALL_SMALLRA));end;
   if ~isempty(x) then nxp = mtlb_a(mtlb_double(x),mtlb_double(KIKS_WALL_WIDTH));end;
   if ~isempty(y) then nyp = mtlb_a(mtlb_double(y),mtlb_double(KIKS_WALL_WIDTH));end;
  
   // detect collision
   minx = mtlb_s(floor(mtlb_double(nxp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL))); // xpos - robot radius
   miny = mtlb_s(floor(mtlb_double(nyp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL))); // ypos - robot radius
   maxx = mtlb_a(floor(mtlb_double(nxp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
   maxy = mtlb_a(floor(mtlb_double(nyp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
  
   if cylinder then
     // !! L.41: Unknown function mtlb_imp not converted, original calling sequence used
     // !! L.41: Unknown function mtlb_imp not converted, original calling sequence used
     // ! L.41: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
     map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
   else
     // !! L.43: Unknown function mtlb_imp not converted, original calling sequence used
     // !! L.43: Unknown function mtlb_imp not converted, original calling sequence used
     map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_OBJECT_BALL_MASK));
   end;
   coll = mtlb_max(mtlb_max(map,"m"),"m");
  
   if mtlb_logic(coll,"==",1) then
     // !! L.48: Unknown function kiks_arena_subball not converted, original calling sequence used
     kiks_arena_subball(id,floor(mtlb_double(oldx)),floor(mtlb_double(oldy)));
     KIKS_BALLDATA(id,1) = nxp;
     KIKS_BALLDATA(id,2) = nyp;
     // !! L.51: Unknown function kiks_arena_addball not converted, original calling sequence used
     kiks_arena_addball(id,floor(mtlb_double(KIKS_BALLDATA(id,1))),floor(mtlb_double(KIKS_BALLDATA(id,2))));
     if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
       // !! L.53: Unknown function kiks_draw_ball not converted, original calling sequence used
       kiks_draw_ball(id);
     end;
   else
     res = 0;
   end;
  
   if ~isempty(spd) then KIKS_BALLDATA(id,3) = spd;end; // speed (in mm/seconds)
   if ~isempty(ang) then KIKS_BALLDATA(id,4) = ang;end; // angle (in radians)
  end;
catch 
  res = 0;
end;
endfunction
