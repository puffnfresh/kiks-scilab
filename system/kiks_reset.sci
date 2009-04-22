function [res] = kiks_reset(rndobjects)

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_COLOR_ROBOT","KIKS_ROBOT_MATRIX","KIKS_OBJECT_BALL","KIKS_OBJECT_SMALLBALL","KIKS_BALLDATA","KIKS_RBTARRAY","KIKS_BALLARRAY","KIKS_ROUNDOBJARRAY","KIKS_LIGHTARRAY","KIKS_LIGHTDATA");
global("KIKS_CHK_ROBOT_MATRIX","KIKS_CHK_OBJECT_BALL","KIKS_CHK_OBJECT_SMALLBALL","KIKS_CHK_BALLDATA","KIKS_CHK_KHEPARRAY","KIKS_CHK_BALLARRAY","KIKS_CHK_ROUNDOBJARRAY","KIKS_CHK_LIGHTARRAY","KIKS_CHK_LIGHTDATA");
global("KIKS_CHECKPOINT");

if ~isempty(KIKS_CHECKPOINT) then
  [rows,cols] = size(mtlb_double(KIKS_RBTARRAY));
  for i = 1:cols
    xp = floor(mtlb_double(KIKS_ROBOT_MATRIX(abs(mtlb_double(mtlb_e(KIKS_RBTARRAY,i))),1,1)));
    yp = floor(mtlb_double(KIKS_ROBOT_MATRIX(abs(mtlb_double(mtlb_e(KIKS_RBTARRAY,i))),1,2)));
    //kiks_arena_subrobot(abs(KIKS_RBTARRAY(i)),xp,yp);
    kiks_arena_sub_mask(xp,yp,KIKS_COLOR_ROBOT,KIKS_ROBOT_MATRIX(abs(mtlb_double(mtlb_e(KIKS_RBTARRAY,i))),2,2));
  end;
  [rows,cols] = size(mtlb_double(KIKS_BALLARRAY));
  for i = 1:cols
    id = mtlb_e(KIKS_BALLARRAY,i);
    xp = KIKS_BALLDATA(id,1);
    yp = KIKS_BALLDATA(id,2);
    kiks_arena_subball(id,floor(mtlb_double(xp)),floor(mtlb_double(yp)));
  end;

  KIKS_ROBOT_MATRIX = KIKS_CHK_ROBOT_MATRIX;
  KIKS_OBJECT_BALL = KIKS_CHK_OBJECT_BALL;
  // ! L.29: mtlb(KIKS_CHK_OBJECT_SMALLBAL) can be replaced by KIKS_CHK_OBJECT_SMALLBAL() or KIKS_CHK_OBJECT_SMALLBAL whether KIKS_CHK_OBJECT_SMALLBAL is an M-file or not
  KIKS_OBJECT_SMALLBALL = mtlb(KIKS_CHK_OBJECT_SMALLBAL);
  KIKS_BALLDATA = KIKS_CHK_BALLDATA;
  KIKS_RBTARRAY = KIKS_CHK_KHEPARRAY;
  KIKS_BALLARRAY = KIKS_CHK_BALLARRAY;
  KIKS_LIGHTARRAY = KIKS_CHK_LIGHTARRAY;
  KIKS_LIGHTDATA = KIKS_CHK_LIGHTDATA;

  [rows,cols] = size(mtlb_double(KIKS_RBTARRAY));
  for i = 1:cols
    xp = floor(mtlb_double(KIKS_ROBOT_MATRIX(abs(mtlb_double(mtlb_e(KIKS_RBTARRAY,i))),1,1)));
    yp = floor(mtlb_double(KIKS_ROBOT_MATRIX(abs(mtlb_double(mtlb_e(KIKS_RBTARRAY,i))),1,2)));
    //kiks_arena_addrobot(abs(KIKS_RBTARRAY(i)),xp,yp);
    kiks_arena_add_mask(xp,yp,KIKS_COLOR_ROBOT,KIKS_ROBOT_MATRIX(abs(mtlb_double(mtlb_e(KIKS_RBTARRAY,i))),2,2));
  
    kiks_draw_robot(mtlb_e(KIKS_RBTARRAY,i));
  end;
  [rows,cols] = size(mtlb_double(KIKS_BALLARRAY));
  for i = 1:cols
    id = mtlb_e(KIKS_BALLARRAY,i);
    xp = KIKS_BALLDATA(id,1);
    yp = KIKS_BALLDATA(id,2);
    kiks_arena_addball(id,floor(mtlb_double(xp)),floor(mtlb_double(yp)));
    kiks_draw_ball(mtlb_e(KIKS_BALLARRAY,i));
  end;
  [rows,cols] = size(mtlb_double(KIKS_LIGHTARRAY));
  for i = 1:cols
    id = mtlb_e(KIKS_LIGHTARRAY,i);
    xp = KIKS_LIGHTDATA(id,1);
    xy = KIKS_LIGHTDATA(id,1);
    kiks_draw_light(mtlb_e(KIKS_LIGHTARRAY,i));
  end;
end;
endfunction
