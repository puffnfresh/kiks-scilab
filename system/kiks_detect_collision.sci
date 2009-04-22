function [ret] = kiks_detect_collision(id,nonetwork)

// Ouput variables initialisation (not found in input variables)
ret=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
// collision detection

global("KIKS_REMOTE_ARRAY_NEW","KIKS_FID","KIKS_ARENA_MASK","KIKS_ROBOT_MATRIX","KIKS_RBTMASK","KIKS_REMOTE_OBJECTS_ARRAY_NEW","KIKS_NET_BUFSIZ","KIKS_MMPERPIXEL","KIKS_WALL_WIDTH","KIKS_GRIPPER_ACTIVE");// KIKS_GRIPPER_XCOORD KIKS_GRIPPER_YCOORD KIKS_GRIPPER_GRP_XCOORD KIKS_GRIPPER_GRP_YCOORD KIKS_GRIPPER_ARM_X KIKS_GRIPPER_ARM_Y KIKS_GRIPPER_LGRP_X KIKS_GRIPPER_LGRP_Y KIKS_GRIPPER_RGRP_X KIKS_GRIPPER_RGRP_Y;

if ~isempty(KIKS_GRIPPER_ACTIVE) then
  kiks_calculate_gripper(id);
end;

if %nargin<2 then
  nonetwork = [];
end;
ret = 1;
if mtlb_logic(mtlb_double(KIKS_FID),"==",-1) then
  [ys,xs] = size(mtlb_double(KIKS_ARENA_MASK));
  if ~isempty(KIKS_GRIPPER_ACTIVE) then
    // ! L.21: mtlb(KIKS_GRIPPER_ARM_X) can be replaced by KIKS_GRIPPER_ARM_X() or KIKS_GRIPPER_ARM_X whether KIKS_GRIPPER_ARM_X is an M-file or not
    // ! L.21: mtlb(KIKS_GRIPPER_LGRP_X) can be replaced by KIKS_GRIPPER_LGRP_X() or KIKS_GRIPPER_LGRP_X whether KIKS_GRIPPER_LGRP_X is an M-file or not
    // ! L.21: mtlb(KIKS_GRIPPER_RGRP_X) can be replaced by KIKS_GRIPPER_RGRP_X() or KIKS_GRIPPER_RGRP_X whether KIKS_GRIPPER_RGRP_X is an M-file or not
    grpxp = floor(mtlb_double([mtlb(KIKS_GRIPPER_ARM_X),mtlb(KIKS_GRIPPER_LGRP_X),mtlb(KIKS_GRIPPER_RGRP_X)]));
    // ! L.22: mtlb(KIKS_GRIPPER_ARM_Y) can be replaced by KIKS_GRIPPER_ARM_Y() or KIKS_GRIPPER_ARM_Y whether KIKS_GRIPPER_ARM_Y is an M-file or not
    // ! L.22: mtlb(KIKS_GRIPPER_LGRP_Y) can be replaced by KIKS_GRIPPER_LGRP_Y() or KIKS_GRIPPER_LGRP_Y whether KIKS_GRIPPER_LGRP_Y is an M-file or not
    // ! L.22: mtlb(KIKS_GRIPPER_RGRP_Y) can be replaced by KIKS_GRIPPER_RGRP_Y() or KIKS_GRIPPER_RGRP_Y whether KIKS_GRIPPER_RGRP_Y is an M-file or not
    grpyp = floor(mtlb_double([mtlb(KIKS_GRIPPER_ARM_Y),mtlb(KIKS_GRIPPER_LGRP_Y),mtlb(KIKS_GRIPPER_RGRP_Y)]));
    grppos = mtlb_a(mtlb_s(grpxp,1)*ys,grpyp);
    // ! L.24: abs(mtlb_double(mtlb_e(KIKS_ARENA_MASK,grppos))) may be replaced by:
    // !    --> mtlb_double(mtlb_e(KIKS_ARENA_MASK,grppos)) if mtlb_double(mtlb_e(KIKS_ARENA_MASK,grppos)) is real
    grpcoll = mtlb_find(abs(mtlb_double(mtlb_e(KIKS_ARENA_MASK,grppos))));
    if ~isempty(grpcoll) then
      ret = 2;  // TODO: indicate gripper collision so no rotation is performed
      return;
    end;
  end;
  minx = mtlb_s(floor(mtlb_double(KIKS_ROBOT_MATRIX(id,1,1))/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))/mtlb_double(KIKS_MMPERPIXEL)));  // xpos - robot radius
  miny = mtlb_s(floor(mtlb_double(KIKS_ROBOT_MATRIX(id,1,2))/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))/mtlb_double(KIKS_MMPERPIXEL)));  // ypos - robot radius
  maxx = mtlb_a(floor(mtlb_double(KIKS_ROBOT_MATRIX(id,1,1))/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))/mtlb_double(KIKS_MMPERPIXEL)));
  maxy = mtlb_a(floor(mtlb_double(KIKS_ROBOT_MATRIX(id,1,2))/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))/mtlb_double(KIKS_MMPERPIXEL)));

  KIKS_WALL_WIDTH_SCALED = mtlb_double(KIKS_WALL_WIDTH)/mtlb_double(KIKS_MMPERPIXEL);

  if bool2s(bool2s(bool2s(mtlb_logic(minx,"<",KIKS_WALL_WIDTH_SCALED))|bool2s(mtlb_logic(maxx,">",mtlb_s(xs,KIKS_WALL_WIDTH_SCALED))))|bool2s(mtlb_logic(miny,"<",KIKS_WALL_WIDTH_SCALED)))|bool2s(mtlb_logic(maxy,">",mtlb_s(ys,KIKS_WALL_WIDTH_SCALED))) then
    ret = 99;
    return;
  end;

  map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_RBTMASK));
  ret = mtlb_max(mtlb_max(map,"m"),"m");

  //ret = any(KIKS_ARENA_COLORMASK(miny:maxy, minx:maxx) & KIKS_RBTMASK_COL)+1;
else // let server handle collision detection
 // !! L.47: Unknown function kiks_server_request not converted, original calling sequence used
 sret = kiks_server_request(id);
 if ~isempty(sret) then
   if mtlb_logic(mtlb_double(mtlb_e(sret,1)),"==",asciimat("N")) then // server could not give us a position
    ret = 100;
    return;
   end;
   if mtlb_logic(mtlb_double(mtlb_e(sret,1)),"==",asciimat("O")) then
     // !! L.54: Matlab function sscanf not yet converted, original calling sequence used
     ret = [1;sscanf(sret,"OK %f %f")];
     // !! L.55: Matlab function sscanf not yet converted, original calling sequence used
     KIKS_REMOTE_ARRAY_NEW = sscanf(mtlb_e(sret,4:$),"%f");  // we''ve fetched the updated object array.
     KIKS_REMOTE_ARRAY_NEW = mtlb_e(KIKS_REMOTE_ARRAY_NEW,3:$);
     // !! L.57: Unknown function kiks_update_remote not converted, original calling sequence used
     kiks_update_remote;
     // !! L.58: Unknown function kiks_recieve_string not converted, original calling sequence used
     res = kiks_recieve_string(KIKS_FID);
     // !! L.59: Matlab function sscanf not yet converted, original calling sequence used
     KIKS_REMOTE_OBJECTS_ARRA = sscanf(mtlb_e(res,6:$),"%f");
     // ! L.60: mtlb(kiks_update_remote_objec) can be replaced by kiks_update_remote_objec() or kiks_update_remote_objec whether kiks_update_remote_objec is an M-file or not
     // !! L.60: Unknown function kiks_update_remote_objec not converted, original calling sequence used
     kiks_update_remote_objec;
   end;
 else // no response means that the connection to the server is gone.
  // !! L.63: Unknown function kiks_server_disconnect not converted, original calling sequence used
  kiks_server_disconnect;
  // !! L.64: Unknown function kiks_halt not converted, original calling sequence used
  kiks_halt;
  // !! L.65: Matlab function errordlg not yet converted, original calling sequence used
  errordlg("Connection to server lost.","KiKS network error");
 end;
end;
endfunction
