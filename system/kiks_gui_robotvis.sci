function [] = kiks_gui_robotvis(id)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_FIRE_HDL","KIKS_GRIPPER_L_HDL","KIKS_GRIPPER_R_HDL","KIKS_GRIPPER_HDL","KIKS_NR_HDL","KIKS_LINVIS_GR_HDL","KIKS_LINVIS_HDL","KIKS_RBT_HDL","KIKS_RBTSENS_HDL","KIKS_RBTWHL_HDL","KIKS_RBTLMP_HDL","KIKS_RBTDIOD_HDL");
for j = 1:8
  // !! L.9: Unknown function kiks_robotsenspatch not converted, original calling sequence used
  KIKS_RBTSENS_HDL(id,j) = kiks_robotsenspatch(id,j);
end;
// !! L.11: Unknown function kiks_robotdiodpatch not converted, original calling sequence used
KIKS_RBTDIOD_HDL(id,1) = kiks_robotdiodpatch(id,[0.8,0.9,0.8]);
// !! L.12: Unknown function kiks_robotdiodpatch not converted, original calling sequence used
KIKS_RBTDIOD_HDL(id,2) = kiks_robotdiodpatch(id,[0.8,0.9,0.8]);
// !! L.13: Unknown function kiks_robotwheelpatch not converted, original calling sequence used
KIKS_RBTWHL_HDL = mtlb_i(KIKS_RBTWHL_HDL,id,kiks_robotwheelpatch(id));
// !! L.14: Matlab function sprintf not yet converted, original calling sequence used
// !! L.14: Matlab function patch not yet converted, original calling sequence used
KIKS_GRIPPER_HDL = mtlb_i(KIKS_GRIPPER_HDL,id,patch("Facecolor",[0.3,0.3,0.3],"EdgeColor","none","Erase","xor","tag",sprintf("@kheppatch %d",id)));
// !! L.15: Matlab function sprintf not yet converted, original calling sequence used
// !! L.15: Matlab function patch not yet converted, original calling sequence used
KIKS_GRIPPER_L_HDL = mtlb_i(KIKS_GRIPPER_L_HDL,id,patch("Facecolor",[0.3,0.3,0.3],"EdgeColor","none","Erase","xor","tag",sprintf("@kheppatch %d",id)));
// !! L.16: Matlab function sprintf not yet converted, original calling sequence used
// !! L.16: Matlab function patch not yet converted, original calling sequence used
KIKS_GRIPPER_R_HDL = mtlb_i(KIKS_GRIPPER_R_HDL,id,patch("Facecolor",[0.3,0.3,0.3],"EdgeColor","none","Erase","xor","tag",sprintf("@kheppatch %d",id)));
// !! L.17: Unknown function kiks_robotpatch not converted, original calling sequence used
KIKS_RBT_HDL = mtlb_i(KIKS_RBT_HDL,id,kiks_robotpatch(id));
// !! L.18: Unknown function kiks_robotlmppatch not converted, original calling sequence used
KIKS_RBTLMP_HDL = mtlb_i(KIKS_RBTLMP_HDL,id,kiks_robotlmppatch(id));
// !! L.19: Matlab function sprintf not yet converted, original calling sequence used
// !! L.19: Matlab function patch not yet converted, original calling sequence used
KIKS_LINVIS_HDL = mtlb_i(KIKS_LINVIS_HDL,id,patch("Facecolor",[0.25,0.3,0.35],"EdgeColor","none","Erase","xor","tag",sprintf("@kheppatch %d",id)));
// !! L.20: Matlab function sprintf not yet converted, original calling sequence used
// !! L.20: Matlab function patch not yet converted, original calling sequence used
KIKS_LINVIS_GR_HDL = mtlb_i(KIKS_LINVIS_GR_HDL,id,patch("Facecolor",[0.5,0.65,0.6],"EdgeColor","none","Erase","xor","tag",sprintf("@kheppatch %d",id)));
// !! L.21: Matlab function sprintf not yet converted, original calling sequence used
// !! L.21: Matlab function patch not yet converted, original calling sequence used
KIKS_FIRE_HDL = mtlb_i(KIKS_FIRE_HDL,id,patch("Visible","off","Facecolor",[1,0.4,0.4],"EdgeColor","none","Erase","xor","tag",sprintf("@kheppatch %d",id)));
endfunction
