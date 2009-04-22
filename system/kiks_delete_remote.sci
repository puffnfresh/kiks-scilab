function [res] = kiks_delete_remote()

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
global("KIKS_2DVISUALIZE","KIKS_REMOTE_ARRAY","KIKS_COLOR_ROBOT");
entries = 8;// entries per object

if ~isempty(KIKS_REMOTE_ARRAY) then
  nr = size(mtlb_double(KIKS_REMOTE_ARRAY),1)/entries;
  for i = 0:nr-1
    id = mtlb_e(KIKS_REMOTE_ARRAY,1+i*entries);
    type = mtlb_e(KIKS_REMOTE_ARRAY,2+i*entries);
    x = mtlb_e(KIKS_REMOTE_ARRAY,3+i*entries);
    y = mtlb_e(KIKS_REMOTE_ARRAY,4+i*entries);
    r = floor(mtlb_double(mtlb_e(KIKS_REMOTE_ARRAY,6+i*entries)));
  
    kiks_arena_sub_mask(floor(mtlb_double(x)),floor(mtlb_double(y)),KIKS_COLOR_ROBOT,r);
    // !! L.19: Matlab function sprintf not yet converted, original calling sequence used
    // !! L.19: Matlab function findobj not yet converted, original calling sequence used
    // L.19: Name conflict: function name changed from findobj to %findobj
    a = %findobj("Tag",sprintf("remoteKhep %d",id));
    mtlb_delete(a);
  end;
end;

endfunction
