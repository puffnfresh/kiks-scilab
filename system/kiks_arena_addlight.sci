function [] = kiks_arena_addlight(id,xpos,ypos)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MMPERPIXEL","KIKS_OBJECT_LIGHT_MASK","KIKS_ARENA_MASK","KIKS_OBJECT_LIGHT_RADIUS");

[rows,cols] = size(mtlb_double(KIKS_OBJECT_LIGHT_MASK));

minx = mtlb_s(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_LIGHT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));// xpos - object radius
miny = mtlb_s(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_LIGHT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));// ypos - object radius
maxx = mtlb_a(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_LIGHT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));
maxy = mtlb_a(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_OBJECT_LIGHT_RADIUS)/mtlb_double(KIKS_MMPERPIXEL)));

KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_OBJECT_LIGHT_MASK));
endfunction
