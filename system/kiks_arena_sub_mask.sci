function [] = kiks_arena_sub_mask(xpos,ypos,color,theRadius)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
// TODO: cache downsampled matrixes
global("KIKS_ROUND_COLORMASK_CELL","KIKS_ROUND_MASK_CELL","KIKS_ROUND_MASK","KIKS_MMPERPIXEL","KIKS_ARENA_MASK","KIKS_ARENA_COLORMASK");
r = mtlb_a(floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL))*2,1);
if mtlb_logic(r,">",100) then
  error("Object too large");
end;
binary_mask = KIKS_ROUND_MASK_CELL(r).entries;
// ! L.13: mtlb(KIKS_ROUND_COLORMASK_CEL) can be replaced by KIKS_ROUND_COLORMASK_CEL() or KIKS_ROUND_COLORMASK_CEL whether KIKS_ROUND_COLORMASK_CEL is an M-file or not
// !! L.13: Unknown function KIKS_ROUND_COLORMASK_CEL not converted, original calling sequence used
color_mask = KIKS_ROUND_COLORMASK_CEL((r).entries);

minx = mtlb_s(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));// xpos - object radius
miny = mtlb_s(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));// ypos - object radius
maxx = mtlb_a(floor(mtlb_double(xpos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
maxy = mtlb_a(floor(mtlb_double(ypos)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));

KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(binary_mask));
KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx)) = mtlb_s(mtlb_double(KIKS_ARENA_COLORMASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(color_mask));
endfunction
