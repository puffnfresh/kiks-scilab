function [r] = kLED(ref,n,action)

// Ouput variables initialisation (not found in input variables)
r=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

//KLED   Send led command to Khepera
// 
//kLED(ref,n,action)
//  Set the led number n to OFF (action=0), ON (action=1),
//  or change its state (action=2). n and/or action can
//  be vector(s) to change more than one led.
//  Use the reference obtained with kopen.

// Written by Yves Piguet, 8/98, Skye Legon 2/99

if max(size(mtlb_double(n)))==1 then
  n = mtlb_double(n)*ones(1,max(size(mtlb_double(mtlb_e(action,":")))));
elseif max(size(mtlb_double(action)))==1 then
  action = mtlb_double(action)*ones(1,max(size(mtlb_double(mtlb_e(n,":")))));
elseif max(size(mtlb_double(mtlb_e(n,":"))))~=max(size(mtlb_double(mtlb_e(n,":")))) then
  error("both arguments must have the same size.");
end;

%v0 = size(mtlb_double(n));r = ones(%v0(1),%v0(2));
for i = 1:max(size(mtlb_double(mtlb_e(n,":"))))
  // !! L.22: Matlab function sprintf not yet converted, original calling sequence used
  value = kcmd(ref,sprintf("L,%d,%d",round(mtlb_double(mtlb_e(n,i))),round(mtlb_double(mtlb_e(action,i)))));
  if mtlb_logic(mtlb_double(value),"==",asciimat("l")) then
    r = mtlb_i(r,i,round(mtlb_double(mtlb_e(action,i))));
  else
    r = mtlb_i(r,i,-1);
  end;
end;
endfunction
