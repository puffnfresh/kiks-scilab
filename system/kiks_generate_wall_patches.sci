function [] = kiks_generate_wall_patch(arena)

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------


KIKS_ARENA_CONTOUR = kiks_contour(arena);
// !! L.9: Matlab toolbox(es) function bwlabel not converted, original calling sequence used
[KIKS_ARENA_BWLABEL,nowallobjs] = bwlabel(arena,4);
// !! L.10: Matlab function figure not yet converted
// !! L.10: Matlab function figure not yet converted, original calling sequence used
figure;set(gca(),"auto_clear","off");
for i = mtlb_imp(1,mtlb_double(nowallobjs))
  KIKS_WALL_COORDS = kiks_blob2polygon(KIKS_ARENA_BWLABEL,KIKS_ARENA_CONTOUR,i);
  if ~isempty(KIKS_WALL_COORDS) then plot(KIKS_WALL_COORDS(:,2),KIKS_WALL_COORDS(:,1));end;
end;
endfunction
