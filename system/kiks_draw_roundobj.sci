function [] = kiks_draw_roundobj(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MMPERPIXEL","KIKS_2DVISUALIZE","KIKS_ROUNDOBJECT","KIKS_ROUNDOBJDATA","KIKS_ROUNDOBJ_HDL","KIKS_WALL_WIDTH","KIKS_WALL_RENDER");

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
  kx = mtlb_double(KIKS_ROUNDOBJDATA(id,1))/mtlb_double(KIKS_MMPERPIXEL);
  ky = mtlb_double(KIKS_ROUNDOBJDATA(id,2))/mtlb_double(KIKS_MMPERPIXEL);
  // !! L.12: Matlab function set not yet converted, original calling sequence used
  // L.12: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_ROUNDOBJ_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_ROUNDOBJECT(1,:)),kx),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_ROUNDOBJECT(2,:)),ky),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)));
end;
endfunction
