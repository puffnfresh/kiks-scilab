function [coordinates] = kiks_blob2polygon(m,c,num)

// Ouput variables initialisation (not found in input variables)
coordinates=[];

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

// -----------------------------------------------------
//  (c) 2000-2004 Theodor Storm <theodor@tstorm.se>
//  http://www.tstorm.se
// -----------------------------------------------------


[ro,co] = mtlb_find(bool2s(mtlb_logic(mtlb_double(m),"==",mtlb_double(num))));
all_cont = c(mtlb_imp(min(ro,"m"),max(ro,"m")),mtlb_imp(min(co,"m"),max(co,"m")));
matr = m(mtlb_imp(min(ro,"m"),max(ro,"m")),mtlb_imp(min(co,"m"),max(co,"m")));
[rws,cls] = size(mtlb_double(matr));
cont = bool2s(mtlb_logic(mtlb_double(matr),"==",mtlb_double(num)))&bool2s(mtlb_logic(mtlb_double(all_cont),"==",1));
coordinates = [];
if size(cont)>1 then
  clear("matr","all_cont");
  [cont_rows,cont_cols] = mtlb_find(bool2s(mtlb_logic(bool2s(cont),"==",1)));
  cont_coords = [cont_rows,cont_cols];
  [rows,cols] = size(cont_coords);
  oldpc = 0;
  cont_coords = gsort(cont_coords,"lr","i");
  // sort cont_coords so distance between the points is minimized
  // !! L.22: Matlab function sprintf not yet converted, original calling sequence used
  // !! L.22: Unknown function kiks_status not converted, original calling sequence used
  kiks_status(sprintf("Generating coordinates from %d*%d blob (%d points)...\n<KiKS> ",rws,cls,rows));
  for i = 1:rows-1
    pc = round((i/rows)*10);
    if pc>oldpc then
      // !! L.26: Matlab function sprintf not yet converted, original calling sequence used
      // !! L.26: Unknown function kiks_status not converted, original calling sequence used
      kiks_status(sprintf("%d%%",pc*10));
      oldpc = pc;
    end;
    coords = cont_coords(i,:);
    mindist = %inf;
    ix = 0;
    substcoords = ones(rows-i,2);
    substcoords(:,1) = coords(1);
    substcoords(:,2) = coords(2);
    distcoords = abs(mtlb_s(cont_coords(i+1:$,:),substcoords))';
    sdist = sum(distcoords,"m");
    minpos = mtlb_find(bool2s(mtlb_logic(sdist,"==",min(sdist,"m"))));
    ix = minpos(1)+i;
  
    temp_pos = cont_coords(ix,:);
    cont_coords(ix,:) = cont_coords(i+1,:);
    cont_coords(i+1,:) = temp_pos;
  end;

  [rows,cols] = size(cont_coords);
  addmx = ones(rows,cols);
  addmx(:,1) = mtlb_a(addmx(:,1),min(ro,"m"));
  addmx(:,2) = mtlb_a(addmx(:,2),min(co,"m"));
  coordinates = mtlb_a(cont_coords,addmx);
  //coordinates=cont_coords(1,:);
  //for i=2:rows-1
  //    last=cont_coords(i-1,:);
  //    next=cont_coords(i+1,:);
  //    lastdiff=last-cont_coords(i,:);
  //    nextdiff=cont_coords(i,:)-next;
  //    if (lastdiff ~= nextdiff)
  //        coordinates = [coordinates; cont_coords(i,:)];    
  //    end;
  //end;
  //coordinates=[coordinates; cont_coords(end,:)];
  // !! L.61: Unknown function kiks_status not converted, original calling sequence used
  kiks_status("done.\n");
end;
endfunction
