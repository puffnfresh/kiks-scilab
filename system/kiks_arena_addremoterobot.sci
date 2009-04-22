function [] = kiks_arena_addremoterobo(xpos,ypos)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MMPERPIXEL","KIKS_ROBOT_RADIUS","KIKS_COLOR_ROBOT","KIKS_RBTMASK_COL","KIKS_ARENA_COLORMASK");

[rows,cols] = size(mtlb_double(KIKS_RBTMASK_COL));
//size(KIKS_RBTMASK_COL)
minx = mtlb_s(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));// xpos - robot radius
miny = mtlb_s(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));// ypos - robot radius
maxx = mtlb_a(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
maxy = mtlb_a(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));

KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_a(mtlb_double(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_RBTMASK_COL));
endfunction
