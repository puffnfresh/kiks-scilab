function [] = kiks_draw_robot(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_FIRE_HDL","KIKS_GRIPPER_L_HDL","KIKS_GRIPPER_R_HDL","KIKS_GRIPPER_HDL","KIKS_MMPERPIXEL","KIKS_NR_HDL","KIKS_LINVIS_GR_HDL","KIKS_LINVIS_HDL","KIKS_ROBOT_MATRIX","KIKS_RBT_BODY","KIKS_RBT_LAMP","KIKS_RBT_DIOD","KIKS_RBT_HDL","KIKS_RBTSENS_HDL","KIKS_RBTWHL_HDL","KIKS_RBTLMP_HDL","KIKS_RBTDIOD_HDL","KIKS_WALL_WIDTH","KIKS_WALL_RENDER","KIKS_PROX_DIR","KIKS_PROX_ANG");
global("KIKS_ROBOT_DATA","KIKS_GRIPPER_ACTIVE","KIKS_GRIPPER_XCOORD","KIKS_GRIPPER_YCOORD","KIKS_GRIPPER_GRP_XCOORD","KIKS_GRIPPER_GRP_YCOORD");

KIKS_WALL_WIDTH_SCALED = mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL);
KIKS_WALL_RENDER_SCALED = mtlb_double(KIKS_WALL_RENDER)/mtlb_double(KIKS_MMPERPIXEL);

// !! L.13: Matlab function set not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from set to %set
%set(mtlb_e(KIKS_FIRE_HDL,1),"Visible","off");

kx = mtlb_double(KIKS_ROBOT_MATRIX(id,1,1))/mtlb_double(KIKS_MMPERPIXEL);
ky = mtlb_double(KIKS_ROBOT_MATRIX(id,1,2))/mtlb_double(KIKS_MMPERPIXEL);

if isempty(KIKS_GRIPPER_ACTIVE) then
  // !! L.19: Matlab function set not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_RBT_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a((mtlb_double(KIKS_ROBOT_DATA(2,2))/mtlb_double(KIKS_MMPERPIXEL))*mtlb_double(KIKS_RBT_BODY(1,:)),kx),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a((mtlb_double(KIKS_ROBOT_DATA(2,2))/mtlb_double(KIKS_MMPERPIXEL))*mtlb_double(KIKS_RBT_BODY(2,:)),ky),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
else
  // !! L.21: Matlab function set not yet converted, original calling sequence used
  // L.21: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_RBT_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(kx,mtlb_double(KIKS_RBT_BODY(1,:))*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-mtlb_double(KIKS_RBT_BODY(2,:))*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(ky,mtlb_double(KIKS_RBT_BODY(1,:))*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+mtlb_double(KIKS_RBT_BODY(2,:))*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
end;

r = mtlb_s(mtlb_double(KIKS_ROBOT_DATA(2,2)),2);
q = mtlb_min(1,mtlb_double(KIKS_ROBOT_DATA(2,2))/29);

prox_xvals = mtlb_a((r/mtlb_double(KIKS_MMPERPIXEL))*cos(mtlb_s(mtlb_double(KIKS_PROX_ANG),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),mtlb_double(KIKS_ROBOT_MATRIX(id,1,1))/mtlb_double(KIKS_MMPERPIXEL));
prox_yvals = mtlb_a((r/mtlb_double(KIKS_MMPERPIXEL))*sin(mtlb_s(mtlb_double(KIKS_PROX_ANG),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),mtlb_double(KIKS_ROBOT_MATRIX(id,1,2))/mtlb_double(KIKS_MMPERPIXEL));
prox_dirs = mtlb_a(mtlb_double(KIKS_PROX_DIR),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)));

prox_xcord = [1,1,-2,-2]/mtlb_double(KIKS_MMPERPIXEL);
prox_ycord = [3,-3,-3,3]/mtlb_double(KIKS_MMPERPIXEL);

[tmp,sensors] = size(prox_xvals);

for sens = 1:sensors
  num = 0;
  pos_x = prox_xvals(sens);
  pos_y = prox_yvals(sens);
  coss = cos(-prox_dirs(sens));
  sins = sin(-prox_dirs(sens));
  // !! L.42: Matlab function set not yet converted, original calling sequence used
  // L.42: Name conflict: function name changed from set to %set
  %set(KIKS_RBTSENS_HDL(id,sens),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_s(prox_xcord*coss,prox_ycord*sins),pos_x),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_a(prox_xcord*sins,prox_ycord*coss),pos_y),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
end;
if ~isempty(KIKS_GRIPPER_ACTIVE) then
  // !! L.45: Matlab function set not yet converted, original calling sequence used
  // L.45: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_GRIPPER_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(kx,mtlb_double(KIKS_GRIPPER_XCOORD)*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-mtlb_double(KIKS_GRIPPER_YCOORD)*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(ky,mtlb_double(KIKS_GRIPPER_XCOORD)*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+mtlb_double(KIKS_GRIPPER_YCOORD)*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
  // !! L.46: Matlab function set not yet converted, original calling sequence used
  // L.46: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_GRIPPER_L_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(kx,mtlb_double(KIKS_GRIPPER_GRP_XCOORD)*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-mtlb_double(KIKS_GRIPPER_GRP_YCOORD)*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(ky,mtlb_double(KIKS_GRIPPER_GRP_XCOORD)*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+mtlb_double(KIKS_GRIPPER_GRP_YCOORD)*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
  // !! L.47: Matlab function set not yet converted, original calling sequence used
  // L.47: Name conflict: function name changed from set to %set
  %set(mtlb_e(KIKS_GRIPPER_R_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(kx,mtlb_double(KIKS_GRIPPER_GRP_XCOORD)*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-(-mtlb_double(KIKS_GRIPPER_GRP_YCOORD))*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(ky,mtlb_double(KIKS_GRIPPER_GRP_XCOORD)*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+(-mtlb_double(KIKS_GRIPPER_GRP_YCOORD))*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
end;

cam_xcoord = [-10*q,10*q,10*q,-10*q]/mtlb_double(KIKS_MMPERPIXEL);
cam_ycoord = [-10*q,-10*q,10*q,10*q]/mtlb_double(KIKS_MMPERPIXEL);
// !! L.52: Matlab function set not yet converted, original calling sequence used
// L.52: Name conflict: function name changed from set to %set
%set(mtlb_e(KIKS_LINVIS_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(kx,cam_xcoord*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-cam_ycoord*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(ky,cam_xcoord*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+cam_ycoord*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));

gr_xcoord = [-20*q,-10*q,-10*q,-20*q]/mtlb_double(KIKS_MMPERPIXEL);
gr_ycoord = [-8*q,-8*q,8*q,8*q]/mtlb_double(KIKS_MMPERPIXEL);
// !! L.56: Matlab function set not yet converted, original calling sequence used
// L.56: Name conflict: function name changed from set to %set
%set(mtlb_e(KIKS_LINVIS_GR_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(kx,gr_xcoord*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-gr_ycoord*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(ky,gr_xcoord*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+gr_ycoord*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));

inner = mtlb_s(floor(mtlb_double(KIKS_ROBOT_DATA(2,1))/2),2);
outer = ceil(mtlb_double(KIKS_ROBOT_DATA(2,1))/2);
whl_xcoord = [0,-7,-7,7,7,0,0,7,7,-7,-7,0]/mtlb_double(KIKS_MMPERPIXEL);
whl_ycoord = [-inner,-inner,-outer,-outer,-inner,-inner,inner,inner,outer,outer,inner,inner]/mtlb_double(KIKS_MMPERPIXEL);
// !! L.62: Matlab function set not yet converted, original calling sequence used
// L.62: Name conflict: function name changed from set to %set
%set(mtlb_e(KIKS_RBTWHL_HDL,id),"xdata",mtlb_a(mtlb_s(mtlb_a(whl_xcoord*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))-whl_ycoord*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))),kx),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(whl_xcoord*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))+whl_ycoord*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))),ky),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));

// !! L.64: Matlab function set not yet converted, original calling sequence used
// L.64: Name conflict: function name changed from set to %set
%set(KIKS_RBTDIOD_HDL(id,1),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_a(((22*q)/mtlb_double(KIKS_MMPERPIXEL))*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))+%pi/6),mtlb_double(KIKS_RBT_DIOD(1,:))),kx),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_a(((22*q)/mtlb_double(KIKS_MMPERPIXEL))*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))+%pi/6),mtlb_double(KIKS_RBT_DIOD(2,:))),ky),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
// !! L.65: Matlab function set not yet converted, original calling sequence used
// L.65: Name conflict: function name changed from set to %set
%set(KIKS_RBTDIOD_HDL(id,2),"xdata",mtlb_a(mtlb_s(mtlb_a(mtlb_a(((22*q)/mtlb_double(KIKS_MMPERPIXEL))*cos(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))+%pi/6+%pi/12),mtlb_double(KIKS_RBT_DIOD(1,:))),kx),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)),"ydata",mtlb_a(mtlb_s(mtlb_a(mtlb_a(((22*q)/mtlb_double(KIKS_MMPERPIXEL))*sin(-mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))+%pi/6+%pi/12),mtlb_double(KIKS_RBT_DIOD(2,:))),ky),floor(KIKS_WALL_WIDTH_SCALED)),floor(KIKS_WALL_RENDER_SCALED)));
endfunction
