function [bm] = kiks_generate_maze(xs,ys,path_width,wall_width)

// Ouput variables initialisation (not found in input variables)
bm=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// function bm=kiks_generate_maze(xs,ys,path_width,wall_width)
// 
// Simple random maze generator.
// xs,ys defines the size of the matrix.
// path_width is how wide the path should be, and
// wall_width is how wide the walls should be.
// If omitted, default values are used.
// 
// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

TLIMIT = 8;

if %nargin<4 then
  wall_width = 10;
end;
if %nargin<3 then
  path_width = 120;
end;
if %nargin<2 then
  ys = 4;
end;
if %nargin<1 then
  xs = 4;
end;

// creates a maze of size xs,ys
// 1=wall, 0=no wall
ys = mtlb_a(mtlb_double(ys),2);// 2 rows will be left unused
xs = mtlb_a(mtlb_double(xs),2);// 2 columns are not really used
// !! L.34: Unknown function kiks_status not converted, original calling sequence used
kiks_status("generating maze");
ops = TLIMIT;
while ops>=TLIMIT
  // ! L.37: real(mtlb_s(ys*2,1)) may be replaced by:
  // !    --> mtlb_s(ys*2,1) if mtlb_s(ys*2,1) is Real
  // ! L.37: real(mtlb_s(xs*2,1)) may be replaced by:
  // !    --> mtlb_s(xs*2,1) if mtlb_s(xs*2,1) is Real
  maze = zeros(real(mtlb_s(ys*2,1)),real(mtlb_s(xs*2,1)));
  y = ceil(mtlb_a(ys/4,mtlb_double(rand())*mtlb_s(ys,ys/2)));
  x = 2;
  ops = 0;
  xstart = [];
  ystart = [];
  while bool2s(mtlb_logic(x,"<",xs))&bool2s(ops<TLIMIT)
    maze(mtlb_s(y*2,1),x*2-1) = 1;
    if isempty(xstart) then
      //         xstart=x;
      //         ystart=y;
      xstart = 1;  // start at top left
      ystart = 2;
      dir = 2;
    else
      dir = ceil(mtlb_double(rand())*4);
    end;
  
    oldx = x;
    oldy = y;
    select dir
      case 1 then // move up or right
     if mtlb_logic(y,">",2) then
       dx = x*2-1;
       y = mtlb_s(y,1);
       dy = y*2;
     end;
      case 2 then // move right
     dx = x*2;
     dy = mtlb_s(y*2,1);
     x = x+1;
      case 3 then // move down or right
     if mtlb_logic(y,"<",mtlb_s(ys,1)) then
       dx = x*2-1;
       y = mtlb_a(y,1);
       dy = mtlb_s(y*2,2);
     end;
      case 4 then // move left
     if x>2 then
       x = x-1;
       dy = mtlb_s(y*2,1);
       dx = x*2;
     end;
    end;
  
    if maze(mtlb_s(y*2,1),x*2-1)==1 then // already been here!
     ops = ops+1;
     x = oldx;
     y = oldy;
    else
      ops = 0;
      if mtlb_logic(x,"<",xs) then maze(dy,dx) = 1;end;
    end;
  end;
  x = xs;
  y = mtlb_s(ys,1);  // stop at bottom right

  maze(mtlb_s(y*2,1),mtlb_s(x*2,1)) = 1;
  xstop = x;
  ystop = y;
  maze(mtlb_s(ystart*2,1),mtlb_s(xstart*2,1)) = 1;
end;

for x = mtlb_imp(2,mtlb_s(xs,1))
  for y = mtlb_imp(2,mtlb_s(ys,1))
    maze(y*2-1,x*2-1) = -1;
    if bool2s(bool2s(bool2s(maze(y*2-2,x*2-1)==0)&bool2s(maze(y*2,x*2-1)==0))&bool2s(maze(y*2-1,x*2-2)==0))&bool2s(maze(y*2-1,x*2)==0) then
      // all walls closed!
      tx = x;
      ty = y;
      while bool2s(bool2s(bool2s(maze(ty*2-2,tx*2-1)~=1)&bool2s(maze(ty*2,tx*2-1)~=1))&bool2s(maze(ty*2-1,tx*2-2)~=1))&bool2s(maze(ty*2-1,tx*2)~=1)
        dist = ceil(mtlb_double(rand())*4);
        oldx = tx;
        oldy = ty;
        select dist
          case 1 then // try right
         if mtlb_logic(tx,"<",mtlb_s(xs,1)) then
           tx = tx+1;
           dy = ty*2-1;
           dx = tx*2-2;
         end;
          case 2 then // try left
         if tx>2 then
           tx = tx-1;
           dy = ty*2-1;
           dx = tx*2;
         end;
          case 3 then // try down
         if mtlb_logic(ty,"<",mtlb_s(ys,1)) then
           ty = ty+1;
           dy = ty*2-2;
           dx = tx*2-1;
         end;
          case 4 then // try up
         if ty>2 then
           ty = ty-1;
           dy = ty*2;
           dx = tx*2-1;
         end;
        end;
        if maze(ty*2-1,tx*2-1)~=(-1) then
          maze(ty*2-1,tx*2-1) = -1;
          maze(dy,dx) = -1;
        end;
      end;
    end;
    maze = abs(maze);
  end;
end;
maze(mtlb_s(ystop*2,1),mtlb_s(xstop*2,2)) = 1;
maze(mtlb_s(ystart*2,1),xstart*2) = 1;

//maze

// ! L.149: real(mtlb_a(ys*mtlb_double(path_width),mtlb_s(ys,1)*mtlb_double(wall_width))) may be replaced by:
// !    --> mtlb_a(ys*mtlb_double(path_width),mtlb_s(ys,1)*mtlb_double(wall_width)) if mtlb_a(ys*mtlb_double(path_width),mtlb_s(ys,1)*mtlb_double(wall_width)) is Real
// ! L.149: real(mtlb_a(xs*mtlb_double(path_width),mtlb_s(xs,1)*mtlb_double(wall_width))) may be replaced by:
// !    --> mtlb_a(xs*mtlb_double(path_width),mtlb_s(xs,1)*mtlb_double(wall_width)) if mtlb_a(xs*mtlb_double(path_width),mtlb_s(xs,1)*mtlb_double(wall_width)) is Real
bm = ones(real(mtlb_a(ys*mtlb_double(path_width),mtlb_s(ys,1)*mtlb_double(wall_width))),real(mtlb_a(xs*mtlb_double(path_width),mtlb_s(xs,1)*mtlb_double(wall_width))));

for x = mtlb_imp(1,xs)
  for y = mtlb_imp(1,ys)
    if maze(y*2-1,x*2-1)==1 then
      bm(mtlb_imp(mtlb_a(1,(y-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_a((y-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)),mtlb_double(path_width))),mtlb_imp(mtlb_a(1,(x-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_a((x-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)),mtlb_double(path_width)))) = 0;
    end;
    if bool2s(x>1)&bool2s(maze(y*2-1,x*2-2)==1) then // left wall
     bm(mtlb_imp(mtlb_a(1,(y-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_a((y-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)),mtlb_double(path_width))),mtlb_imp(mtlb_s(mtlb_a(1,(x-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_double(wall_width)),(x-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)))) = 0;
    end;
    if bool2s(y>1)&bool2s(maze(y*2-2,x*2-1)==1) then // top wall
     bm(mtlb_imp(mtlb_s(mtlb_a(1,(y-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_double(wall_width)),(y-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_imp(mtlb_a(1,(x-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_a((x-1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)),mtlb_double(path_width)))) = 0;
    end;
  end;
end;
bm(mtlb_a(round(mtlb_double(path_width)/2),mtlb_s(ystart,1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_a(round(mtlb_a(mtlb_double(wall_width)/2,mtlb_double(path_width)/2)),mtlb_s(xstart,1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)))) = -360;
bm(mtlb_a(round(mtlb_double(path_width)/2),mtlb_s(ystop,1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width))),mtlb_a(round(mtlb_double(path_width)/2),mtlb_s(xstop,1)*mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)))) = 2;
[ys,xs] = size(bm);
bm = bm(mtlb_imp(mtlb_a(mtlb_a(mtlb_double(path_width),mtlb_double(wall_width)),1),mtlb_s(mtlb_s(ys,mtlb_double(path_width)),mtlb_double(wall_width))),mtlb_imp(mtlb_a(mtlb_double(wall_width),1),mtlb_s(xs,mtlb_double(wall_width))));
[ys,xs] = size(bm);
bm(1:10,:) = 1;
bm(:,1:10) = 1;
bm(ys-10:ys,:) = 1;
bm(:,xs-10:xs) = 1;

//bm(1:path_width+wall_width:end,path_width+1:end-path_width)=0;
//bm(1+path_width:path_width+wall_width:end,path_width+1:end-path_width)=0;
//bm(:,path_width:path_width+wall_width:end-path_width)=0;
//bm(:,2*path_width:path_width+wall_width:end-path_width)=0;
//bm(:,1+path_width:path_width+wall_width:end)=0;

// !! L.180: Unknown function kiks_status not converted, original calling sequence used
kiks_status("maze generation successful.");
endfunction
