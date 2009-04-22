function [] = kiks_pushobj_test(id,runtime)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_OBJECT_SMALLBALL_RADIUS","KIKS_WALL_WIDTH","KIKS_SPDC","KIKS_BALLDATA","KIKS_BALLARRAY","KIKS_OBJECT_BALL_RADIUS","KIKS_ROBOT_MATRIX");

[rows,cols] = size(mtlb_double(KIKS_BALLARRAY));

for i = 1:cols
  cylinder = KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),5);
  theRadius = KIKS_OBJECT_BALL_RADIUS;
  if cylinder then // ! L.14: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
   theRadius = mtlb(KIKS_OBJECT_SMALLBALL_RA);end;
  x = [mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),1))-mtlb_double(KIKS_ROBOT_MATRIX(id,1,1)),mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),2))-mtlb_double(KIKS_ROBOT_MATRIX(id,1,2))];
  if mtlb_logic(norm(x),"<=",mtlb_a(mtlb_a(mtlb_double(KIKS_ROBOT_MATRIX(id,2,2)),mtlb_double(theRadius)),1)) then
    kspd = mean([KIKS_ROBOT_MATRIX(id,1,5),KIKS_ROBOT_MATRIX(id,1,6)],"m")*mtlb_double(KIKS_SPDC);
    kvec = [(cos(mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))*mean([KIKS_ROBOT_MATRIX(id,1,5),KIKS_ROBOT_MATRIX(id,1,6)],"m"))*mtlb_double(KIKS_SPDC),-(sin(mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))*mean([KIKS_ROBOT_MATRIX(id,1,5),KIKS_ROBOT_MATRIX(id,1,6)],"m"))*mtlb_double(KIKS_SPDC)];
    kiks_calculate_ballspd(mtlb_e(KIKS_BALLARRAY,i),kvec,kspd,x/norm(x));
  end;
end;
endfunction
