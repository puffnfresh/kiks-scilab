function [r] = kGetAnalog(ref,channel)

// Ouput variables initialisation (not found in input variables)
r=[];

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// KGETANALOG   Read the analog inputs

if %nargin~=2 then
  disp("Usage:")
  disp("value = kGetAnalog(ref,channel)")
  disp("Returns a vector of values corresponding to a vector of channels.")
  disp("Returns -1 if the channel is not found.")
  disp("Use the reference obtained with kopen.")
  disp("Skye Legon, K-Team SA, 02/99")
  return;
end;

%v0 = size(mtlb_double(channel));r = ones(%v0(1),%v0(2));
for i = 1:max(size(mtlb_double(channel)))
  // !! L.16: Matlab function sprintf not yet converted, original calling sequence used
  reply = kcmd(ref,sprintf("I,%d",round(mtlb_double(mtlb_e(channel,i)))));
  // !! L.17: Matlab function sscanf not yet converted, original calling sequence used
  [value,count,errmsg] = sscanf(reply,"i,%d");
  if isempty(errmsg) then
    r = mtlb_i(r,i,value);
  else
    r = mtlb_i(r,i,-1);
  end;
end;
endfunction
