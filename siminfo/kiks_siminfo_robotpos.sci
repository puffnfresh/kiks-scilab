function [res] = kiks_siminfo_robotpos() 

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// [x,y,angle] = kiks_siminfo_robotpos(port);
// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------
global("KIKS_ROBOT_MATRIX","KIKS_WALL_WIDTH");
if ~isempty(KIKS_ROBOT_MATRIX) then
  res(1,1) = matrix(mtlb_s(mtlb_double(KIKS_ROBOT_MATRIX(1,1,1)),mtlb_double(KIKS_WALL_WIDTH)),1,-1);
  res(1,2) = matrix(mtlb_s(mtlb_double(KIKS_ROBOT_MATRIX(1,1,2)),mtlb_double(KIKS_WALL_WIDTH)),1,-1);
  res(3) = KIKS_ROBOT_MATRIX(1,1,3);
else
  res = [];
end;
endfunction
