function [response] = kiks_turret_k213(tcommand,targs)

// Ouput variables initialisation (not found in input variables)
response=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_SIM_LINVIS_RP","KIKS_MMPERPIXEL","KIKS_K213_STEP","KIKS_K213_NONORMALIZE","KIKS_502500","KIKS_SIM_LINVIS_LMIN","KIKS_SIM_LINVIS_LMAX","KIKS_RBT_TIME","KIKS_SIM_LINVIS_LL","KIKS_SIM_LINVIS_IMG","KIKS_SIM_LINVIS_RP","KIKS_SIM_LINVIS_LU","KIKS_ROBOT_MATRIX","KIKS_WALL_WIDTH","KIKS_WALL_RENDER","KIKS_ARENA_MASK","KIKS_ARENA_COLORMASK");

if %nargin<2 then
  // return the turret id
  response = 2;
  return;
end;

select tcommand
  case "B" then // turret software version
 // !! L.11: Matlab function sprintf not yet converted, original calling sequence used
 response = sprintf("t,2,b,1,0");
  case "N" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "M" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "O" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "P" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "Q" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "R" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "S" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "T" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "L" then // read image
 response = kiks_turret_k213_main(tcommand,targs);
  case "U" then // set reading period
 // ! L.31: mtlb(args) can be replaced by args() or args whether args is an M-file or not
 // !! L.31: Unknown function args not converted, original calling sequence used

 select args(1)
   case 0 then
     // ! L.32: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),0.2);
   case 1 then
     // ! L.34: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),0.05);
   case 2 then
     // ! L.36: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),0.1);
   case 3 then
     // ! L.38: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),0.15);
   case 4 then
     // ! L.40: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),0.25);
   case 5 then
     // ! L.42: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),0.5);
   case 6 then
     // ! L.44: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),1);
   case 7 then
     // ! L.46: mtlb(port) can be replaced by port() or port whether port is an M-file or not
     KIKS_SIM_LINVIS_RP = mtlb_i(KIKS_SIM_LINVIS_RP,mtlb(port),5);
 end;
 response = "u";
  else
    response = "z,Protocol error";
end;
endfunction
 
 
function [imgstr] = kiks_turret_k213_main(tcmd,targs)

// Ouput variables initialisation (not found in input variables)
imgstr=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_K213_NOISE","KIKS_K213_NONORMALIZE","KIKS_MMPERPIXEL","KIKS_K213_STEP","KIKS_502500","KIKS_SIM_LINVIS_LMIN","KIKS_SIM_LINVIS_LMAX","KIKS_RBT_TIME","KIKS_SIM_LINVIS_LL","KIKS_SIM_LINVIS_IMG","KIKS_SIM_LINVIS_RP","KIKS_SIM_LINVIS_LU","KIKS_ROBOT_MATRIX","KIKS_WALL_WIDTH","KIKS_WALL_RENDER","KIKS_ARENA_MASK","KIKS_ARENA_COLORMASK");

id = 1;
wc = 245;// white color value
bc = 50;// black color value
res = ones(1,64)*127;
img = res;
minlen = 50;// mm
maxlen = 500;// mm
step = 10;

select tcmd
  case "N" then
    interval = 1;
    colres = 1;
    subimg = 0;
    startpx = 1;
  case "L" then
    interval = 1;
    colres = 1;
    subimg = 0;
    startpx = 1;
  case "M" then
    interval = 1;
    colres = 2;
    subimg = 0;
    startpx = 1;
  case "Q" then
    interval = 1;
    colres = 1;
    subimg = 8;
    startpx = mtlb_e(targs,1);
  case "R" then
    interval = 1;
    colres = 1;
    subimg = 16;
    startpx = mtlb_e(targs,1);
  case "S" then
    interval = 2;
    colres = 1;
    subimg = 0;
    startpx = 1;
  case "T" then
    interval = 4;
    colres = 1;
    subimg = 0;
    startpx = 1;
end;

angs = 18:-36/65:-18;
if subimg>0 then
  endpx = mtlb_s(mtlb_a(mtlb_double(startpx),subimg),1);
else
  endpx = 64;
end;

//for px=startpx:interval:endpx
sincelast = mtlb_s(mtlb_double(mtlb_e(KIKS_RBT_TIME,id)),mtlb_double(mtlb_e(KIKS_SIM_LINVIS_LU,id)));
if mtlb_logic(sincelast,">=",mtlb_double(mtlb_e(KIKS_SIM_LINVIS_RP,id))) then
  // | (KIKS_SIM_LINVIS_LMIN(id)>startpx) | (KIKS_SIM_LINVIS_LMAX(id)<endpx) | (KIKS_SIM_LINVIS_LINT(id)>interval)
  KIKS_SIM_LINVIS_LU = mtlb_i(KIKS_SIM_LINVIS_LU,id,mtlb_e(KIKS_RBT_TIME,id));
  xs = (mtlb_double(KIKS_ROBOT_MATRIX(id,1,1))+5*sin(mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))+%pi))/mtlb_double(KIKS_MMPERPIXEL);
  ys = (mtlb_double(KIKS_ROBOT_MATRIX(id,1,2))+5*cos(mtlb_double(KIKS_ROBOT_MATRIX(id,1,3))+%pi))/mtlb_double(KIKS_MMPERPIXEL);
  [ysz,xsz] = size(mtlb_double(KIKS_ARENA_COLORMASK));
  bpx = zeros(1,64);
  for px = 1:64
    ang = angs(px)/(180/%pi)+mtlb_double(KIKS_ROBOT_MATRIX(id,1,3));
    cosang = cos(ang);
    sinang = sin(ang);
    xvals = round(mtlb_a(mtlb_double(KIKS_502500)*cosang,xs));
    yvals = round(mtlb_a(-mtlb_double(KIKS_502500)*sinang,ys));
    // isolate values that are within boundaries
    ok = mtlb_find(bool2s(bool2s(bool2s(bool2s(mtlb_logic(xvals,">=",1))&bool2s(mtlb_logic(xvals,"<=",xsz)))&bool2s(mtlb_logic(yvals,">=",1)))&bool2s(mtlb_logic(yvals,"<=",ysz))));
    xok = mtlb_e(xvals,ok);
    yok = mtlb_e(yvals,ok);
    //      plot(xok-KIKS_WALL_WIDTH+KIKS_WALL_RENDER,yok-KIKS_WALL_WIDTH+KIKS_WALL_RENDER);
    idx = mtlb_a(mtlb_s(xok,1)*ysz,yok);
    // ! L.78: abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))) may be replaced by:
    // !    --> mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) if mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) is real
    obst = mtlb_find(abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))));  // get all non-zero elements
    if ~isempty(obst) then
      dist = min(obst,"m");
    
      xp = mtlb_e(xvals,dist);
      yp = mtlb_e(yvals,dist);
      c = KIKS_ARENA_COLORMASK(yp,xp);
      oldc = c;
      back = 0;
    
      while bool2s(mtlb_logic(mtlb_double(c),">",0))&bool2s(mtlb_logic(back,"<",mtlb_double(KIKS_K213_STEP)/mtlb_double(KIKS_MMPERPIXEL)))
        back = back+1;
        oldc = c;
        xp = mtlb_s(xp,cosang);
        yp = mtlb_a(yp,sinang);
        c = KIKS_ARENA_COLORMASK(floor(yp),floor(xp));
      end;
      c = oldc;
    
      %v0_1 = mtlb_a(bc,(mtlb_double(c)*(wc-bc))/255);  res(1,px) = (%v0_1(:)).';
      img(px) = res(px);
    else
      // no color data for this pixel (out of reach)
      bpx(px) = 1;
      // keep stepping until we hit something
      dy = -sinang*mtlb_double(KIKS_K213_STEP);
      dx = cosang*mtlb_double(KIKS_K213_STEP);
      sx = xvals($);
      sy = yvals($);
      c = 0;
      while c==0
        sx = mtlb_a(sx,dx);
        sy = mtlb_a(sy,dy);
        c = KIKS_ARENA_COLORMASK(floor(sy),floor(sx));
      end;
      // back up, we don''t want wrong wall color.
      dy = -sinang;
      dx = cosang;
      nc = c;
      while mtlb_logic(mtlb_double(nc),"~=",0)
        c = nc;
        sx = mtlb_s(sx,dx);
        sy = mtlb_s(sy,dy);
        nc = KIKS_ARENA_COLORMASK(floor(sy),floor(sx));
      end;
    
      %v1_2 = mtlb_a(bc,(mtlb_double(c)*(wc-bc))/255);  res(1,px) = (%v1_2(:)).';
      img(px) = res(px);
    end;
  end;
  // Blur out-of-view pixels
  b = find(bpx);
  if ~isempty(b) then
    [tmp,sz] = size(b);
    msk = [3,2,1,1,2,2,3];
    msk = msk/sum(msk,"m");
    fimg = [img(1),img(1),img(1),img,img(64),img(64),img(64)];
    for i = 1:sz
      ix = b(i);
      img = mtlb_i(img,ix,fimg(ix)*msk(1)+fimg(ix+1)*msk(2)+fimg(ix+2)*msk(3)+fimg(ix+3)*msk(4)+fimg(ix+4)*msk(5)+fimg(ix+5)*msk(6)+fimg(ix+6)*msk(7));
    end;
  end;

  // normalize, calculate light   
  imx = double(max(img,"m"));  // ==> wc
  ime = double(mean(img,"m"));
  imn = double(min(img,"m"));  // ==> bc
  if isempty(KIKS_K213_NONORMALIZE) then
    if mtlb_logic(imx,"<",wc) then
      img = mtlb_a(img,mtlb_s(wc,imx));
    end;
    if mtlb_logic(imn,">",bc) then
      img = mtlb_s(img,255-wc);
    end;
  end;
  // calculate light level
  // ime=255 ==> 100,
  // ime=1 ==> 2600
  KIKS_SIM_LINVIS_LL = mtlb_i(KIKS_SIM_LINVIS_LL,id,mtlb_a(round(mtlb_a(mtlb_a(mtlb_s(255,imx)*7,175),mtlb_double(rand())*50)),mtlb_s(imx,ime)));

  // falloff
  for px = 1:64
    img = mtlb_i(img,px,mtlb_s(mtlb_a(img(px),mtlb_double(rand())*20),10));
    fl = 240-(abs(angs(px))*((abs(angs(px))/18)^1.5))*6;
    if bool2s(abs(angs(px))>5)&bool2s(img(px)>fl) then
      img = mtlb_i(img,px,mtlb_s(mtlb_a(fl,mtlb_double(rand())*20),10));
    end;
  end;
  // blur image
  if max(abs(mtlb_double(KIKS_ROBOT_MATRIX(id,1,5))),abs(mtlb_double(KIKS_ROBOT_MATRIX(id,1,6))))>0 then
    // blur a lot if rotating
    if mtlb_double(KIKS_ROBOT_MATRIX(id,1,5))~=mtlb_double(KIKS_ROBOT_MATRIX(id,1,6)) then
      msk = [4,3,2,1,2,3,4];  // heavy blur
    else
      msk = [1,1,1,4,1,1,1];  // medium blur
    end;
  else
    msk = [0,0,1,2,1,0,0];  // light blur
  end;

  // !! L.178: Matlab function filter2 not yet converted, original calling sequence used
  filt = filter2(msk/sum(msk,"m"),[img(1),img(1),img(1),img,img(64),img(64),img(64)]);
  img = mtlb_e(filt,4:67);

  [rows,cols] = size(mtlb_double(img));
  noiseimg = rand(rows,cols)*255;

  // !! L.184: Scilab uint8() does not work with Complex values: uint8() call IGNORED !
  // ! L.184: mtlb_a(mtlb_double(img)*(mtlb_s(100,mtlb_double(KIKS_K213_NOISE))/100),noiseimg*(mtlb_double(KIKS_K213_NOISE)/100)) may be replaced by:
  // !    --> uint8(mtlb_a(mtlb_double(img)*(mtlb_s(100,mtlb_double(KIKS_K213_NOISE))/100),noiseimg*(mtlb_double(KIKS_K213_NOISE)/100))) if mtlb_a(mtlb_double(img)*(mtlb_s(100,mtlb_double(KIKS_K213_NOISE))/100),noiseimg*(mtlb_double(KIKS_K213_NOISE)/100)) is real
  KIKS_SIM_LINVIS_IMG(id,:) = mtlb_a(mtlb_double(img)*(mtlb_s(100,mtlb_double(KIKS_K213_NOISE))/100),noiseimg*(mtlb_double(KIKS_K213_NOISE)/100));
end;

// !! L.187: Matlab function sprintf not yet converted, original calling sequence used
imgstr = sprintf("t,2,%c",mtlb_lower(tcmd));
select tcmd
  case "N" then
    for i = mtlb_imp(mtlb_double(startpx),interval,endpx)
      // !! L.190: Matlab function sprintf not yet converted, original calling sequence used
      imgstr = [imgstr,sprintf(",%d",round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i))))];
    end;
  case "M" then
    for i = 1:31
      // !! L.194: Matlab function sprintf not yet converted, original calling sequence used
      imgstr = [imgstr,sprintf(",%d",round(round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i))/4)+128+round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i+1))/4)))];
    end;
  case "O" then
    [val,no] = mtlb_max(mtlb_double(KIKS_SIM_LINVIS_IMG(id,:)),"m")
    // !! L.198: Matlab function sprintf not yet converted, original calling sequence used
    imgstr = [imgstr,sprintf(",%d",round(no))];
  case "P" then
    [val,no] = mtlb_min(mtlb_double(KIKS_SIM_LINVIS_IMG(id,:)),"m")
    // !! L.201: Matlab function sprintf not yet converted, original calling sequence used
    imgstr = [imgstr,sprintf(",%d",round(no))];
  case "Q" then
    for i = mtlb_imp(mtlb_double(startpx),interval,endpx)
      if i<=64 then
        // !! L.205: Matlab function sprintf not yet converted, original calling sequence used
        imgstr = [imgstr,sprintf(",%d",round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i))))];
      else
        imgstr = imgstr+",NaN";
      end;
    end;
  case "R" then
    for i = mtlb_imp(mtlb_double(startpx),interval,endpx)
      if i<=64 then
        // !! L.213: Matlab function sprintf not yet converted, original calling sequence used
        imgstr = [imgstr,sprintf(",%d",round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i))))];
      else
        imgstr = imgstr+",NaN";
      end;
    end;
  case "S" then
    for i = mtlb_imp(mtlb_double(startpx),interval,endpx)
      // !! L.220: Matlab function sprintf not yet converted, original calling sequence used
      imgstr = [imgstr,sprintf(",%d",round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i))))];
    end;
  case "T" then
    for i = mtlb_imp(mtlb_double(startpx),interval,endpx)
      // !! L.224: Matlab function sprintf not yet converted, original calling sequence used
      imgstr = [imgstr,sprintf(",%d",round(mtlb_double(KIKS_SIM_LINVIS_IMG(id,i))))];
    end;
  case "L" then
    hi = floor(mtlb_double(mtlb_e(KIKS_SIM_LINVIS_LL,id))/256);
    lo = mtlb_s(mtlb_double(mtlb_e(KIKS_SIM_LINVIS_LL,id)),hi*256);
    // !! L.229: Matlab function sprintf not yet converted, original calling sequence used
    imgstr = [imgstr,sprintf(",%d,%d",round(hi),round(lo))];
end;
endfunction
