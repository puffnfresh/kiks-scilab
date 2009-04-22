function [] = kiks_gui_resize(xs)

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

global("KIKS_KIKSNET_MONITORING","KIKS_ARENA_OLDXS","KIKS_ARENA_IMG_XS","KIKS_ARENA_IMG_YS","KIKS_ARENA_HDL","KIKS_GUI_HDL","KIKS_2DVISUALIZE","KIKS_MMPERPIXEL");

// !! L.9: Matlab function get not yet converted, original calling sequence used
// L.9: Name conflict: function name changed from get to %get
mainpos = %get(KIKS_GUI_HDL,"Position");
pos = [148,49];

// !! L.12: Matlab function findobj not yet converted, original calling sequence used
// L.12: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"tag","kiks_matlab_command");
// !! L.13: Matlab function get not yet converted, original calling sequence used
// L.13: Name conflict: function name changed from get to %get
sp = %get(h,"Position");
sp = mtlb_i(sp,3,mtlb_s(mtlb_double(mtlb_e(mainpos,3)),76));
// !! L.15: Matlab function set not yet converted, original calling sequence used
// L.15: Name conflict: function name changed from set to %set
%set(h,"Position",sp);

if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),"==",0) then
  mainpos = mtlb_i(mainpos,3,147);
  // !! L.19: Matlab function set not yet converted, original calling sequence used
  // L.19: Name conflict: function name changed from set to %set
  %set(KIKS_GUI_HDL,"Position",mainpos);
  return;
end;
if mtlb_logic(mtlb_double(mtlb_e(mainpos,3)),"<",247) then
  mainpos = mtlb_i(mainpos,3,247);
end;
pys = KIKS_ARENA_IMG_YS;
pxs = KIKS_ARENA_IMG_XS;
if %nargin==1 then
  if isempty(KIKS_ARENA_OLDXS) then
    mainpos = mtlb_i(mainpos,3,xs);
  else
    mainpos = mtlb_i(mainpos,3,KIKS_ARENA_OLDXS);
  end;
end;
//mainpos(3)=pos(1)+KIKS_ARENA_IMG_XS*KIKS_MMPERPIXEL;
// !! L.35: Matlab function findobj not yet converted, original calling sequence used
// L.35: Name conflict: function name changed from findobj to %findobj
// !! L.35: Matlab function get not yet converted, original calling sequence used
// L.35: Name conflict: function name changed from get to %get
scrn = %get(%findobj("type","root"),"screensize");
mainpos = mtlb_i(mainpos,3,mtlb_min(mtlb_double(mtlb_e(mainpos,3)),mtlb_s(mtlb_double(mtlb_e(scrn,3)),mtlb_double(mtlb_e(mainpos,1)))));
KIKS_ARENA_OLDXS = mtlb_e(mainpos,3);
// !! L.38: Matlab function set not yet converted, original calling sequence used
// L.38: Name conflict: function name changed from set to %set
%set(KIKS_GUI_HDL,"Position",mainpos);

xpixels = mtlb_s(mtlb_double(mtlb_e(mainpos,3)),pos(1));
ypixels = mtlb_s(mtlb_double(mtlb_e(mainpos,4)),pos(2));
//[pys pxs]=[KIKS_ARENA_IMG_YS KIKS_ARENA_IMG_XS];
winratio = xpixels/ypixels;
imgratio = mtlb_double(pxs)/mtlb_double(pys);
if mtlb_logic(imgratio,">=",winratio) then
  pos = [pos(1),mtlb_a(pos(2),mtlb_s(ypixels,(xpixels/mtlb_double(pxs))*mtlb_double(pys))/2),xpixels,(xpixels/mtlb_double(pxs))*mtlb_double(pys)];
else
  pos = [mtlb_a(pos(1),mtlb_s(xpixels,(ypixels/mtlb_double(pys))*mtlb_double(pxs))/2),pos(2),(ypixels/mtlb_double(pys))*mtlb_double(pxs),ypixels];
end;
pos = mtlb_i(pos,find(bool2s(pos<1)),1);
// !! L.51: Matlab function set not yet converted, original calling sequence used
// L.51: Name conflict: function name changed from set to %set
%set(KIKS_ARENA_HDL,"position",pos);
// !! L.52: Matlab function findobj not yet converted, original calling sequence used
// L.52: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"tag","status");
// !! L.53: Matlab function get not yet converted, original calling sequence used
// L.53: Name conflict: function name changed from get to %get
sp = %get(h,"Position");
sp = mtlb_i(sp,1,148);
sp = mtlb_i(sp,3,mtlb_s(mtlb_double(mtlb_e(mainpos,3)),145));
sp = mtlb_i(sp,mtlb_find(bool2s(mtlb_logic(mtlb_double(sp),"<",1))),1);
// !! L.57: Matlab function set not yet converted, original calling sequence used
// L.57: Name conflict: function name changed from set to %set
%set(h,"Position",sp);
// !! L.58: Matlab function findobj not yet converted, original calling sequence used
// L.58: Name conflict: function name changed from findobj to %findobj
h = %findobj(KIKS_GUI_HDL,"tag","status_dummy");
// !! L.59: Matlab function get not yet converted, original calling sequence used
// L.59: Name conflict: function name changed from get to %get
sp = %get(h,"Position");
sp = mtlb_i(sp,3,mtlb_a(mtlb_double(mtlb_e(mainpos,3)),2));
// !! L.61: Matlab function set not yet converted, original calling sequence used
// L.61: Name conflict: function name changed from set to %set
%set(h,"Position",sp);
endfunction
