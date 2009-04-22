function [] = kiks_spawn_object(pos,num)

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
global("KIKS_OBJECT_SMALLBALL_RADIUS","KIKS_OBJECT_BALL_SMALLRATIO","KIKS_ARENA_HDL","KIKS_MMPERPIXEL","KIKS_OBJECT_BALL_UPD","KIKS_OBJECT_BALL_RADIUS","KIKS_BALL_HDL","KIKS_BALLARRAY","KIKS_BALLDATA","KIKS_2DVISUALIZE","KIKS_LIGHTARRAY","KIKS_LIGHT_HDL","KIKS_LIGHTDATA","KIKS_ROUNDOBJARRAY","KIKS_ROUNDOBJDATA","KIKS_GUI_HDL","KIKS_WALL_WIDTH","KIKS_ARENA_MX","KIKS_ARENA_MASK");
if %nargin<2 then num = kiks_gui_getobjlistbox();end;

if mtlb_logic(mtlb_double(num),"==",1) then // light
 newobjid = 1;
 [rows,cols] = size(mtlb_double(KIKS_LIGHTARRAY));

 ok = 1;
 while ok==1
   ok = 0;
   for i = 1:cols
     if mtlb_logic(mtlb_double(mtlb_e(KIKS_LIGHTARRAY,i)),"==",newobjid) then
       ok = 1;
     end;
   end;
   if ok==1 then newobjid = newobjid+1;end;
 end;

 KIKS_LIGHTARRAY = mtlb_i(KIKS_LIGHTARRAY,cols+1,newobjid);

 [ys,xs] = size(mtlb_double(KIKS_ARENA_MASK));
 ys = ys*mtlb_double(KIKS_MMPERPIXEL);
 xs = xs*mtlb_double(KIKS_MMPERPIXEL);
 if bool2s(%nargin<1)|bool2s(isempty(pos)) then // place object at random position
  KIKS_LIGHTDATA(newobjid,1) = mtlb_a(mtlb_double(KIKS_WALL_WIDTH),mtlb_double(rand())*mtlb_s(xs,mtlb_double(KIKS_WALL_WIDTH)*2));
  KIKS_LIGHTDATA(newobjid,2) = mtlb_a(mtlb_double(KIKS_WALL_WIDTH),mtlb_double(rand())*mtlb_s(ys,mtlb_double(KIKS_WALL_WIDTH)*2));
  //KIKS_LIGHTDATA(newobjid,1)=KIKS_WALL_WIDTH+rand*(xs-KIKS_WALL_WIDTH*2);
  //KIKS_LIGHTDATA(newobjid,2)=KIKS_WALL_WIDTH+rand*(ys-KIKS_WALL_WIDTH*2);
  //while(max(max(KIKS_ARENA_MX(round(KIKS_LIGHTDATA(newobjid,2))-15:round(KIKS_LIGHTDATA(newobjid,2))+15,round(KIKS_LIGHTDATA(newobjid,1))-15:round(KIKS_LIGHTDATA(newobjid,1)+15))))>0 | max(max(KIKS_ARENA_MASK(round(KIKS_LIGHTDATA(newobjid,2))-15:round(KIKS_LIGHTDATA(newobjid,2))+15,round(KIKS_LIGHTDATA(newobjid,1))-15:round(KIKS_LIGHTDATA(newobjid,1)+15))))>0)
  //   KIKS_LIGHTDATA(newobjid,1)=KIKS_WALL_WIDTH+rand*(xs-KIKS_WALL_WIDTH*2);
  //   KIKS_LIGHTDATA(newobjid,2)=KIKS_WALL_WIDTH+rand*(ys-KIKS_WALL_WIDTH*2);
  //end
 else
   KIKS_LIGHTDATA(newobjid,1) = mtlb_a(mtlb_double(mtlb_e(pos,1)),mtlb_double(KIKS_WALL_WIDTH));
   KIKS_LIGHTDATA(newobjid,2) = mtlb_a(mtlb_double(mtlb_e(pos,2)),mtlb_double(KIKS_WALL_WIDTH));
 end;


 while mtlb_logic(mtlb_double(mtlb_max(mtlb_double(mtlb_max(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(floor((KIKS_LIGHTDATA(newobjid,2)-15)/mtlb_double(KIKS_MMPERPIXEL)),floor((KIKS_LIGHTDATA(newobjid,2)+15)/mtlb_double(KIKS_MMPERPIXEL))),mtlb_imp(floor((KIKS_LIGHTDATA(newobjid,1)-15)/mtlb_double(KIKS_MMPERPIXEL)),floor((KIKS_LIGHTDATA(newobjid,1)+15)/mtlb_double(KIKS_MMPERPIXEL))))),"m")),"m")),">",0)
   KIKS_LIGHTDATA(newobjid,1) = mtlb_a(mtlb_double(KIKS_WALL_WIDTH),mtlb_double(rand())*mtlb_s(xs,mtlb_double(KIKS_WALL_WIDTH)*2));
   KIKS_LIGHTDATA(newobjid,2) = mtlb_a(mtlb_double(KIKS_WALL_WIDTH),mtlb_double(rand())*mtlb_s(ys,mtlb_double(KIKS_WALL_WIDTH)*2));
 end;


 if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
   // !! L.51: Matlab function figure not yet converted
   // !! L.51: Matlab function figure not yet converted, original calling sequence used
   figure(KIKS_GUI_HDL);
   KIKS_LIGHT_HDL = mtlb_i(KIKS_LIGHT_HDL,newobjid,kiks_patch_light(newobjid));
   kiks_draw_light(newobjid);
 end;
 //   newxp = floor(KIKS_LIGHTDATA(newobjid,1));
 //   newyp = floor(KIKS_LIGHTDATA(newobjid,2));
 //   kiks_arena_addlight(newobjid,newxp,newyp);
elseif bool2s(mtlb_logic(mtlb_double(num),"==",2))|bool2s(mtlb_logic(mtlb_double(num),"==",3)) then // ball or cylinder2
 cylinder = mtlb_s(mtlb_double(num),2);
 newobjid = 1;
 [rows,cols] = size(mtlb_double(KIKS_BALLARRAY));

 ok = 1;
 while ok==1
   ok = 0;
   for i = 1:cols
     if mtlb_logic(mtlb_double(mtlb_e(KIKS_BALLARRAY,i)),"==",newobjid) then
       ok = 1;
     end;
   end;
   if ok==1 then newobjid = newobjid+1;end;
 end;

 KIKS_BALLARRAY = mtlb_i(KIKS_BALLARRAY,cols+1,newobjid);

 [ys,xs] = size(mtlb_double(KIKS_ARENA_MASK));
 ys = ys*mtlb_double(KIKS_MMPERPIXEL);
 xs = xs*mtlb_double(KIKS_MMPERPIXEL);
 if bool2s(%nargin<1)|bool2s(isempty(pos)) then // place object at random position
  //KIKS_BALLDATA(newobjid,1)=KIKS_WALL_WIDTH+rand*(xs-KIKS_WALL_WIDTH*2);
  //KIKS_BALLDATA(newobjid,2)=KIKS_WALL_WIDTH+rand*(ys-KIKS_WALL_WIDTH*2);
  //while(max(max(KIKS_ARENA_MX(round(KIKS_BALLDATA(newobjid,2))-KIKS_OBJECT_BALL_RADIUS:round(KIKS_BALLDATA(newobjid,2))+KIKS_OBJECT_BALL_RADIUS,round(KIKS_BALLDATA(newobjid,1))-KIKS_OBJECT_BALL_RADIUS:round(KIKS_BALLDATA(newobjid,1)+KIKS_OBJECT_BALL_RADIUS))))>0 | max(max(KIKS_ARENA_MASK(round(KIKS_BALLDATA(newobjid,2))-KIKS_OBJECT_BALL_RADIUS:round(KIKS_BALLDATA(newobjid,2))+KIKS_OBJECT_BALL_RADIUS,round(KIKS_BALLDATA(newobjid,1))-KIKS_OBJECT_BALL_RADIUS:round(KIKS_BALLDATA(newobjid,1)+KIKS_OBJECT_BALL_RADIUS))))>0)
  //   KIKS_BALLDATA(newobjid,1)=KIKS_WALL_WIDTH+rand*(xs-KIKS_WALL_WIDTH*2);
  //   KIKS_BALLDATA(newobjid,2)=KIKS_WALL_WIDTH+rand*(ys-KIKS_WALL_WIDTH*2);
  //end
 
  KIKS_BALLDATA(newobjid,1) = round(xs/2);
  KIKS_BALLDATA(newobjid,2) = round(ys/2);
 else
   KIKS_BALLDATA(newobjid,1) = mtlb_a(mtlb_double(mtlb_e(pos,1)),mtlb_double(KIKS_WALL_WIDTH));
   KIKS_BALLDATA(newobjid,2) = mtlb_a(mtlb_double(mtlb_e(pos,2)),mtlb_double(KIKS_WALL_WIDTH));
 end;
 theRadius = KIKS_OBJECT_BALL_RADIUS;
 if cylinder then // ! L.94: mtlb(KIKS_OBJECT_SMALLBALL_RA) can be replaced by KIKS_OBJECT_SMALLBALL_RA() or KIKS_OBJECT_SMALLBALL_RA whether KIKS_OBJECT_SMALLBALL_RA is an M-file or not
  theRadius = mtlb(KIKS_OBJECT_SMALLBALL_RA);end;

 while mtlb_logic(mtlb_double(mtlb_max(mtlb_double(mtlb_max(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(floor(mtlb_s(KIKS_BALLDATA(newobjid,2),mtlb_double(theRadius))/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_a(KIKS_BALLDATA(newobjid,2),mtlb_double(theRadius))/mtlb_double(KIKS_MMPERPIXEL))),mtlb_imp(floor(mtlb_s(KIKS_BALLDATA(newobjid,1),mtlb_double(theRadius))/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_a(KIKS_BALLDATA(newobjid,1),mtlb_double(theRadius))/mtlb_double(KIKS_MMPERPIXEL))))),"m")),"m")),">",0)
   KIKS_BALLDATA(newobjid,1) = mtlb_a(mtlb_double(KIKS_WALL_WIDTH),mtlb_double(rand())*mtlb_s(xs,mtlb_double(KIKS_WALL_WIDTH)*2));
   KIKS_BALLDATA(newobjid,2) = mtlb_a(mtlb_double(KIKS_WALL_WIDTH),mtlb_double(rand())*mtlb_s(ys,mtlb_double(KIKS_WALL_WIDTH)*2));
 end;

 KIKS_BALLDATA(newobjid,3) = 0; // speed
 KIKS_BALLDATA(newobjid,4) = (mtlb_double(rand())*2)*%pi; // angle
 KIKS_BALLDATA(newobjid,5) = cylinder; // is this a cylinder?
 KIKS_OBJECT_BALL_UPD = mtlb_i(KIKS_OBJECT_BALL_UPD,newobjid,0);
 newxp = floor(KIKS_BALLDATA(newobjid,1));
 newyp = floor(KIKS_BALLDATA(newobjid,2));
 kiks_arena_addball(newobjid,newxp,newyp);

 if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
   // !! L.110: Matlab function figure not yet converted
   // !! L.110: Matlab function figure not yet converted, original calling sequence used
   figure(KIKS_GUI_HDL);
   KIKS_BALL_HDL = mtlb_i(KIKS_BALL_HDL,newobjid,kiks_patch_ball(newobjid));
   kiks_draw_ball(newobjid);
 end;

end;
kiks_checkpoint;
endfunction
