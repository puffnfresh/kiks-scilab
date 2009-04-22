function [] = kiks_reginfo_lictypecall()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// !! L.3: Matlab function gcf not yet converted
// !! L.3: Matlab function findobj not yet converted, original calling sequence used
// L.3: Name conflict: function name changed from findobj to %findobj
h = %findobj(mtlb(gcf),"Tag","lictype");
// !! L.4: Matlab function get not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from get to %get
v = %get(h,"Value");
// !! L.5: Matlab function gcf not yet converted
// !! L.5: Matlab function findobj not yet converted, original calling sequence used
// L.5: Name conflict: function name changed from findobj to %findobj
i = %findobj(mtlb(gcf),"Tag","licno");
// !! L.6: Matlab function gcf not yet converted
// !! L.6: Matlab function findobj not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from findobj to %findobj
j = %findobj(mtlb(gcf),"Tag","licno_txt");
if mtlb_logic(mtlb_double(v),"==",2) then
  // !! L.8: Matlab function set not yet converted, original calling sequence used
  // L.8: Name conflict: function name changed from set to %set
  %set(i,"Visible","on");
  // !! L.9: Matlab function set not yet converted, original calling sequence used
  // L.9: Name conflict: function name changed from set to %set
  %set(j,"Visible","on");
else
  // !! L.11: Matlab function set not yet converted, original calling sequence used
  // L.11: Name conflict: function name changed from set to %set
  %set(i,"Visible","off");
  // !! L.12: Matlab function set not yet converted, original calling sequence used
  // L.12: Name conflict: function name changed from set to %set
  %set(j,"Visible","off");
end;
endfunction
