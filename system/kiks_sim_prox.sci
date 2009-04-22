function [res] = kiks_sim_prox(id,sample)

// Ouput variables initialisation (not found in input variables)
res=[];

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

global("KIKS_SIM_PROX_NOISE","KIKS_SIM_PROX_EMAX","KIKS_SIM_PROX_EMIN","KIKS_SIM_PROX_EEXP","KIKS_SIMPROX_STEPS","KIKS_SIM_PROX_SCALE","KIKS_MMPERPIXEL","KIKS_SIM_PROX_STEP","KIKS_SIM_PROX_DIST","KIKS_1250","KIKS_ARENA_COLORMASK","KIKS_PROX_DIR","KIKS_PROX_ANG","KIKS_ROBOT_MATRIX","KIKS_PROX_POS","KIKS_WALL_WIDTH","KIKS_WALL_RENDER","KIKS_MONITOR_WIN","KIKS_MONITOR_ON","KIKS_RBT_TIME","KIKS_MAXMOVLIMIT","KIKS_sensdelay","KIKS_SIMPROX_MAXDIST","KIKS_PROX_ACCURACY","KIKS_PROX_MINRAND","KIKS_PROX_MAXRAND","KIKS_PROX_NNET1","KIKS_PROX_NNET2","KIKS_PROX_NNET3","KIKS_PROX_NNET4","KIKS_PROX_NNET5","KIKS_PROX_NNET6","KIKS_PROX_NNET7","KIKS_PROX_NNET8","KIKS_PROX_NNET_ARRAY","KIKS_PROX_USEARRAY");

if isempty(KIKS_PROX_USEARRAY) then KIKS_PROX_USEARRAY = 0;end;
sincelast = mtlb_s(mtlb_double(mtlb_e(KIKS_RBT_TIME,abs(mtlb_double(id)))),mtlb_double(mtlb_e(KIKS_sensdelay,id)));
if bool2s(mtlb_logic(sincelast,"<",mtlb_double(KIKS_MAXMOVLIMIT)))|bool2s(mtlb_logic(sincelast,"<",0.02)) then
  // According to the Khepera manual, proximity sensors update each 20 msec.
  return;
end;

prox_xvals = mtlb_a((mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))+1)*cos(mtlb_s(mtlb_double(KIKS_PROX_ANG),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),mtlb_double(KIKS_ROBOT_MATRIX(id,1,1)))/mtlb_double(KIKS_MMPERPIXEL);
prox_yvals = mtlb_a((mtlb_double(KIKS_ROBOT_MATRIX(id,2,2))+1)*sin(mtlb_s(mtlb_double(KIKS_PROX_ANG),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)))),mtlb_double(KIKS_ROBOT_MATRIX(id,1,2)))/mtlb_double(KIKS_MMPERPIXEL);
prox_dirs = mtlb_a(mtlb_double(KIKS_PROX_DIR),mtlb_double(KIKS_ROBOT_MATRIX(id,1,3)));
[tmp,sensors] = size(prox_xvals);

if %nargin<2 then sample = [];end;
res = [];

proxval = [0,0,0,0,0,0,0,0];

dirs = -%pi/3:%pi/9:%pi/3;
for sens = 1:sensors
  num = 0;
  proxangval = [0,0,0,0,0,0,0];

  proxstep = KIKS_PROX_ACCURACY;
  sumres(1,sens) = 0;

  [ysz,xsz] = size(mtlb_double(KIKS_ARENA_COLORMASK));
  for dir = -%pi/3:%pi/9:%pi/3
    num = num+1;
    // rotate ray_xvals and ray_yvals to get sensor relative coordinates
  
    cosdir = cos(prox_dirs(sens)-dir);
    sindir = sin(prox_dirs(sens)-dir);
  
    ray_xvals = round(mtlb_a(mtlb_double(KIKS_1250)*cosdir,prox_xvals(sens)));
    ray_yvals = round(mtlb_a(-mtlb_double(KIKS_1250)*sindir,prox_yvals(sens)));
  
    idx = mtlb_a(mtlb_s(ray_xvals,1)*ysz,ray_yvals);  // calculate index values for these points
    idx = mtlb_i(idx,mtlb_find(bool2s(mtlb_logic(idx,">",ysz*xsz))),ysz*xsz);
    idx = mtlb_i(idx,mtlb_find(bool2s(mtlb_logic(idx,"<",1))),1);
  
    // ! L.49: abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))) may be replaced by:
    // !    --> mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) if mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx)) is real
    obst = mtlb_find(abs(mtlb_double(mtlb_e(KIKS_ARENA_COLORMASK,idx))));  // get all non-zero entries
  
    if ~isempty(obst) then
      dist = min(obst,"m");
      xp = mtlb_e(ray_xvals,dist);
      yp = mtlb_e(ray_yvals,dist);
      c = KIKS_ARENA_COLORMASK(floor(yp),floor(xp));
    
      oldc = c;
      back = 0;
      while bool2s(mtlb_logic(mtlb_double(c),">",0))&bool2s(mtlb_logic(back,"<",mtlb_double(KIKS_SIM_PROX_STEP)))
        back = back+1;
        oldc = c;
        xp = mtlb_s(xp,cosdir);
        yp = mtlb_a(yp,sindir);
        c = KIKS_ARENA_COLORMASK(floor(yp),floor(xp));
      end;
      c = oldc;
    
      %v0_1 = mtlb_a(mtlb_s(mtlb_double(KIKS_SIM_PROX_DIST),(dist*mtlb_double(KIKS_MMPERPIXEL))*ceil(mtlb_double(KIKS_SIM_PROX_STEP)/mtlb_double(KIKS_MMPERPIXEL))),back);  proxangval(1,num) = (%v0_1(:)).';
      // Color sensitive falloff
      proxangval = mtlb_i(proxangval,num,mtlb_s(proxangval(num),(proxangval(num)*0.5)*(mtlb_s(255,mtlb_double(c))/255)));
    end;
  
    sumres = mtlb_i(sumres,sens,sumres(sens)+proxangval(num));
  end;
  res(sens,1:length(proxangval)) = proxangval;
end;

// Error settings
Emax = KIKS_SIM_PROX_EMAX;// Max relative error caused by noise when sensor reading is 1
Emin = KIKS_SIM_PROX_EMIN;// Max relative error caused by noise when sensor reading is 1000
Eexp = KIKS_SIM_PROX_EEXP;// The larger Eexp, the less frequent large errors are. 
// Eexp=1 ==> Errors are evenly distributed across the error range,
// Eexp=Inf ==> No errors,
// Eexp>1 ==> Large errors are less common than small errors,
// Eexp<1 ==> Large errors are more common than small errors.
for sens = 1:sensors
  if sumres(sens)>0 then
    if mtlb_logic(mtlb_double(KIKS_PROX_USEARRAY),"==",0) then // calculate neural network
     select pmodulo(sens-1,8)
       case 0 then
         // !! L.90: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET1,(res(sens,:))');
       case 1 then
         // !! L.92: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET2,(res(sens,:))');
       case 2 then
         // !! L.94: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET3,(res(sens,:))');
       case 3 then
         // !! L.96: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET4,(res(sens,:))');
       case 4 then
         // !! L.98: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET5,(res(sens,:))');
       case 5 then
         // !! L.100: Matlab toolbox(es) function sim not converted, original calling sequence used
         smsens = sim(KIKS_PROX_NNET6,(res(sens,:))');
       case 6 then
         // !! L.102: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET7,(res(sens,:))');
       case 7 then
         // !! L.104: Matlab toolbox(es) function sim not converted, original calling sequence used
         simsens = sim(KIKS_PROX_NNET8,(res(sens,:))');
     end;
    else // find values in array
     ix = round(res(sens,:)/mtlb_double(KIKS_SIM_PROX_SCALE));
     if mtlb_logic(sum(ix,"m"),">",0) then
       ix = mtlb_a(ix,1);
       ix = mtlb_i(ix,mtlb_find(bool2s(mtlb_logic(ix,">",mtlb_double(KIKS_SIMPROX_STEPS)))),KIKS_SIMPROX_STEPS);
       ix = mtlb_i(ix,mtlb_find(bool2s(mtlb_logic(ix,"<",1))),1);
       simsens = mtlb_double(KIKS_PROX_NNET_ARRAY(ix(1),ix(2),ix(3),ix(4),ix(5),ix(6),ix(7)))*(1023/255);
     else
       simsens = 0;
     end;
    end;
  
    errQ = mtlb_s(mtlb_double(Emax),(mtlb_double(simsens)/1000)*mtlb_s(mtlb_double(Emax),mtlb_double(Emin)));
    //      randQ=KIKS_PROX_MINRAND/KIKS_PROX_MAXRAND;
    minrand = -mtlb_double(KIKS_PROX_MINRAND)*errQ;
    maxrand = mtlb_double(KIKS_PROX_MAXRAND)*errQ;
    if mtlb_logic(mtlb_double(rand()),"<",0.5) then rdir = maxrand;else rdir = minrand;end;
    randval = mtlb_a(1,rdir*(mtlb_double(rand())^mtlb_double(Eexp)));
    proxval(sens) = mtlb_min(1023,round(mtlb_double(simsens)*randval));
  end;
end;
KIKS_sensdelay = mtlb_i(KIKS_sensdelay,id,mtlb_e(KIKS_RBT_TIME,abs(mtlb_double(id))));
//if KIKS_ROBOTTYPE==2
//    baseval=90+rand(1,8)*20;
//    proxval=round(baseval+proxval);
//    proxval(find(proxval>1023))=1023;
//end;
[rows,cols] = size(proxval);
noiseval = rand(rows,cols)*1023;

KIKS_ROBOT_MATRIX(id,KIKS_PROX_POS,:) = mtlb_min(1023,round(mtlb_a(proxval*(mtlb_s(100,mtlb_double(KIKS_SIM_PROX_NOISE))/100),noiseval*(mtlb_double(KIKS_SIM_PROX_NOISE)/100))));
endfunction
