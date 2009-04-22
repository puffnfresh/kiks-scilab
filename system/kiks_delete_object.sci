function [res] = kiks_delete_object(id,objtype)

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_BALLARRAY","KIKS_BALL_HDL","KIKS_BALLDATA","KIKS_LIGHTARRAY","KIKS_LIGHT_HDL","KIKS_LIGHTDATA","KIKS_ROUNDOBJDATA","KIKS_ROUNDOBJARRAY","KIKS_GUI_HDL","KIKS_2DVISUALIZE");
if mtlb_logic(mtlb_double(objtype),"==",1) then
  [rows,cols] = size(mtlb_double(KIKS_LIGHTARRAY));
  if cols==0 then return;end;
  newarray = [];

  j = 0;
  for i = 1:cols
    j = j+1;
    if mtlb_logic(mtlb_double(mtlb_e(KIKS_LIGHTARRAY,i)),"~=",mtlb_double(id)) then
      newarray(1,j) = matrix(mtlb_e(KIKS_LIGHTARRAY,i),1,-1);
    else
      j = j-1;
    end;
  end;

  KIKS_LIGHTARRAY = newarray;
  if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
    // !! L.25: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.25: Matlab function findobj not yet converted, original calling sequence used
    // L.25: Name conflict: function name changed from findobj to %findobj
    o = %findobj(KIKS_GUI_HDL,"tag",sprintf("@lightobj %d",id));
    mtlb_delete(o);
  end;

  [rows,cols] = size(KIKS_LIGHTARRAY);
  if cols>0 then
    // !! L.31: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.31: Matlab function findobj not yet converted, original calling sequence used
    // L.31: Name conflict: function name changed from findobj to %findobj
    o = %findobj(KIKS_GUI_HDL,"tag",sprintf("@lightobj %d",KIKS_LIGHTARRAY(1)));
    // !! L.32: Matlab function set not yet converted, original calling sequence used
    // L.32: Name conflict: function name changed from set to %set
    %set(o,"Selected","on");
    // !! L.33: Matlab function findobj not yet converted, original calling sequence used
    // L.33: Name conflict: function name changed from findobj to %findobj
    h = %findobj(KIKS_GUI_HDL,"Tag","deleteobj");
    // !! L.34: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.34: Matlab function set not yet converted, original calling sequence used
    // L.34: Name conflict: function name changed from set to %set
    %set(h,"Callback",sprintf("kiks_delete_object(%d,%d)",KIKS_LIGHTARRAY(1),2));
    // !! L.35: Matlab function set not yet converted, original calling sequence used
    // L.35: Name conflict: function name changed from set to %set
    %set(h,"Enable","on");
  else
    // !! L.37: Matlab function findobj not yet converted, original calling sequence used
    // L.37: Name conflict: function name changed from findobj to %findobj
    h = %findobj("Name","KiKS");
    // !! L.38: Matlab function findobj not yet converted, original calling sequence used
    // L.38: Name conflict: function name changed from findobj to %findobj
    o = %findobj(h,"tag","deleteobj");
    // !! L.39: Matlab function set not yet converted, original calling sequence used
    // L.39: Name conflict: function name changed from set to %set
    %set(o,"Enable","off");
  end;
else // ball
 [rows,cols] = size(mtlb_double(KIKS_BALLARRAY));
 if cols==0 then return;end;
 newarray = [];
 xp = floor(mtlb_double(KIKS_BALLDATA(id,1)));
 yp = floor(mtlb_double(KIKS_BALLDATA(id,2)));
 kiks_arena_subball(id,xp,yp);

 j = 0;
 for i = 1:cols
   j = j+1;
   if mtlb_logic(mtlb_double(mtlb_e(KIKS_BALLARRAY,i)),"~=",mtlb_double(id)) then
     newarray(1,j) = matrix(mtlb_e(KIKS_BALLARRAY,i),1,-1);
   else
     j = j-1;
     KIKS_BALLDATA(mtlb_e(KIKS_BALLARRAY,i),:) = [0,0,0,0,0];
   end;
 end;

 KIKS_BALLARRAY = newarray;

 if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then
   // !! L.63: Matlab function sprintf not yet converted, original calling sequence used
   // !! L.63: Matlab function findobj not yet converted, original calling sequence used
   // L.63: Name conflict: function name changed from findobj to %findobj
   o = %findobj(KIKS_GUI_HDL,"tag",sprintf("@ballobj %d",id));
   mtlb_delete(o);
 end;

 [rows,cols] = size(KIKS_BALLARRAY);
 if cols>0 then
   // !! L.69: Matlab function sprintf not yet converted, original calling sequence used
   // !! L.69: Matlab function findobj not yet converted, original calling sequence used
   // L.69: Name conflict: function name changed from findobj to %findobj
   o = %findobj(KIKS_GUI_HDL,"tag",sprintf("@ballobj %d",KIKS_BALLARRAY(1)));
   // !! L.70: Matlab function set not yet converted, original calling sequence used
   // L.70: Name conflict: function name changed from set to %set
   %set(o,"Selected","on");
   // !! L.71: Matlab function findobj not yet converted, original calling sequence used
   // L.71: Name conflict: function name changed from findobj to %findobj
   h = %findobj(KIKS_GUI_HDL,"Tag","deleteobj");
   // !! L.72: Matlab function sprintf not yet converted, original calling sequence used
   // !! L.72: Matlab function set not yet converted, original calling sequence used
   // L.72: Name conflict: function name changed from set to %set
   %set(h,"Callback",sprintf("kiks_delete_object(%d,%d)",KIKS_BALLARRAY(1),2+KIKS_BALLDATA(KIKS_BALLARRAY(1),5)));
   // !! L.73: Matlab function set not yet converted, original calling sequence used
   // L.73: Name conflict: function name changed from set to %set
   %set(h,"Enable","on");
 else
   // !! L.75: Matlab function findobj not yet converted, original calling sequence used
   // L.75: Name conflict: function name changed from findobj to %findobj
   h = %findobj("Name","KiKS");
   // !! L.76: Matlab function findobj not yet converted, original calling sequence used
   // L.76: Name conflict: function name changed from findobj to %findobj
   o = %findobj(h,"tag","deleteobj");
   // !! L.77: Matlab function set not yet converted, original calling sequence used
   // L.77: Name conflict: function name changed from set to %set
   %set(o,"Enable","off");
 end;
end;
endfunction
