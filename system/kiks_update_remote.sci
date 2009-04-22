function [] = kiks_update_remote()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------

global("KIKS_REMOTEKHEP_MTRX","KIKS_COLOR_ROBOT","KIKS_REMOTEKHEP_HDL","KIKS_2DVISUALIZE","KIKS_MMPERPIXEL","KIKS_REMOTE_ARRAY","KIKS_REMOTE_ARRAY_NEW");
entries = 8;// entries per object

KIKS_REMOTEKHEP_MTRX = [];
if ~isempty(KIKS_REMOTE_ARRAY) then
  nr = size(mtlb_double(KIKS_REMOTE_ARRAY),1)/entries;
  for i = 0:nr-1
    id = mtlb_e(KIKS_REMOTE_ARRAY,1+i*entries);
    type = mtlb_e(KIKS_REMOTE_ARRAY,2+i*entries);
    x = mtlb_e(KIKS_REMOTE_ARRAY,3+i*entries);
    y = mtlb_e(KIKS_REMOTE_ARRAY,4+i*entries);
    ang = mtlb_e(KIKS_REMOTE_ARRAY,5+i*entries);
    r = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,6+i*entries)));  // radius
    KIKS_REMOTEKHEP_MTRX(id,1) = x;
    KIKS_REMOTEKHEP_MTRX(id,2) = y;
    KIKS_REMOTEKHEP_MTRX(id,3) = 1;  // mark this as an """"old"""" remote Khepera
    KIKS_REMOTEKHEP_MTRX(id,4) = r;
    KIKS_REMOTEKHEP_MTRX(id,5) = ang;
  end;
end;

[rows,cols] = size(mtlb_double(KIKS_REMOTEKHEP_MTRX));
createhdl = [];
if isempty(KIKS_REMOTEKHEP_HDL) then createhdl = 1;end;

if ~isempty(KIKS_REMOTE_ARRAY_NEW) then
  //   KIKS_REMOTE_ARRAY_NEW
  nr = size(mtlb_double(KIKS_REMOTE_ARRAY_NEW),1)/entries;
  for i = 0:nr-1
    id = mtlb_e(KIKS_REMOTE_ARRAY_NEW,1+i*entries);
    type = mtlb_e(KIKS_REMOTE_ARRAY_NEW,2+i*entries);
    x = mtlb_e(KIKS_REMOTE_ARRAY_NEW,3+i*entries);
    y = mtlb_e(KIKS_REMOTE_ARRAY_NEW,4+i*entries);
    ang = mtlb_e(KIKS_REMOTE_ARRAY_NEW,5+i*entries);
    r = mtlb_e(KIKS_REMOTE_ARRAY_NEW,6+i*entries);
    if mtlb_logic(mtlb_double(id),"<=",rows) then
      isnew = mtlb_double(KIKS_REMOTEKHEP_MTRX(id,3))==0;
    else
      isnew = 1;
    end;
  
    if isnew then
      //kiks_arena_addremoterobot(x,y);
      kiks_arena_add_mask(floor(mtlb_double(x)),floor(mtlb_double(y)),KIKS_COLOR_ROBOT,r);
      if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then kiks_draw_remoterobot(id,x,y,ang,1,r);end;
    else
      if bool2s(bool2s(mtlb_logic(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,1)),"~=",mtlb_double(x)))|bool2s(mtlb_logic(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,2)),"~=",mtlb_double(y))))|bool2s(mtlb_logic(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,5)),"~=",mtlb_double(ang))) then
        //kiks_arena_subremoterobot(KIKS_REMOTEKHEP_MTRX(id,1),KIKS_REMOTEKHEP_MTRX(id,2));
        kiks_arena_sub_mask(floor(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,1))),floor(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,2))),KIKS_COLOR_ROBOT,r);
        //kiks_arena_addremoterobot(x,y);
        kiks_arena_add_mask(floor(mtlb_double(x)),floor(mtlb_double(y)),KIKS_COLOR_ROBOT,r);
        if mtlb_logic(mtlb_double(KIKS_2DVISUALIZE),">",0) then kiks_draw_remoterobot(id,x,y,ang,createhdl,r);end;
      end;
    end;
    KIKS_REMOTEKHEP_MTRX(id,:) = [0,0,0,0,0];  // this id is in new array too
  end;
end;

if ~isempty(KIKS_REMOTEKHEP_MTRX) then
  // ! L.66: abs(mtlb_double(KIKS_REMOTEKHEP_MTRX(:,3))) may be replaced by:
  // !    --> mtlb_double(KIKS_REMOTEKHEP_MTRX(:,3)) if mtlb_double(KIKS_REMOTEKHEP_MTRX(:,3)) is real
  ix = find(abs(mtlb_double(KIKS_REMOTEKHEP_MTRX(:,3))))';  // ix contains all id''s that should be removed from world
  [sz,tmp] = size(ix);
  for i = 1:sz
    id = ix(i);
    //kiks_arena_subremoterobot(KIKS_REMOTEKHEP_MTRX(id,1),KIKS_REMOTEKHEP_MTRX(id,2));
    kiks_arena_sub_mask(floor(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,1))),floor(mtlb_double(KIKS_REMOTEKHEP_MTRX(id,2))),KIKS_COLOR_ROBOT,KIKS_REMOTEKHEP_MTRX(id,4));
    // !! L.72: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.72: Matlab function findobj not yet converted, original calling sequence used
    // L.72: Name conflict: function name changed from findobj to %findobj
    a = %findobj("Tag",sprintf("remoteKhep %d",id));
    mtlb_delete(a);
  end;
end;

KIKS_REMOTE_ARRAY = KIKS_REMOTE_ARRAY_NEW;
endfunction
