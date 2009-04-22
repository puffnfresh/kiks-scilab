function [] = kiks_draw_remoterobot(id,kx,ky,ang,n,r)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_MMPERPIXEL","KIKS_ARENA_HDL","KIKS_REMOTEKHEPDIOD_HDL","KIKS_REMOTEKHEPWHL_HDL","KIKS_REMOTEKHEP_HDL","KIKS_MMPERPIXEL","KIKS_NR_HDL","KIKS_LINVIS_GR_HDL","KIKS_LINVIS_HDL","KIKS_ROBOT_MATRIX","KIKS_RBT_BODY","KIKS_RBT_LAMP","KIKS_RBT_DIOD","KIKS_RBT_HDL","KIKS_RBTSENS_HDL","KIKS_RBTWHL_HDL","KIKS_RBTLMP_HDL","KIKS_RBTDIOD_HDL","KIKS_WALL_WIDTH","KIKS_WALL_RENDER","KIKS_PROX_DIR","KIKS_PROX_ANG");

scale = mtlb_double(r)/29;

KIKS_WALL_WIDTH_SCALED = mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL);
KIKS_WALL_RENDER_SCALED = mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL);

if ~isempty(n) then
  // !! L.15: Unknown function kiks_remotekheppatch not converted, original calling sequence used
  KIKS_REMOTEKHEP_HDL = mtlb_i(KIKS_REMOTEKHEP_HDL,id,kiks_remotekheppatch(id));
  // !! L.16: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.16: Matlab function patch not yet converted, original calling sequence used
  KIKS_REMOTEKHEPWHL_HDL = mtlb_i(KIKS_REMOTEKHEPWHL_HDL,id,patch("Facecolor",[0.5,0.5,0.6],"EdgeColor","none","Erase","xor","tag",sprintf("remoteKhep %d",id)));
  // !! L.17: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.17: Matlab function patch not yet converted, original calling sequence used
  KIKS_REMOTEKHEPDIOD_HDL(id,1) = patch("Facecolor",[0.5,0.5,0.6],"EdgeColor","none","Erase","xor","tag",sprintf("remoteKhep %d",id));
  // !! L.18: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.18: Matlab function patch not yet converted, original calling sequence used
  KIKS_REMOTEKHEPDIOD_HDL(id,2) = patch("Facecolor",[0.5,0.5,0.6],"EdgeColor","none","Erase","xor","tag",sprintf("remoteKhep %d",id));
end;

// ! L.21: mtlb($) can be replaced by $() or $ whether $ is an M-file or not
// ! L.21: mtlb($) can be replaced by $() or $ whether $ is an M-file or not
// !! L.21: Matlab function set not yet converted, original calling sequence used
// L.21: Name conflict: function name changed from set to %set
%set(mtlb_e(KIKS_REMOTEKHEP_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_RBT_BODY(1,mtlb_imp(1,3,mtlb_double(mtlb($)))))*(mtlb_double(r)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(kx)/mtlb_double(KIKS_MMPERPIXEL))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_double(KIKS_RBT_BODY(2,mtlb_imp(1,3,mtlb_double(mtlb($)))))*(mtlb_double(r)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(ky)/mtlb_double(KIKS_MMPERPIXEL))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));

whl_xcoord = ([-15,-15,20]/mtlb_double(KIKS_MMPERPIXEL))*scale;
whl_ycoord = ([-10,10,0]/mtlb_double(KIKS_MMPERPIXEL))*scale;
// !! L.25: Matlab function set not yet converted, original calling sequence used
// L.25: Name conflict: function name changed from set to %set
%set(mtlb_e(KIKS_REMOTEKHEPWHL_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_s(whl_xcoord*cos(-mtlb_double(ang)),whl_ycoord*sin(-mtlb_double(ang))),floor(mtlb_double(kx)/mtlb_double(KIKS_MMPERPIXEL))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_a(whl_xcoord*sin(-mtlb_double(ang)),whl_ycoord*cos(-mtlb_double(ang))),floor(mtlb_double(ky)/mtlb_double(KIKS_MMPERPIXEL))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
endfunction
