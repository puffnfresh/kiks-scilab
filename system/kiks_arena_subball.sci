function [] = kiks_arena_subball(id,xpos,ypos)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_OBJECT_SMALLBALL_RADIUS","KIKS_OBJECT_BALL_SMALLRATIO","KIKS_OBJECT_SMALLBALL_MASK","KIKS_OBJECT_SMALLBALL_MASK_COL","KIKS_BALLDATA","KIKS_MMPERPIXEL","KIKS_COLOR_BALL","KIKS_OBJECT_BALL_MASK","KIKS_OBJECT_BALL_MASK_COL","KIKS_ARENA_MASK","KIKS_ARENA_COLORMASK","KIKS_OBJECT_BALL_RADIUS");

[rows,cols] = size(mtlb_double(KIKS_OBJECT_BALL_MASK));
cylinder = KIKS_BALLDATA(id,5);
theRadius = KIKS_OBJECT_BALL_RADIUS;
if cylinder then // ! L.12: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
 theRadius = mtlb(KIKS_OBJECT_SMALLBALL_RA);end;
minx = mtlb_s(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));// xpos - object radius
miny = mtlb_s(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));// ypos - object radius
maxx = mtlb_a(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
maxy = mtlb_a(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));

if cylinder then
  // ! L.19: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
  KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
  // ! L.20: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
  KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
else
  KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_OBJECT_BALL_MASK));
  // ! L.23: mtlb(KIKS_OBJECT_BALL_MASK_CO) can be replaced by KIKS_OBJECT_BALL_MASK_CO() or KIKS_OBJECT_BALL_MASK_CO whether KIKS_OBJECT_BALL_MASK_CO is an M-file or not
  KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_BALL_MASK_CO)));
end;
endfunction
