function [arena,colormap] = kiks_tif2arena(filename)

// Ouput variables initialisation (not found in input variables)
arena=[];
colormap=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------


try 
  // !! L.10: Matlab function imread not yet converted, original calling sequence used
  colormap = imread(filename,"tif");
  arena = ~mtlb_logic(mtlb_double(colormap),"==",0);
catch 
  arena = [];
  colormap = [];
  // !! L.15: Matlab function sprintf not yet converted, original calling sequence used
  kiks_status(sprintf("Warning: %s is not a valid TIF image file.\n",filename));
end;
endfunction
