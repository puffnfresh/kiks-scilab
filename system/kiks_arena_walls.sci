function [res] = kiks_arena_walls()

// Ouput variables initialisation (not found in input variables)
res=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

global("KIKS_ARENA_WALLS","KIKS_ARENA_COLORMASK_ORIG");

if isempty(KIKS_ARENA_WALLS) then
  // ! L.5: mtlb(KIKS_ARENA_COLORMASK_ORI) can be replaced by KIKS_ARENA_COLORMASK_ORI() or KIKS_ARENA_COLORMASK_ORI whether KIKS_ARENA_COLORMASK_ORI is an M-file or not
  // !! L.5: Scilab uint16() does not work with Complex values: uint16() call IGNORED !
  // ! L.5: mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI)) may be replaced by:
  // !    --> uint16(mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI))) if mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI)) is real
  // !! L.5: Unknown function kiks_generate_wall_polyg not converted, original calling sequence used
  // !! L.5: Scilab uint16() does not work with Complex values: uint16() call IGNORED !
  // ! L.5: mtlb_double(kiks_generate_wall_polyg(mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI)))) may be replaced by:
  // !    --> uint16(mtlb_double(kiks_generate_wall_polyg(mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI))))) if mtlb_double(kiks_generate_wall_polyg(mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI)))) is real
  KIKS_ARENA_WALLS = mtlb_double(kiks_generate_wall_polyg(mtlb_double(mtlb(KIKS_ARENA_COLORMASK_ORI))));
end;

res = KIKS_ARENA_WALLS;
endfunction
