function [] = kiks_load()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// !! L.3: Matlab function uigetfile not yet converted, original calling sequence used
[filename,pathname] = uigetfile(makecell([2,1],"*.kad","*.tif"),"Load arena");

if max(size(mtlb_double(filename)))>1 then
  arena = [pathname,filename];
  kiks_arena(arena);
end;
endfunction
