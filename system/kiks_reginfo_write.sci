function [] = kiks_reginfo_write()

// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);


// !! L.3: Matlab function gcf not yet converted
// !! L.3: Matlab function findobj not yet converted, original calling sequence used
// L.3: Name conflict: function name changed from findobj to %findobj
// !! L.3: Matlab function get not yet converted, original calling sequence used
// L.3: Name conflict: function name changed from get to %get
cde = mtlb_upper(%get(%findobj(mtlb(gcf),"Tag","cde"),"String"));
// !! L.4: Matlab function gcf not yet converted
// !! L.4: Matlab function findobj not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from findobj to %findobj
// !! L.4: Matlab function get not yet converted, original calling sequence used
// L.4: Name conflict: function name changed from get to %get
vfk = %get(%findobj(mtlb(gcf),"Tag","vfk"),"String");

// !! L.6: Matlab function gcf not yet converted
// !! L.6: Matlab function findobj not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from findobj to %findobj
// !! L.6: Matlab function get not yet converted, original calling sequence used
// L.6: Name conflict: function name changed from get to %get
lictype = %get(%findobj(mtlb(gcf),"Tag","lictype"),"Value");
// !! L.7: Matlab function gcf not yet converted
// !! L.7: Matlab function findobj not yet converted, original calling sequence used
// L.7: Name conflict: function name changed from findobj to %findobj
i = %findobj(mtlb(gcf),"Tag","licno");

if mtlb_logic(mtlb_double(lictype),"==",1) then
  lic = 0;
end;
if mtlb_logic(mtlb_double(lictype),"==",2) then
  lic = -mtlb_double(i);
end;
if mtlb_logic(mtlb_double(lictype),"==",3) then
  lic = %inf;
end;
// !! L.18: Matlab function which not yet converted, original calling sequence used
datapath = which("kiks_reginfo.mat");
if isempty(datapath) then
  datapath = kiks_getsystempath()+"kiks_reginfo";
end;

savematfile(datapath,"lic","cde","vfk");
// !! L.24: Matlab function gcf not yet converted
mtlb_close(mtlb(gcf));
endfunction
