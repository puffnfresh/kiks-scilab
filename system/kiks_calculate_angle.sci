function [rad,deg,dist] = kiks_calculate_angle(start,stop)

// Ouput variables initialisation (not found in input variables)
rad=[];
deg=[];
dist=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);



xdiff = mtlb_s(mtlb_double(mtlb_e(stop,1)),mtlb_double(mtlb_e(start,1)));
ydiff = mtlb_s(mtlb_double(mtlb_e(stop,2)),mtlb_double(mtlb_e(start,2)));
dist = sqrt(mtlb_a(xdiff^2,ydiff^2));
if mtlb_logic(dist,"~=",0) then
  // !! L.8: If ydiff/dist is outside [-1,1]
  // !!    complex part of output of asin(ydiff/dist) will be the opposite of Matlab one.
  ang = asin(ydiff/dist);
else
  ang = 0;
end;

if bool2s(mtlb_logic(xdiff,">=",0))&bool2s(mtlb_logic(ydiff,">=",0)) then
  rad = ang;
  deg = rad/(%pi/180);
end;
if mtlb_logic(xdiff,"<",0) then
  rad = mtlb_s(%pi,ang);
  deg = rad/(%pi/180);
  return;
end;
if mtlb_logic(ydiff,"<",0) then
  rad = mtlb_a(2*%pi,ang);
  deg = rad/(%pi/180);
  return;
end;
endfunction
