function [res] = kiks_siminfo_robotpath()

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
// kiks_siminfo_robotpath
// Returns a matrix of size [2,x] containing the coordinates
// of the path the simulated robot has moved since kiks_kopen
// was called.
global("KIKS_trace","KIKS_tracestep","KIKS_WALL_RENDER")

if ~isempty(KIKS_trace) then
  res(1,1:length(mtlb_s(mtlb_double(KIKS_trace(1,mtlb_imp(1,ceil(mtlb_double(mtlb_e(KIKS_tracestep,1)))),1)),mtlb_double(KIKS_WALL_RENDER)))) = mtlb_s(mtlb_double(KIKS_trace(1,mtlb_imp(1,ceil(mtlb_double(mtlb_e(KIKS_tracestep,1)))),1)),mtlb_double(KIKS_WALL_RENDER));
  res(2,:) = mtlb_s(mtlb_double(KIKS_trace(1,mtlb_imp(1,ceil(mtlb_double(mtlb_e(KIKS_tracestep,1)))),2)),mtlb_double(KIKS_WALL_RENDER));
else
  res = [];
end;
endfunction
