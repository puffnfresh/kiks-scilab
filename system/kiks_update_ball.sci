function [] = kiks_update_ball(id,runtime,notid)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_OBJECT_BALL_SMALLRATIO","KIKS_OBJECT_SMALLBALL_MASK","KIKS_OBJECT_BALL_SMALLRATIO","KIKS_REMOTE_ARRAY","KIKS_MMPERPIXEL","KIKS_TRACE_MAX","KIKS_ROUNDOBJECT_RADIUS","KIKS_ROUNDOBJDATA","KIKS_ROUNDOBJARRAY","KIKS_PUSH_TMPARRAY","KIKS_MAXMOVLIMIT","KIKS_BALLARRAY","KIKS_OBJECT_BALL_UPD","KIKS_WALL_WIDTH","KIKS_ARENA_MASK","KIKS_BALLDATA","KIKS_OBJECT_BALL_RADIUS","KIKS_OBJECT_BALL_MASK","KIKS_WALL_WIDTH","KIKS_WALL_RENDER");

if ~mtlb_double(runtime) then
  return;
end;

if isempty(mtlb_e(KIKS_OBJECT_BALL_UPD,id)) then KIKS_OBJECT_BALL_UPD = mtlb_i(KIKS_OBJECT_BALL_UPD,id,0);end;
KIKS_OBJECT_BALL_UPD = mtlb_i(KIKS_OBJECT_BALL_UPD,id,mtlb_a(mtlb_double(mtlb_e(KIKS_OBJECT_BALL_UPD,id)),mtlb_double(runtime)));
e = 0.25;
cylinder = KIKS_BALLDATA(id,5);
theRadius = KIKS_OBJECT_BALL_RADIUS;
if cylinder then // ! L.18: mtlb(KIKS_OBJECT_BALL_SMALLRA) can be replaced by KIKS_OBJECT_BALL_SMALLRA() or KIKS_OBJECT_BALL_SMALLRA whether KIKS_OBJECT_BALL_SMALLRA is an M-file or not
 theRadius = mtlb_double(theRadius)*mtlb_double(mtlb(KIKS_OBJECT_BALL_SMALLRA));end;

if mtlb_double(KIKS_BALLDATA(id,3))>0 then
  // this one is moving  
  spd = KIKS_BALLDATA(id,3);  // mm/sec
  ang = real(mtlb_double(KIKS_BALLDATA(id,4)));
  distance = mtlb_double(spd)*mtlb_double(runtime);  // mm to move
  coll = 0;
  rest = pmodulo(distance,10);
  steps = mtlb_s(distance,rest)/10;
  step = 0;
  moving = 1;
  while bool2s(coll==0)&bool2s(moving==1)
    xp = KIKS_BALLDATA(id,1);
    yp = KIKS_BALLDATA(id,2);
  
    step = step+1;
    if mtlb_logic(step,">",steps) then dist = rest; moving = 0;else dist = 10;end;
  
    nxp = mtlb_a(mtlb_double(xp),cos(ang)*dist);
    nyp = mtlb_s(mtlb_double(yp),sin(ang)*dist);
    [ys,xs] = size(mtlb_double(KIKS_ARENA_MASK));
    ys = ys*mtlb_double(KIKS_MMPERPIXEL);
    xs = xs*mtlb_double(KIKS_MMPERPIXEL);
    if mtlb_logic(nxp,"<",mtlb_double(KIKS_WALL_WIDTH)) then nxp = KIKS_WALL_WIDTH;end;
    if mtlb_logic(mtlb_double(nxp),">",mtlb_s(xs,mtlb_double(KIKS_WALL_WIDTH))) then nxp = mtlb_s(xs,mtlb_double(KIKS_WALL_WIDTH));end;
    if mtlb_logic(nyp,"<",mtlb_double(KIKS_WALL_WIDTH)) then nyp = KIKS_WALL_WIDTH;end;
    if mtlb_logic(mtlb_double(nyp),">",mtlb_s(ys,mtlb_double(KIKS_WALL_WIDTH))) then nyp = mtlb_s(ys,mtlb_double(KIKS_WALL_WIDTH));end;
  
    if cylinder then
      // ! L.48: mtlb(KIKS_OBJECT_BALL_SMALLRA) can be replaced by KIKS_OBJECT_BALL_SMALLRA() or KIKS_OBJECT_BALL_SMALLRA whether KIKS_OBJECT_BALL_SMALLRA is an M-file or not
      nspd = mtlb_s(mtlb_double(spd),(20/(mtlb_double(mtlb(KIKS_OBJECT_BALL_SMALLRA))^3))*mtlb_double(runtime));
    else
      nspd = mtlb_s(mtlb_double(spd),20*mtlb_double(runtime));
    end;
    nang = ang;
  
    kiks_arena_subball(id,floor(mtlb_double(xp)),floor(mtlb_double(yp)));
  
    // detect collision
    minx = mtlb_s(floor(mtlb_double(nxp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));  // xpos - robot radius
    miny = mtlb_s(floor(mtlb_double(nyp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));  // ypos - robot radius
    maxx = mtlb_a(floor(mtlb_double(nxp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
    maxy = mtlb_a(floor(mtlb_double(nyp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
  
    if cylinder then
      // ! L.63: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
      map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
    else
      map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_OBJECT_BALL_MASK));
    end;
    res = mtlb_max(mtlb_max(map,"m"),"m");
  
    if mtlb_logic(res,">",1) then
      coll = 1;
    
      bst = 0;
      while bool2s(mtlb_logic(res,">",1))&bool2s(mtlb_logic(bst,"<",dist))
        bst = bst+1;
        ores = res;
        omap = map;
        oxp = nxp;
        oyp = nyp;
        nxp = mtlb_s(mtlb_double(nxp),cos(ang));
        nyp = mtlb_a(mtlb_double(nyp),sin(ang));
        minx = mtlb_s(floor(nxp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));  // xpos - robot radius
        miny = mtlb_s(floor(nyp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));  // ypos - robot radius
        maxx = mtlb_a(floor(nxp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
        maxy = mtlb_a(floor(nyp/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
        if cylinder then
          // ! L.86: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
          map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
        else
          map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_OBJECT_BALL_MASK));
        end;
        res = mtlb_max(mtlb_max(map,"m"),"m");
      end;
    
      res = ores;
      nxp = oxp;
      nyp = oyp;
      map = omap;
    
      // check for collision against other balls
      objs = mtlb_max(mtlb_double(KIKS_BALLARRAY),"m");
      [rows,cols] = size(mtlb_double(KIKS_BALLARRAY));
      if mtlb_logic(mtlb_double(objs),">",1) then
        for i = 1:cols
          if bool2s(mtlb_logic(mtlb_double(mtlb_e(KIKS_BALLARRAY,i)),"~=",mtlb_double(id)))&bool2s(mtlb_logic(mtlb_double(mtlb_e(KIKS_BALLARRAY,i)),"~=",mtlb_double(notid))) then
            x = [mtlb_s(mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),1)),mtlb_double(nxp)),mtlb_s(mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),2)),mtlb_double(nyp))];
            otherRadius = KIKS_OBJECT_BALL_RADIUS;
            if KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),5) then // ! L.106: mtlb(KIKS_OBJECT_BALL_SMALLRA) can be replaced by KIKS_OBJECT_BALL_SMALLRA() or KIKS_OBJECT_BALL_SMALLRA whether KIKS_OBJECT_BALL_SMALLRA is an M-file or not
             otherRadius = mtlb_double(KIKS_OBJECT_BALL_RADIUS)*mtlb_double(mtlb(KIKS_OBJECT_BALL_SMALLRA));end;
            if mtlb_logic(norm(x),"<=",mtlb_a(mtlb_a(mtlb_double(theRadius),mtlb_double(otherRadius)),1)) then
              kspd1 = KIKS_BALLDATA(id,3);
              kvec1 = [cos(mtlb_double(KIKS_BALLDATA(id,4)))*mtlb_double(kspd1),-sin(mtlb_double(KIKS_BALLDATA(id,4)))*mtlb_double(kspd1)];
              kspd2 = KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),3);
              kvec2 = [cos(mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),4)))*mtlb_double(kspd2),-sin(mtlb_double(KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),4)))*mtlb_double(kspd2)];
              kiks_calculate_ballspd(mtlb_e(KIKS_BALLARRAY,i),kvec1,kspd1,x/norm(x));
              kiks_calculate_ballspd(id,kvec2,kspd2,x/norm(x));
              nspd = KIKS_BALLDATA(id,3);
              nang = KIKS_BALLDATA(id,4);
            end;
          end;
        end;
      end;
    
      // check for collision against remote robots
      if ~isempty(KIKS_REMOTE_ARRAY) then
        entries = 8;  // entries per object
        nr = size(mtlb_double(KIKS_REMOTE_ARRAY),1)/entries;
        for i = 0:nr-1
          rkxp = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,3+i*entries)));
          rkyp = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,4+i*entries)));
          lv = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,7+i*entries)));
          rv = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,8+i*entries)));
          x = [mtlb_s(rkxp,mtlb_double(nxp)),mtlb_s(rkyp,mtlb_double(nyp))];
          if mtlb_logic(norm(x),"<=",mtlb_a(mtlb_a(mtlb_double(theRadius),mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,6+i*entries))),1)) then
            kspd = kiks_p2mm(mean(lv,rv))*100;
            kvec = [cos(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,5+i*entries)))*kspd,-sin(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,5+i*entries)))*kspd];
            kiks_calculate_ballspd(id,kvec,kspd,x/norm(x));
            nspd = KIKS_BALLDATA(id,3);
            nang = KIKS_BALLDATA(id,4);
          end;
        end;
      end;
    
      minx = mtlb_s(floor(mtlb_double(nxp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));  // xpos - robot radius
      miny = mtlb_s(floor(mtlb_double(nyp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));  // ypos - robot radius
      maxx = mtlb_a(floor(mtlb_double(nxp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
      maxy = mtlb_a(floor(mtlb_double(nyp)/mtlb_double(KIKS_MMPERPIXEL)),floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
      if cylinder then
        // ! L.146: mtlb(KIKS_OBJECT_SMALLBALL_MA) can be replaced by KIKS_OBJECT_SMALLBALL_MA() or KIKS_OBJECT_SMALLBALL_MA whether KIKS_OBJECT_SMALLBALL_MA is an M-file or not
        map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(mtlb(KIKS_OBJECT_SMALLBALL_MA)));
      else
        map = mtlb_a(mtlb_double(KIKS_ARENA_MASK(mtlb_imp(miny,maxy),mtlb_imp(minx,maxx))),mtlb_double(KIKS_OBJECT_BALL_MASK));
      end;
      res = mtlb_max(mtlb_max(map,"m"),"m");
    
      if mtlb_logic(res,">",1) then
        // collided - find angle
        [row,col] = mtlb_find(bool2s(mtlb_logic(map,"==",res)));
        row = -mtlb_s(row,floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
        col = mtlb_s(col,floor(mtlb_double(theRadius)/mtlb_double(KIKS_MMPERPIXEL)));
        d = sqrt(mtlb_a(row .^2,col .^2));
        d = mtlb_a(d,1);
        md = mtlb_min(d,"m");
        ps = mtlb_find(bool2s(mtlb_logic(d,"==",md)));
      
        ptx = mean(mtlb_e(col,ps),"m");
        pty = mean(mtlb_e(row,ps),"m");
      
        if mtlb_logic(abs(pty),"<",abs(ptx)) then
          // !! L.166: If abs(pty)/md is outside [-1,1]
          // !!    complex part of output of asin(abs(pty)/md) will be the opposite of Matlab one.
          cang = asin(abs(pty)/md);
        else
          cang = acos(abs(ptx)/md);
        end;
        if bool2s(mtlb_logic(pty,"<",0))&bool2s(mtlb_logic(ptx,">=",0)) then cang = mtlb_s(2*%pi,cang);end;
        if bool2s(mtlb_logic(pty,">=",0))&bool2s(mtlb_logic(ptx,"<",0)) then cang = mtlb_s(%pi,cang);end;
        if bool2s(mtlb_logic(pty,"<",0))&bool2s(mtlb_logic(ptx,"<",0)) then cang = mtlb_a(%pi,cang);end;
        nrm = pmodulo(mtlb_a(cang,%pi),2*%pi);
        nang = pmodulo(mtlb_s(nrm,mtlb_s(ang+%pi,nrm)),2*%pi);
        nspd = mtlb_double(spd)*sqrt(mtlb_a(sin(mtlb_s(nrm,ang))^2,(e^2)*(cos(mtlb_s(nrm,ang))^2)));
        nxp = xp;
        nyp = yp;
      
      end;
    end;
  
  
    KIKS_BALLDATA(id,1) = nxp;
    KIKS_BALLDATA(id,2) = nyp;
    KIKS_BALLDATA(id,3) = nspd;
    KIKS_BALLDATA(id,4) = nang;
    kiks_arena_addball(id,floor(mtlb_double(nxp)),floor(mtlb_double(nyp)));
  end;

  kiks_draw_ball(id);
end;
// check for collision against remote robots
if ~isempty(KIKS_REMOTE_ARRAY) then
  xp = KIKS_BALLDATA(id,1);
  yp = KIKS_BALLDATA(id,2);
  entries = 6;  // entries per object
  nr = size(mtlb_double(KIKS_REMOTE_ARRAY),1)/entries;
  for i = 0:nr-1
    rkxp = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,3+i*entries)));
    rkyp = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,4+i*entries)));
    x = [mtlb_s(mtlb_double(xp),rkxp),mtlb_s(mtlb_double(yp),rkyp)];
    if mtlb_logic(norm(x),"<=",mtlb_a(mtlb_a(mtlb_double(theRadius),mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,6+i*entries))),1)) then
      kspd = 200;
      kvec = [cos(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,5+i*entries)))*kspd,-sin(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,5+i*entries)))*kspd];
      kiks_calculate_ballspd(id,kvec,kspd,x/norm(x));
    end;
  end;
end;
endfunction
