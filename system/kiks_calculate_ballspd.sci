function [] = kiks_calculate_ballspd(ballnum,ovec,ospd,cvec)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_BALLDATA","KIKS_BALLARRAY")

e = 0.95;

bvec = [cos(mtlb_double(KIKS_BALLDATA(ballnum,4)))*mtlb_double(KIKS_BALLDATA(ballnum,3)),-sin(mtlb_double(KIKS_BALLDATA(ballnum,4)))*mtlb_double(KIKS_BALLDATA(ballnum,3))];
// find angle alpha between bvec and cvec, beta between ovec and cvec
if bool2s(norm(mtlb_double(ovec))>0)&bool2s(norm(bvec)>0) then // both in movement
 alpha = acos(mtlb_a(bvec(1)*mtlb_double(mtlb_e(cvec,1)),bvec(2)*mtlb_double(mtlb_e(cvec,2)))/(norm(bvec)*norm(mtlb_double(cvec))));
 beta = acos(mtlb_a(mtlb_double(mtlb_e(ovec,1))*mtlb_double(mtlb_e(cvec,1)),mtlb_double(mtlb_e(ovec,2))*mtlb_double(mtlb_e(cvec,2)))/(norm(mtlb_double(ovec))*norm(mtlb_double(cvec))));
 // new direction coeff. for ball
 v = mtlb_double(KIKS_BALLDATA(ballnum,3))*sin(alpha); // speed component perpendicular to cvec
 u = mtlb_a(((1-e)*mtlb_double(KIKS_BALLDATA(ballnum,3)))*cos(alpha),(mtlb_double(ospd)*cos(beta))*(1+e))/2; // speed component parallell to cvec
 pvec = mtlb_double(cvec)*[cos(%pi/2),-sin(%pi/2);sin(%pi/2),cos(%pi/2)]; // vector perpendicular to cvec
 nbvec = mtlb_a(v*pvec,u*mtlb_double(cvec));
 nbvec = mtlb_i(nbvec,2,-nbvec(2));
 // update ball
 KIKS_BALLDATA(ballnum,3) = norm(nbvec);
 nang = atan(nbvec(2)/nbvec(1));

 if mtlb_logic(mtlb_double(mtlb_e(cvec,1)),"<",0) then
   nang = nang+%pi;  // hack...
 end;

 xv = cos(nang)*50;
 yv = -sin(nang)*50;
 if nang==%nan then nang = 0;end;

 KIKS_BALLDATA(ballnum,4) = nang;
elseif norm(mtlb_double(ovec))>0 then // ball is at rest
 beta = acos(mtlb_a(mtlb_double(mtlb_e(ovec,1))*mtlb_double(mtlb_e(cvec,1)),mtlb_double(mtlb_e(ovec,2))*mtlb_double(mtlb_e(cvec,2)))/(norm(mtlb_double(ovec))*norm(mtlb_double(cvec))));
 u = ((mtlb_double(ospd)*cos(beta))*(1+e))/2;
 nbvec = u*mtlb_double(cvec);
 nbvec = mtlb_i(nbvec,2,-nbvec(2));

 KIKS_BALLDATA(ballnum,3) = norm(nbvec);
 nang = atan(nbvec(2)/nbvec(1));

 if mtlb_logic(mtlb_double(mtlb_e(cvec,1)),"<",0) then
   nang = nang+%pi;  // hack...
 end;
 KIKS_BALLDATA(ballnum,4) = nang;
end;
endfunction
