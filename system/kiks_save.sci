function [] = kiks_save()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// !! L.3: Matlab function uiputfile not yet converted, original calling sequence used
[filename,pathname] = uiputfile(makecell([1,1],"*.kad"),"Save arena");

if max(size(mtlb_double(filename)))>1 then
  arena = [pathname,filename];
  // L.7: No equivalent for findstr() in Scilab so mtlb_findstr() is called

  if isempty(mtlb_findstr(mtlb_lower([pathname,filename]),".kad")) then
    arena = arena+".kad";
  end;
  //imwrite(uint8(KIKS_ARENA_COLORMASK_ORIG),arena,''TIFF'');
  //if isempty(KIKS_ARENA_WALLS)
  //    walls=kiks_generate_wall_polygons(KIKS_ARENA_COLORMASK_ORIG);
  //else
  //    walls=KIKS_ARENA_WALLS;
  //end;
  walls = kiks_arena_walls();
  savematfile(arena,"walls","-MAT");
  // !! L.18: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.18: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Saved arena to %s\n",arena));
end;

//function kiks_save
//global KIKS_ARENA_MASK_ORIG KIKS_ARENA_COLORMASK_ORIG

//[filename,pathname] = uiputfile((makecell([cell(),''*.tif''])),''Choose arena file to open'');

//if length(filename)>1
//    arena = [pathname filename];
//    if isempty(findstr(lower([pathname filename]),''.tif''))
//        arena = [arena ''.tif''];
//    end;
//    imwrite(uint8(KIKS_ARENA_COLORMASK_ORIG),arena,''TIFF'');
//end;
endfunction
