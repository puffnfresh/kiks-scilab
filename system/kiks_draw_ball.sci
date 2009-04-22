function [] = kiks_draw_ball(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MMPERPIXEL","KIKS_OBJECT_BALL","KIKS_OBJECT_SMALLBALL","KIKS_BALL_HDL","KIKS_BALLDATA","KIKS_2DVISUALIZE","KIKS_WALL_WIDTH","KIKS_WALL_RENDER");

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),"==",0) then return;end;// no need to draw if the arena isn''t being shown

kx = mtlb_double(KIKS_BALLDATA(id,1))/mtlb_double(KIKS_MMPERPIXEL);
ky = mtlb_double(KIKS_BALLDATA(id,2))/mtlb_double(KIKS_MMPERPIXEL);
cylinder = KIKS_BALLDATA(id,5);

if cylinder then
  // !! L.16: Matlab function set not yet converted, original calling sequence used
  // L.16: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_BALL_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_SMALLBALL(1,:)),kx),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_SMALLBALL(2,:)),ky),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)));
else
  // !! L.18: Matlab function set not yet converted, original calling sequence used
  // L.18: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_BALL_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_BALL(1,:)),kx),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_OBJECT_BALL(2,:)),ky),mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL)),mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL)));
end;
endfunction
