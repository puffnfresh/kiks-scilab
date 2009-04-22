function [] = kiks_progress(prc,str,len)

// Number of arguments in function call
[%nargout,%nargin] = argn(0)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// !! L.2: Matlab function persistent not yet converted, original calling sequence used
persistent("last");
// ! L.3: mtlb(last) can be replaced by last() or last whether last is an M-file or not

if isempty(mtlb(last)) then
  last = %inf;
end;

if %nargin<3 then len = 30;end;
if %nargin<2 then str = "";end;
if %nargin<1 then return;end;

stars = round((mtlb_double(prc)*100)/(100/mtlb_double(len)));

// ! L.13: real(mtlb_double(len)) may be replaced by:
// !    --> mtlb_double(len) if mtlb_double(len) is Real
progress = ones(1,real(mtlb_double(len)))*asciimat(" ");
progress = mtlb_i(progress,mtlb_imp(1,stars),"-");

if bool2s(mtlb_logic(stars,"~=",last))|bool2s(mtlb_logic(mtlb_double(prc),"==",1)) then
  replace = 1;
  if mtlb_logic(last,">",stars) then
    replace = [];
  end;
  // !! L.21: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.21: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("%s["+progress+"] %.1f%%\n",str,mtlb_double(prc)*100),[],replace);
  last = stars;
  xpause(1000*0.001);
end;
endfunction
